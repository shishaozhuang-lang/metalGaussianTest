# RealityKit 3DGS (A3DGS) 逆向分析档案

生成:2026-10-24,工具:rea 6.5.0 + Ghidra 12.1.4(自编译 arm64 decompiler)+ metal-objdump(Metal toolchain 17.6)

## 关键发现

**着色器源码在本机!** `/System/Library/PrivateFrameworks/CoreRE3DGSFoundation.framework/Resources/default.metallib`
(236KB,版本 1.3.2,ProjectName=Apple3DGSRendering,macOS 26.6 预装;iPhone iOS 27.0 beta 为同族实现)。
`metal-objdump -ml -d <metallib>` 直接输出完整 LLVM AIR IR。

## 目录内容

| 路径 | 内容 |
|---|---|
| `shaders/full-air.ll` | 全部 46+ 着色器的 AIR LLVM IR(约 6200 行) |
| `shaders/per-shader/*.ll` | 每个着色器独立 IR 文件 |
| `shaders/MANIFEST.txt` | 着色器清单(按行数) |
| `shaders/reconstructed-MSL.metal` | 手工重建的 Metal Shading Language(核心 3 个 + 全量注释) |
| `decomp-*.c` | rea/Ghidra 反编译伪代码(blendpipeline/metalctx-cps/createsimpleasset/updateview/precompute/prefixsum/encoderender) |
| `decomp-*.json` | 同上的 rea Evidence 原始 JSON |
| `symbols.txt` | CoreRE3DGSFoundation(设备 iOS 27.0 beta 24A5418b)符号表 |

早期工作产物(伪代码/截图/trace 导出)曾存 `/tmp/rea-work2`,已被系统清理;`shaders/` 与 `decomp-*` 为持久副本。

## 着色器全清单(46)

排序:PrecomputeDistanceAndColor、RadixSortMakeHistogram/Reorder Kernel{16,256}_uint(1024 线程,radix 256=8bit/pass)、PrefixExclusiveSumKernel_uint_{true,false}、ReduceSumKernel_uint(simd_sum)、InitIndices、ClearBuffer、UpdateIndirectBuffer、ComputeIndexRange、ComputePrimitiveIndices
渲染:AlphaBlendVS/FS(EWA+解析抗锯齿)、PostAlphaBlendVS/FS(powr 曝光)、MPI*(多层图像/Freetime 动态高斯)、RasterPano*(全景)、RefineMPI/ComputeRefinementWeight
辅助:ComputeCov3D、ComputeColorFromSH、GetFragmentAlpha、Gaussian2DToPolygonOffset、Upscale{Float,Half,Texture}、Separable{Box,Min}Filter(AOTFR 上采样)、FlipYAxis、SetValue*/SetTextureValue*/ConcateDiffuseRest/NDCDepthToRealDepth

函数常量:kSplattingModePerspective、kLayeredRendering、kUseAntiAliasing、kEnableDepthWrites、kUseBackToFront

## 核心算法要点

1. **PrecomputeDistanceAndColor**(每帧计算,1 线程/splat):clip 变换 → 5 平面视锥剔除(带每点半径裕量,剔除点写 NaN 键)→ SH 求值(half 精度,一次/帧,不进 VS)→ 排序键 = |clip.z|(.depth)或 view 距离(.distance),**取倒数 1/d** 使升序基数排序=由远及近 → opacity 激活(exp/sigmoid/identity)→ half4 颜色写 texture_buffer
2. **AlphaBlendVS**:排序索引间接取属性(scale 步长 6 float),ComputeCov3D(exp 激活 3D 协方差+四元数旋转)→ 2D 投影 → 特征分解(atan2)→ Gaussian2DToPolygonOffset 四边形展开;uniform 含按 viewport 索引的矩阵数组(双目)
3. **GetFragmentAlpha/AlphaBlendFS**:非 AA=经典 EWA 二次型 `p=-½(a·dx²+c·dy²)-b·dx·dy`,截断阈值 clamp(u, -1e7, 0.01);**AA 路径=解析盒式滤波**(3σ 脚手架,sigmoid 边缘核 `F(d)=1/(1+exp((0.0693d²−0.8)d))`,覆盖率为 2π·σx·σy·ΔF 乘积)——即 SIGGRAPH'24 抗锯齿 3DGS 方案
4. GPU trace 中每帧两条 CB:A3DGS.GPUSortWorker.Sort → A3DGS.encodeRender,与符号完全对应
5. 管线按 BlendingVariant::Hash 缓存于 std::map,未命中现场重编译(Renderer.mm:849 校验中间颜色附件)
