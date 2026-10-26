// Reconstructed Metal Shading Language — Apple A3DGS (CoreRE3DGSFoundation 1.3.2)
// NOT original source. Hand-reconstructed from AIR LLVM IR (full-air.ll) by
// rea + metal-objdump analysis, 2026-10-24. Semantics faithful; syntax approximate.
// Structures/uniform layouts derived from IR GEP offsets; comments mark inferences.

#include <metal_stdlib>
using namespace metal;

// ---------------------------------------------------------------------------
// Shared types (reconstructed; field order from IR access patterns)
// ---------------------------------------------------------------------------

// Bound as [[buffer(N)]] vertex attributes; count = splat count
struct SplatAttributes {
    const device float3   *positions  [[buffer(0)]]; // float3
    const device float    *scales     [[buffer(1)]]; // float3 packed (log space)
    const device float4   *rotations  [[buffer(2)]]; // quat (w,x,y,z or x,y,z,w)
    const device float    *opacities  [[buffer(3)]]; // logit
    // SH: packed half3 coefficient planes, degree 0..3 (Coeff1/2/3Attribute in IR)
};

// VS uniform block — 412 bytes (from IR dereferenceable(412))
struct SplattingUniformsVS {           // offsets inferred from GEPs
    float4x4 viewProjMatrix;           // 0x000  world→clip
    float4x4 viewMatrix;               // 0x040  world→view (for covariance J)
    float3   camPos;                   // (used by SH eval in compute stage)
    float    focalX, focalY;           // tan-fov derived focal lengths
    float2   viewportSize;             // drawable pixels
    uint     splatCount;
    float    scaleFactor;              // splat enlargement for AABB margin
    // ... function-constant-like fields: perspective mode, layered, AA flags
};

// FS uniform block — 16 bytes
struct SplattingUniformsFS {
    float    alphaCutoffPower;  // i32 3: clamped [-1e7, 0.01]; discard threshold
    float    exposure;          // (last 4 bytes; PostAlphaBlend applies powr)
};

enum class ActivationType : int { identity = 0, exponential = 1, sigmoid = 2 };
enum class PrimitiveType   : uint { quad, /* expanded polygon */ polygon };

// Compute-stage uniforms — 260 bytes
struct PreComputeDistanceUniforms {
    float4x4 viewProj;          // i32 0: world→clip
    float4   frustumPlanes[5];  // i32 2: cull planes (plus per-splat margin)
    int      useFrustumCull;    // i32 5
    int      sortingMode;       // i32 4: 0 = |z| depth, else view-space distance
    int      opacityActivation; // i32 7: ActivationType
    int      inverseDistance;   // i32 8: if 0 → key = 1/dist (back-to-front radix)
    float3   camDirOrPos;       // i32 3: SH evaluation direction source
};

// ---------------------------------------------------------------------------
// Compute: per-frame sorting key + SH color + opacity activation  (1 thread/splat)
// Called from GPUSortWorker before radix sort; writes half4 color to a
// texture_buffer so the VS can fetch premultiplied color without re-evaluating SH.
// ---------------------------------------------------------------------------
kernel void PrecomputeDistanceAndColor(
    half    shOpacity           [[attribute(0)]],   // logit opacity (half)
    // attributes 1..16: Coeff1/2/3Attribute SH planes as half3 vertex attributes
    const device float3        *positions      [[buffer(0)]],
    const device float         *cullMargin     [[buffer(1)]],  // per-splat radius
    constant PreComputeDistanceUniforms &u    [[buffer(2)]],
    device float               *outKeys        [[buffer(3)]],  // sort keys
    texture_buffer<half4>       outColor       [[texture(0)]], // rgb = SH, a = alpha
    uint vid [[thread_position_in_grid]])
{
    float3 pos = positions[vid];
    float4 clip = u.viewProj * float4(pos, 1.0);

    // 5-plane frustum cull with per-splat margin; culled splats get NaN key
    if (u.useFrustumCull != 0) {
        float m = cullMargin[vid];
        for (int i = 0; i < 5; ++i)
            if (dot(clip, u.frustumPlanes[i]) + m < 0.0) {
                outKeys[vid] = NAN;      // IR stores 0x7FC00000
                return;
            }
    }

    // SH evaluation happens here, once per frame, not in the vertex stage:
    half3 color = ComputeColorFromSH(shOpacity, dcCoeff, coeff2, coeff3, pos, u.camDirOrPos);

    // Sorting key
    float key;
    if (u.sortingMode == 0) key = fabs(clip.z);                       // .depth
    else                    key = sqrt(dot(clip.xyz, clip.xyz));      // .distance
    if (u.inverseDistance == 0) key = 1.0 / key;   // radix is ascending → back-to-front

    // Opacity activation (GaussianSplatResource.opacityActivation, CPU passes via fn consts)
    half alpha;
    switch (u.opacityActivation) {
        case 1:  alpha = exp(shOpacity);            // .exponential
                 break;
        case 2:  alpha = 1.0h / (1.0h + exp(-shOpacity)); // .sigmoid
                 break;
        default: alpha = shOpacity;                 // .identity
    }

    outColor.write(half4(color, alpha), vid);
}

// ---------------------------------------------------------------------------
// Vertex: sorted quad expansion (instanced: 4 verts/splat via sorted index buffer)
// ---------------------------------------------------------------------------
struct VertexOutTriangle {
    float4 position [[position]];
    half4  color;        // rgb from texture_buffer, a = activated opacity
    float2 conic;        // EWA conic (a,b); (c carried in 3rd slot on FS side)
    float3 conicABC;
    float2 delta0;       // corner offset in pixels for FS gaussian eval
    float2 sigma2;       // AA path: per-axis sigma^2 for box filter
    uint   layerIndex [[render_target_array_index]];
    uint   viewportIndex [[viewport_array_index]];
};

vertex VertexOutTriangle AlphaBlendVS(
    const device uint          *sortedIndices [[buffer(0)]],  // radix output
    const device float        *scales        [[buffer(1)]],
    const device float3       *positions     [[buffer(2)]],
    texture_buffer<half4>      splatColor    [[texture(0)]],
    constant SplattingUniformsVS &u          [[buffer(3)]],
    const device float2       *quadCorners   [[buffer(4)]],   // 4 corner offsets
    uint vid [[vertex_id]], uint iid [[instance_id]], uint gid [[thread_position_in_grid]])
{
    // ComputeCov3D(scale, activationType, rotationQuat, focal, ...): 3D Σ from
    //   exp(scale) when scaleActivation == .exponential, rotated by quaternion
    // Project to 2D conic via J of viewProj (uses dot/atan2/sqrt: eigen decomposition)
    // Gaussian2DToPolygonOffset(primitiveType, conic, ringVerts, extent, cutoff):
    //   expands quad/polygon ring; kSplattingModePerspective selects perspective-
    //   correct scaling, kLayeredRendering picks layer/viewport array index.
    // Reads premultiplied half4 color+alpha from splatColor texture buffer.
    // kUseAntiAliasing: additionally outputs sigma^2 per axis (AA fragment path).
    ... // structural reconstruction; full IR in per-shader/AlphaBlendVS.ll
}

// ---------------------------------------------------------------------------
// Fragment: alpha evaluation — two paths selected by kUseAntiAliasing
// ---------------------------------------------------------------------------
fragment half4 AlphaBlendFS(
    constant SplattingUniformsFS &u [[buffer(0)]],
    VertexOutTriangle in)
{
    float power;
    if (!kUseAntiAliasing) {
        // Classic EWA conic evaluation: p = -0.5(a·dx² + c·dy²) - b·dx·dy
        float2 d = in.delta0;
        float  p = -0.5 * (in.conicABC.x * d.x * d.x + in.conicABC.z * d.y * d.y)
                   - in.conicABC.y * d.x * d.y;
        if (p > 0.0 || p < clamp(u.alphaCutoffPower, -1.0e7, 0.01))
            discard_fragment();                 // IR: flag → early out
        power = p;
    } else {
        // Analytic box-filtered coverage (anti-aliased 3DGS, ~SIGGRAPH'24):
        // 3σ footprint sampled at ±h (h = 0.5/max(σ, 2^-9)) through a sigmoid
        // edge kernel F(d) = 1/(1 + exp((0.0693·d² − 0.8)·d)); coverage is the
        // 2D product (F(3δ+h) − F(3δ−h))·σ scaled by 2π — no per-pixel exp of
        // the full gaussian, and correct under minification.
        float2 s = in.sigma2;
        float2 h = 0.5 / max(s, 0.001953125);
        float2 d = 3.0 * in.delta0;
        auto F = [](float2 x) {
            return 1.0 / (1.0 + exp((0.06934 * x * x - 0.8) * x));
        };
        power = (F(d + h) - F(d - h)).x * s.x * 6.2831853 * (F(d + h) - F(d - h)).y * s.y;
    }
    float alpha = in.color.a * exp2(power * 1.4427); // ≈ exp(power); IR uses fast_exp variants
    if (alpha < 1.0/255.0) discard_fragment();
    // kEnableDepthWrites: optional depth write of the gaussian peak depth
    // kUseBackToFront: front-to-back variant swaps blend factors on CPU side
    return half4(in.color.rgb * (half)alpha, (half)alpha); // premultiplied out
}

// ---------------------------------------------------------------------------
// Radix sort kernels — GPU global sort, 8 bits/pass (radix 256), block 1024
//   RadixSortMakeHistogramKernel<blockSize=1024, T=uint, RADIX=256>
//     sharedHistogram[256]; atomic local add; wg.barrier; global scatter
//   RadixSortReorderKernel<blockSize=1024, simdSize=32, T=uint, RADIX=256>
//     shared_input_indices/keys, extract_bits(key, 8*pass, 8), prefix sums,
//     popcount-based flags, stable scatter → next index buffer
//   Kernel16 variants: radix 16 (4 bits/pass) for small workloads
//   PrefixExclusiveSumKernel_uint_{singlePass,groupScan}: 256-wide scans with
//     air.simd_prefix_exclusive_sum; ReduceSumKernel<1024,32> uses simd_sum.
//   Keys are float→order-preserving uint (1/d trick makes ascending = far→near).
// Full IR: per-shader/RadixSort*.ll, per-shader/PrefixExclusiveSum*.ll
// ---------------------------------------------------------------------------

// PostAlphaBlendFS: composite of offscreen splat layer into scene;
//   powr(rgb, exposure) — 3-component half pow — then standard blending.
// UpdateIndirectBuffer: derives draw call vertex counts from sorted count
//   (abs of a signed count field), writes MTLDrawIndirectArgumentArray.
// AOTFR path: PostAlphaBlendAOTFRFS + Upscale*/SeparableBoxFilter/MinFilter
//   composite low-res splat layers through MTLRasterizationRateMap.
// MPI* + RasterPano* + RefineMPI/ComputeRefinementWeight: layered (multi-plane
//   image) video path used by Freetime/TV dynamic splats — separate pipeline.
