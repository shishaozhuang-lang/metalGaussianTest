define <{ <4 x float>, i32 }> @PostAlphaBlendVS(i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 2
  %4 = select fast i1 %3, float 3.000000e+00, float -1.000000e+00
  %5 = insertelement <4 x float> undef, float %4, i64 0
  %6 = icmp eq i32 %1, 0
  %7 = select fast i1 %6, float -3.000000e+00, float 1.000000e+00
  %8 = insertelement <4 x float> %5, float %7, i64 1
  %9 = shufflevector <4 x float> %8, <4 x float> <float 1.000000e+00, float 1.000000e+00, float poison, float poison>, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %10 = load i32, i32 addrspace(2)* %0, align 4, !tbaa !22, !alias.scope !26
  %11 = insertvalue <{ <4 x float>, i32 }> undef, <4 x float> %9, 0
  %12 = insertvalue <{ <4 x float>, i32 }> %11, i32 %10, 1
  ret <{ <4 x float>, i32 }> %12
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.vertex = !{!15}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 26, i32 6, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{i32 7, !"air.max_device_buffers", i32 31}
!4 = !{i32 7, !"air.max_constant_buffers", i32 31}
!5 = !{i32 7, !"air.max_threadgroup_buffers", i32 31}
!6 = !{i32 7, !"air.max_textures", i32 128}
!7 = !{i32 7, !"air.max_read_write_textures", i32 8}
!8 = !{i32 7, !"air.max_samplers", i32 16}
!9 = !{!"Apple metal version 32023.886 (metalfe-32023.886.1)"}
!10 = !{i32 2, i32 7, i32 0}
!11 = !{!"Metal", i32 3, i32 2, i32 0}
!12 = !{!"air.compile.denorms_disable"}
!13 = !{!"air.compile.fast_math_enable"}
!14 = !{!"air.compile.framebuffer_fetch_enable"}
!15 = !{<{ <4 x float>, i32 }> (i32 addrspace(2)*, i32)* @PostAlphaBlendVS, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!18 = !{!"air.render_target_array_index", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!19 = !{!20, !21}
!20 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!21 = !{i32 1, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"vid"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(0)"}
!28 = distinct !{!28, !"air-alias-scopes(PostAlphaBlendVS)"}

0x0000000002d300 -- AlphaBlendFS:
source_filename = "AlphaBlendFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.apple3dgs::SplattingUniformsFS" = type { i32, i32, float, float }
%struct.AlphaResult = type <{ half, i8, i8 }>

@__metal_implicit_fc_pred_0 = internal addrspace(2) global i8 0, align 1
@__metal_implicit_fc_pred_1 = internal addrspace(2) global i8 0, align 1
@__metal_implicit_fc_pred_2 = internal addrspace(2) global i8 0, align 1
@__metal_implicit_fc_pred_3 = internal addrspace(2) global i8 0, align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_GSRenderer.metal, i8* null }]
@_ZL18kEnableDepthWrites = internal unnamed_addr addrspace(2) global i8 0, align 1
@_ZL15kUseBackToFront = internal unnamed_addr addrspace(2) global i8 undef, align 1
@_Z15kUseBackToFront.MTL_FC_INIT_4_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@_ZL16kUseAntiAliasing = internal unnamed_addr addrspace(2) global i8 undef, align 1
@_Z16kUseAntiAliasing.MTL_FC_INIT_3_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@_Z17kLayeredRendering.MTL_FC_INIT_1_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@llvm.compiler.used = appending global [4 x i8*] [i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_0 to i8*), i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_1 to i8*), i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_2 to i8*), i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_3 to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree nosync nounwind willreturn
