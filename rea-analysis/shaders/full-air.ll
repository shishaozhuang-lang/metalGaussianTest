/System/Library/PrivateFrameworks/CoreRE3DGSFoundation.framework/Resources/default.metallib:
Disassembly of section MODULE_LIST:

0x00000000001be0 -- ComputeRefinementWeight:
source_filename = "ComputeRefinementWeight"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._depth_2d_t = type opaque
%struct._texture_2d_t = type opaque
%"struct.metal::matrix.38" = type { [3 x <3 x float>] }
%"struct.metal::array.4" = type { [4 x <2 x i32>] }
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.2 = internal addrspace(2) constant [2 x i64] [i64 34901797601053257, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define void @ComputeRefinementWeight(%struct._depth_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %2, <2 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = alloca %"struct.metal::array.4", align 8
  %6 = tail call i32 @air.get_width_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 0) #6, !alias.scope !23, !noalias !26
  %7 = tail call i32 @air.get_height_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 0) #6, !alias.scope !23, !noalias !26
  %8 = tail call i32 @air.max.u.i32(i32 %6, i32 %7) #7
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #7
  %10 = fmul fast float %9, 0x3F589374C0000000
  %11 = tail call i32 @air.convert.u.i32.f.f32(float %10) #7
  %12 = tail call i32 @air.max.u.i32(i32 1, i32 %11) #7
  %13 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %3) #7
  %14 = fadd fast <2 x float> %13, <float 5.000000e-01, float 5.000000e-01>
  %15 = tail call { float, i8 } @air.sample_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.2 to %struct._sampler_t addrspace(2)*), i32 1, <2 x float> %14, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %16 = extractvalue { float, i8 } %15, 0
  %17 = bitcast %"struct.metal::array.4"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %17) #9
  %18 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 0
  store <2 x i32> <i32 0, i32 1>, <2 x i32>* %18, align 8
  %19 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 1
  store <2 x i32> <i32 0, i32 -1>, <2 x i32>* %19, align 8
  %20 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 2
  store <2 x i32> <i32 1, i32 0>, <2 x i32>* %20, align 8
  %21 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 3
  store <2 x i32> <i32 -1, i32 0>, <2 x i32>* %21, align 8
  %22 = icmp eq i32 %12, 0
  br label %23

23:                                               ; preds = %64, %4
  %24 = phi float [ 0.000000e+00, %4 ], [ %65, %64 ]
  %25 = phi i32 [ 0, %4 ], [ %66, %64 ]
  br i1 %22, label %64, label %26

26:                                               ; preds = %23
  %27 = zext i32 %25 to i64
  %28 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 %27
  %29 = load <2 x i32>, <2 x i32>* %28, align 8, !tbaa !28
  br label %68

30:                                               ; preds = %64
  %31 = tail call fast float @air.fast_fmax.f32(float %65, float 0.000000e+00) #7
  %32 = fmul fast float %31, 2.000000e+01
  %33 = tail call fast float @air.fast_clamp.f32(float %32, float -2.000000e+01, float 2.000000e+01) #7
  %34 = tail call fast float @air.fast_tanh.f32(float %33) #7
  %35 = fsub fast float 5.000000e-01, %34
  %36 = fmul fast float %35, 2.000000e+01
  %37 = tail call fast float @air.fast_exp.f32(float %36) #7
  %38 = fadd fast float %37, 1.000000e+00
  %39 = fdiv fast float 1.000000e+00, %38
  %40 = bitcast float %39 to i32
  %41 = and i32 %40, 2147483647
  %42 = icmp ugt i32 %41, 2139095040
  %43 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #6, !alias.scope !23, !noalias !26
  %44 = tail call fast float @air.convert.f.f32.u.i32(i32 %43) #7
  %45 = insertelement <2 x float> undef, float %44, i64 0
  %46 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #6, !alias.scope !23, !noalias !26
  %47 = tail call fast float @air.convert.f.f32.u.i32(i32 %46) #7
  %48 = insertelement <2 x float> %45, float %47, i64 1
  %49 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 0
  %50 = load <3 x float>, <3 x float> addrspace(2)* %49, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %51 = shufflevector <2 x float> %13, <2 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %52 = fmul fast <3 x float> %50, %51
  %53 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 1
  %54 = load <3 x float>, <3 x float> addrspace(2)* %53, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %55 = shufflevector <2 x float> %13, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %56 = fmul fast <3 x float> %54, %55
  %57 = fadd fast <3 x float> %56, %52
  %58 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 2
  %59 = load <3 x float>, <3 x float> addrspace(2)* %58, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %60 = fadd fast <3 x float> %57, %59
  %61 = shufflevector <3 x float> %60, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %62 = fcmp fast olt <2 x float> %61, zeroinitializer
  %63 = tail call i1 @air.any.v2i1(<2 x i1> %62) #7
  br i1 %63, label %83, label %80

64:                                               ; preds = %68, %23
  %65 = phi float [ %24, %23 ], [ %78, %68 ]
  %66 = add nuw nsw i32 %25, 1
  %67 = icmp eq i32 %66, 4
  br i1 %67, label %30, label %23, !llvm.loop !31

68:                                               ; preds = %68, %26
  %69 = phi float [ %24, %26 ], [ %78, %68 ]
  %70 = phi i32 [ 0, %26 ], [ %71, %68 ]
  %71 = add nuw i32 %70, 1
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = shufflevector <2 x i32> %72, <2 x i32> poison, <2 x i32> zeroinitializer
  %74 = mul <2 x i32> %73, %29
  %75 = tail call { float, i8 } @air.sample_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.2 to %struct._sampler_t addrspace(2)*), i32 1, <2 x float> %14, i1 true, <2 x i32> %74, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %76 = extractvalue { float, i8 } %75, 0
  %77 = fsub fast float %76, %16
  %78 = tail call fast float @air.fast_fmax.f32(float %69, float %77) #7
  %79 = icmp eq i32 %71, %12
  br i1 %79, label %64, label %68, !llvm.loop !33

80:                                               ; preds = %30
  %81 = fcmp fast oge <2 x float> %61, %48
  %82 = tail call i1 @air.any.v2i1(<2 x i1> %81) #7
  br i1 %82, label %83, label %84

83:                                               ; preds = %80, %30
  tail call void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x half> <half 0xH0000, half 0xH0000, half 0xH0000, half 0xH3C00>, i32 0, i32 2) #10, !alias.scope !23, !noalias !26
  br label %100

84:                                               ; preds = %80
  %85 = fsub fast <2 x float> %48, %61
  %86 = extractelement <2 x float> %85, i64 0
  %87 = extractelement <2 x float> %85, i64 1
  %88 = extractelement <3 x float> %60, i64 0
  %89 = tail call fast float @air.fast_fmin3.f32(float %86, float %87, float %88) #7
  %90 = extractelement <3 x float> %60, i64 1
  %91 = tail call fast float @air.fast_fmin.f32(float %89, float %90) #7
  %92 = fmul fast float %91, 0x3FA99999A0000000
  %93 = tail call fast float @air.fast_clamp.f32(float %92, float -2.000000e+01, float 2.000000e+01) #7
  %94 = tail call fast float @air.fast_tanh.f32(float %93) #7
  %95 = fsub fast float 1.000000e+00, %39
  %96 = select i1 %42, float 1.000000e+00, float %95
  %97 = fmul fast float %94, %96
  %98 = fptrunc float %97 to half
  %99 = insertelement <4 x half> <half poison, half 0xH0000, half 0xH0000, half 0xH3C00>, half %98, i64 0
  tail call void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x half> %99, i32 0, i32 2) #10, !alias.scope !23, !noalias !26
  br label %100

100:                                              ; preds = %84, %83
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %17) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x half>, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_tanh.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_clamp.f32(float, float, float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fmin.f32(float, float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fmin3.f32(float, float, float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i1 @air.any.v2i1(<2 x i1>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #3

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { float, i8 } @air.sample_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, i32, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_exp.f32(float) local_unnamed_addr #3

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.max.u.i32(i32, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.convert.u.i32.f.f32(float) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #5

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="96" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #5 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #6 = { argmemonly nounwind readonly willreturn }
attributes #7 = { nounwind readnone willreturn }
attributes #8 = { argmemonly convergent nounwind readonly willreturn }
attributes #9 = { nounwind }
attributes #10 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}
!air.sampler_states = !{!22}

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
!15 = !{void (%struct._depth_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %"struct.metal::matrix.38" addrspace(2)*, <2 x i32>)* @ComputeRefinementWeight, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"depth2d<float, sample>", !"air.arg_name", !"ndc_depths"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<half, write>", !"air.arg_name", !"refinement_weight_map"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 48, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 48, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float3x3", !"air.arg_name", !"transform_mpi_to_image"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!22 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.2}
!23 = !{!24}
!24 = distinct !{!24, !25, !"air-alias-scope-textures"}
!25 = distinct !{!25, !"air-alias-scopes(ComputeRefinementWeight)"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"air-alias-scope-arg(2)"}
!28 = !{!29, !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = distinct !{!31, !32}
!32 = !{!"llvm.loop.mustprogress"}
!33 = distinct !{!33, !32}

0x00000000003530 -- MPIVS:
source_filename = "MPIVS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.metal::matrix.1" = type { [4 x <4 x float>] }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree nosync nounwind readonly willreturn
define <{ <4 x float>, <2 x float>, i32 }> @MPIVS(<2 x float> addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, %"struct.metal::matrix.1" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %0, i64 %6
  %8 = load <2 x float>, <2 x float> addrspace(1)* %7, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %9 = fmul fast <2 x float> %8, <float 2.000000e+00, float 2.000000e+00>
  %10 = fadd fast <2 x float> %9, <float -1.000000e+00, float -1.000000e+00>
  %11 = tail call fast float @air.convert.f.f32.u.i32(i32 %3) #2
  %12 = fadd fast float %11, 5.000000e-01
  %13 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !35, !alias.scope !37, !noalias !38
  %14 = tail call fast float @air.convert.f.f32.u.i32(i32 %13) #2
  %15 = fdiv fast float %12, %14
  %16 = extractelement <2 x float> %10, i64 0
  %17 = fadd fast float %16, 1.000000e+00
  %18 = fmul fast float %17, 5.000000e-01
  %19 = insertelement <2 x float> undef, float %18, i64 0
  %20 = extractelement <2 x float> %10, i64 1
  %21 = fsub fast float 1.000000e+00, %20
  %22 = fmul fast float %21, 5.000000e-01
  %23 = insertelement <2 x float> %19, float %22, i64 1
  %24 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 0
  %25 = load <4 x float>, <4 x float> addrspace(2)* %24, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %26 = shufflevector <2 x float> %10, <2 x float> undef, <4 x i32> zeroinitializer
  %27 = fmul fast <4 x float> %25, %26
  %28 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 1
  %29 = load <4 x float>, <4 x float> addrspace(2)* %28, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %30 = shufflevector <2 x float> %10, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %31 = fmul fast <4 x float> %29, %30
  %32 = fadd fast <4 x float> %31, %27
  %33 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 2
  %34 = load <4 x float>, <4 x float> addrspace(2)* %33, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %35 = insertelement <4 x float> poison, float %15, i64 0
  %36 = shufflevector <4 x float> %35, <4 x float> poison, <4 x i32> zeroinitializer
  %37 = fmul fast <4 x float> %34, %36
  %38 = fadd fast <4 x float> %32, %37
  %39 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 3
  %40 = load <4 x float>, <4 x float> addrspace(2)* %39, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %41 = fadd fast <4 x float> %38, %40
  %42 = insertvalue <{ <4 x float>, <2 x float>, i32 }> undef, <4 x float> %41, 0
  %43 = insertvalue <{ <4 x float>, <2 x float>, i32 }> %42, <2 x float> %23, 1
  %44 = insertvalue <{ <4 x float>, <2 x float>, i32 }> %43, i32 %3, 2
  ret <{ <4 x float>, <2 x float>, i32 }> %44
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #1

attributes #0 = { argmemonly mustprogress nofree nosync nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { nounwind readnone willreturn }

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
!15 = !{<{ <4 x float>, <2 x float>, i32 }> (<2 x float> addrspace(1)*, %"struct.metal::matrix.1" addrspace(2)*, i32 addrspace(2)*, i32, i32)* @MPIVS, !16, !20}
!16 = !{!17, !18, !19}
!17 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos"}
!18 = !{!"air.vertex_output", !"generated(2uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!19 = !{!"air.vertex_output", !"generated(5layerj)", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!20 = !{!21, !22, !23, !24, !25}
!21 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"float2", !"air.arg_name", !"vertices"}
!22 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 64, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 64, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4x4", !"air.arg_name", !"warp"}
!23 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"max_layers"}
!24 = !{i32 3, !"air.instance_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!25 = !{i32 4, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"vid"}
!26 = !{!27, !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !"air-alias-scopes(MPIVS)"}
!32 = !{!33, !34}
!33 = distinct !{!33, !31, !"air-alias-scope-arg(1)"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(2)"}
!35 = !{!36, !36, i64 0}
!36 = !{!"int", !27, i64 0}
!37 = !{!34}
!38 = !{!30, !33}
!39 = !{!33}
!40 = !{!30, !34}

0x000000000045a0 -- RasterPanoVS:
source_filename = "RasterPanoVS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque
%"struct.metal::matrix.1" = type { [4 x <4 x float>] }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nofree nounwind readonly willreturn
define <{ <4 x float>, <2 x float> }> @RasterPanoVS(%struct._texture_2d_t addrspace(1)* %0, %"struct.metal::matrix.1" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %1, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, i32 0) #3, !alias.scope !25, !noalias !28
  %7 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, i32 0) #3, !alias.scope !25, !noalias !28
  %8 = lshr i32 %3, 1
  %9 = and i32 %3, 1
  %10 = add i32 %9, %4
  %11 = insertelement <2 x i32> undef, i32 %8, i64 0
  %12 = insertelement <2 x i32> %11, i32 %10, i64 1
  %13 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, <2 x i32> %12, i32 0, i32 1) #3, !alias.scope !25, !noalias !28
  %14 = extractvalue { <4 x float>, i8 } %13, 0
  %15 = extractelement <4 x float> %14, i64 0
  %16 = load float, float addrspace(2)* %2, align 4, !tbaa !31, !alias.scope !35, !noalias !36
  %17 = fmul fast float %15, %16
  %18 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %12) #4
  %19 = fadd fast <2 x float> %18, <float 5.000000e-01, float 5.000000e-01>
  %20 = tail call fast float @air.convert.f.f32.u.i32(i32 %6) #4
  %21 = insertelement <2 x float> undef, float %20, i64 0
  %22 = tail call fast float @air.convert.f.f32.u.i32(i32 %7) #4
  %23 = insertelement <2 x float> %21, float %22, i64 1
  %24 = fdiv fast <2 x float> %19, %23
  %25 = extractelement <2 x float> %24, i64 0
  %26 = fmul fast float %25, 0x401921FB60000000
  %27 = extractelement <2 x float> %24, i64 1
  %28 = fmul fast float %27, 0x400921FB60000000
  %29 = insertelement <3 x float> poison, float %17, i64 0
  %30 = shufflevector <3 x float> %29, <3 x float> poison, <3 x i32> zeroinitializer
  %31 = tail call fast float @air.fast_sin.f32(float %28) #4
  %32 = tail call fast float @air.fast_sin.f32(float %26) #4
  %33 = fmul fast float %32, %31
  %34 = tail call fast float @air.fast_cos.f32(float %28) #4
  %35 = fneg fast float %34
  %36 = fneg fast float %31
  %37 = tail call fast float @air.fast_cos.f32(float %26) #4
  %38 = fmul fast float %37, %36
  %39 = insertelement <3 x float> undef, float %33, i64 0
  %40 = insertelement <3 x float> %39, float %35, i64 1
  %41 = insertelement <3 x float> %40, float %38, i64 2
  %42 = fmul fast <3 x float> %41, %30
  %43 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 0
  %44 = load <4 x float>, <4 x float> addrspace(2)* %43, align 16, !tbaa !37, !alias.scope !38, !noalias !39
  %45 = shufflevector <3 x float> %42, <3 x float> undef, <4 x i32> zeroinitializer
  %46 = fmul fast <4 x float> %45, %44
  %47 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 1
  %48 = load <4 x float>, <4 x float> addrspace(2)* %47, align 16, !tbaa !37, !alias.scope !38, !noalias !39
  %49 = shufflevector <3 x float> %42, <3 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %50 = fmul fast <4 x float> %49, %48
  %51 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 2
  %52 = load <4 x float>, <4 x float> addrspace(2)* %51, align 16, !tbaa !37, !alias.scope !38, !noalias !39
  %53 = shufflevector <3 x float> %42, <3 x float> undef, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %54 = fmul fast <4 x float> %53, %52
  %55 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 3
  %56 = load <4 x float>, <4 x float> addrspace(2)* %55, align 16, !tbaa !37, !alias.scope !38, !noalias !39
  %57 = fadd fast <4 x float> %50, %56
  %58 = fadd fast <4 x float> %57, %46
  %59 = fadd fast <4 x float> %58, %54
  %60 = insertvalue <{ <4 x float>, <2 x float> }> undef, <4 x float> %59, 0
  %61 = insertvalue <{ <4 x float>, <2 x float> }> %60, <2 x float> %24, 1
  ret <{ <4 x float>, <2 x float> }> %61
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_cos.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_sin.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, <2 x i32>, i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #2

attributes #0 = { mustprogress nofree nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #3 = { argmemonly nounwind readonly willreturn }
attributes #4 = { nounwind readnone willreturn }

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
!15 = !{<{ <4 x float>, <2 x float> }> (%struct._texture_2d_t addrspace(1)*, %"struct.metal::matrix.1" addrspace(2)*, float addrspace(2)*, i32, i32)* @RasterPanoVS, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos"}
!18 = !{!"air.vertex_output", !"generated(2uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!19 = !{!20, !21, !22, !23, !24}
!20 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.read", !"air.arg_type_name", !"texture2d<float, read>", !"air.arg_name", !"depthmap_in"}
!21 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 64, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 64, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4x4", !"air.arg_name", !"mvp"}
!22 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"depth_scale"}
!23 = !{i32 3, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"vID"}
!24 = !{i32 4, !"air.instance_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"iID"}
!25 = !{!26}
!26 = distinct !{!26, !27, !"air-alias-scope-textures"}
!27 = distinct !{!27, !"air-alias-scopes(RasterPanoVS)"}
!28 = !{!29, !30}
!29 = distinct !{!29, !27, !"air-alias-scope-arg(1)"}
!30 = distinct !{!30, !27, !"air-alias-scope-arg(2)"}
!31 = !{!32, !32, i64 0}
!32 = !{!"float", !33, i64 0}
!33 = !{!"omnipotent char", !34, i64 0}
!34 = !{!"Simple C++ TBAA"}
!35 = !{!30}
!36 = !{!26, !29}
!37 = !{!33, !33, i64 0}
!38 = !{!29}
!39 = !{!26, !30}

0x00000000005880 -- MPIFS:
source_filename = "MPIFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_array_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601020489, i64 0], align 8

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
define <4 x half> @MPIFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %1, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #2
  %6 = extractvalue { <4 x half>, i8 } %5, 0
  ret <4 x half> %6
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i32, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #1

attributes #0 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #2 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!23}

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
!15 = !{<4 x half> (<4 x float>, <2 x float>, i32, %struct._texture_2d_array_t addrspace(1)*)* @MPIFS, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"half4"}
!18 = !{!19, !20, !21, !22}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(2uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!21 = !{i32 2, !"air.fragment_input", !"generated(5layerj)", !"air.flat", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!22 = !{i32 3, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d_array<half, sample>", !"air.arg_name", !"colors"}
!23 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.1}

0x000000000066d0 -- MPIRGBDFS:
source_filename = "MPIRGBDFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_array_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.1 = internal addrspace(2) constant [2 x i64] [i64 34901797601020489, i64 0], align 8

; Function Attrs: convergent mustprogress nofree nounwind readonly willreturn
define <{ <4 x half>, <4 x half> }> @MPIRGBDFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* %3, %struct._texture_2d_array_t addrspace(1)* %4, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = tail call i32 @air.get_width_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, i32 0) #4, !alias.scope !27, !noalias !30
  %8 = tail call i32 @air.get_height_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, i32 0) #4, !alias.scope !27, !noalias !30
  %9 = icmp eq i32 %7, %8
  %10 = load float, float addrspace(2)* %5, align 4, !tbaa !32
  br i1 %9, label %11, label %24

11:                                               ; preds = %6
  %12 = fcmp fast ogt float %10, 1.000000e+00
  %13 = tail call fast float @air.convert.f.f32.u.i32(i32 %7) #5
  br i1 %12, label %14, label %19

14:                                               ; preds = %11
  %15 = fdiv fast float %13, %10
  %16 = fsub fast float %13, %15
  %17 = fmul fast float %16, 5.000000e-01
  %18 = fdiv fast float %17, %13
  br label %24

19:                                               ; preds = %11
  %20 = fmul fast float %13, %10
  %21 = fsub fast float %13, %20
  %22 = fmul fast float %21, 5.000000e-01
  %23 = fdiv fast float %22, %13
  br label %24

24:                                               ; preds = %19, %14, %6
  %25 = phi float [ %18, %14 ], [ %23, %19 ], [ 0.000000e+00, %6 ]
  %26 = fmul fast float %25, 2.000000e+00
  %27 = fsub fast float 1.000000e+00, %26
  %28 = fcmp fast ogt float %10, 1.000000e+00
  br i1 %28, label %29, label %34

29:                                               ; preds = %24
  %30 = extractelement <2 x float> %1, i64 1
  %31 = fmul fast float %27, %30
  %32 = fadd fast float %31, %25
  %33 = insertelement <2 x float> %1, float %32, i64 1
  br label %39

34:                                               ; preds = %24
  %35 = extractelement <2 x float> %1, i64 0
  %36 = fmul fast float %27, %35
  %37 = fadd fast float %36, %25
  %38 = insertelement <2 x float> %1, float %37, i64 0
  br label %39

39:                                               ; preds = %34, %29
  %40 = phi <2 x float> [ %33, %29 ], [ %38, %34 ]
  %41 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %40, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %42 = extractvalue { <4 x half>, i8 } %41, 0
  %43 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %4, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %40, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %44 = extractvalue { <4 x half>, i8 } %43, 0
  %45 = shufflevector <4 x half> %44, <4 x half> <half poison, half 0xH0000, half 0xH0000, half poison>, <4 x i32> <i32 0, i32 5, i32 6, i32 undef>
  %46 = shufflevector <4 x half> %45, <4 x half> %42, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %47 = insertvalue <{ <4 x half>, <4 x half> }> undef, <4 x half> %42, 0
  %48 = insertvalue <{ <4 x half>, <4 x half> }> %47, <4 x half> %46, 1
  ret <{ <4 x half>, <4 x half> }> %48
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i32, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nofree nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #4 = { argmemonly nounwind readonly willreturn }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!26}

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
!15 = !{<{ <4 x half>, <4 x half> }> (<4 x float>, <2 x float>, i32, %struct._texture_2d_array_t addrspace(1)*, %struct._texture_2d_array_t addrspace(1)*, float addrspace(2)*)* @MPIRGBDFS, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"rgba"}
!18 = !{!"air.render_target", i32 1, i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"depth"}
!19 = !{!20, !21, !22, !23, !24, !25}
!20 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos", !"air.arg_unused"}
!21 = !{i32 1, !"air.fragment_input", !"generated(2uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!22 = !{i32 2, !"air.fragment_input", !"generated(5layerj)", !"air.flat", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!23 = !{i32 3, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d_array<half, sample>", !"air.arg_name", !"colors"}
!24 = !{i32 4, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d_array<half, sample>", !"air.arg_name", !"depths"}
!25 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"aspect_ratio"}
!26 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.1}
!27 = !{!28}
!28 = distinct !{!28, !29, !"air-alias-scope-textures"}
!29 = distinct !{!29, !"air-alias-scopes(MPIRGBDFS)"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"air-alias-scope-arg(5)"}
!32 = !{!33, !33, i64 0}
!33 = !{!"float", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C++ TBAA"}

0x00000000007940 -- MPIRefineFS:
source_filename = "MPIRefineFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_array_t = type opaque
%struct._texture_2d_t = type opaque
%"struct.metal::matrix.38" = type { [3 x <3 x float>] }
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind willreturn
define void @MPIRefineFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* %3, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %8, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %9) local_unnamed_addr #0 {
  %11 = load i32, i32 addrspace(2)* %8, align 4, !tbaa !29, !alias.scope !33, !noalias !36
  %12 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #6, !alias.scope !39, !noalias !40
  %13 = tail call fast float @air.convert.f.f32.u.i32(i32 %12) #7
  %14 = insertelement <2 x float> undef, float %13, i64 0
  %15 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #6, !alias.scope !39, !noalias !40
  %16 = tail call fast float @air.convert.f.f32.u.i32(i32 %15) #7
  %17 = insertelement <2 x float> %14, float %16, i64 1
  %18 = fmul fast <2 x float> %17, %1
  %19 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6, !alias.scope !39, !noalias !40
  %20 = tail call fast float @air.convert.f.f32.u.i32(i32 %19) #7
  %21 = insertelement <2 x float> undef, float %20, i64 0
  %22 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6, !alias.scope !39, !noalias !40
  %23 = tail call fast float @air.convert.f.f32.u.i32(i32 %22) #7
  %24 = insertelement <2 x float> %21, float %23, i64 1
  %25 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 0
  %26 = load <3 x float>, <3 x float> addrspace(2)* %25, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %27 = shufflevector <2 x float> %18, <2 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %28 = fmul fast <3 x float> %26, %27
  %29 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 1
  %30 = load <3 x float>, <3 x float> addrspace(2)* %29, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %31 = shufflevector <2 x float> %18, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %32 = fmul fast <3 x float> %30, %31
  %33 = fadd fast <3 x float> %32, %28
  %34 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 2
  %35 = load <3 x float>, <3 x float> addrspace(2)* %34, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %36 = fadd fast <3 x float> %33, %35
  %37 = shufflevector <3 x float> %36, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %38 = fcmp fast olt <2 x float> %37, zeroinitializer
  %39 = tail call i1 @air.any.v2i1(<2 x i1> %38) #7
  br i1 %39, label %43, label %40

40:                                               ; preds = %10
  %41 = fcmp fast oge <2 x float> %37, %24
  %42 = tail call i1 @air.any.v2i1(<2 x i1> %41) #7
  br label %43

43:                                               ; preds = %40, %10
  %44 = phi i1 [ true, %10 ], [ %42, %40 ]
  %45 = xor i32 %2, -1
  %46 = add i32 %11, %45
  %47 = fdiv fast <2 x float> %37, %24
  %48 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %18) #7
  %49 = tail call { <4 x float>, i8 } @air.read_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, <2 x i32> %48, i32 %46, i32 0, i32 3) #6, !alias.scope !39, !noalias !40
  %50 = extractvalue { <4 x float>, i8 } %49, 0
  %51 = tail call fast fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %48, <2 x float> noundef %47, <4 x float> noundef %50, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7) #8
  %52 = insertelement <4 x i1> poison, i1 %44, i64 0
  %53 = shufflevector <4 x i1> %52, <4 x i1> poison, <4 x i32> zeroinitializer
  %54 = select reassoc nsz arcp contract afn <4 x i1> %53, <4 x float> %50, <4 x float> %51
  tail call void @air.write_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture %3, <2 x i32> %48, i32 %46, <4 x float> %54, i32 0, i32 3) #9, !alias.scope !39, !noalias !40
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture, <2 x i32>, i32, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
define internal fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %0, <2 x float> noundef %1, <4 x float> noundef %2, %struct._texture_2d_t addrspace(1)* %3, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6) unnamed_addr #2 {
  %8 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #7
  %10 = insertelement <2 x float> undef, float %9, i64 0
  %11 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6
  %12 = tail call fast float @air.convert.f.f32.u.i32(i32 %11) #7
  %13 = insertelement <2 x float> %10, float %12, i64 1
  %14 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %0) #7
  %15 = fadd fast <2 x float> %14, <float 5.000000e-01, float 5.000000e-01>
  %16 = fdiv fast <2 x float> %15, %13
  %17 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %5, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %18 = extractvalue { <4 x float>, i8 } %17, 0
  %19 = shufflevector <4 x float> %18, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %20 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %21 = extractvalue { <4 x float>, i8 } %20, 0
  %22 = shufflevector <4 x float> %21, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %23 = tail call fast <3 x float> @air.fast_fmax.v3f32(<3 x float> %22, <3 x float> <float 0x3F70101020000000, float 0x3F70101020000000, float 0x3F70101020000000>) #7
  %24 = fdiv fast <3 x float> %19, %23
  %25 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %26 = extractvalue { <4 x float>, i8 } %25, 0
  %27 = extractelement <4 x float> %26, i64 0
  %28 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %4, <2 x i32> %0, i32 0, i32 3) #6
  %29 = extractvalue { <4 x float>, i8 } %28, 0
  %30 = extractelement <4 x float> %29, i64 0
  %31 = extractelement <4 x float> %2, i64 3
  %32 = fsub fast float 1.000000e+00, %31
  %33 = fmul fast float %30, %32
  %34 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %33, i64 0
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %4, <2 x i32> %0, <4 x float> %34, i32 0, i32 3) #9
  %35 = fmul fast float %27, %31
  %36 = fmul fast float %35, %30
  %37 = shufflevector <3 x float> %24, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %38 = insertelement <4 x float> %37, float 1.000000e+00, i64 3
  %39 = fmul fast <4 x float> %38, %2
  %40 = shufflevector <4 x float> %2, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %41 = shufflevector <4 x float> %39, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %42 = insertelement <3 x float> poison, float %36, i64 0
  %43 = shufflevector <3 x float> %42, <3 x float> poison, <3 x i32> zeroinitializer
  %44 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %40, <3 x float> %41, <3 x float> %43) #7
  %45 = shufflevector <3 x float> %44, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %46 = shufflevector <4 x float> %45, <4 x float> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %47 = tail call fast <4 x float> @air.fast_saturate.v4f32(<4 x float> %46) #7
  ret <4 x float> %47
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <4 x float> @air.fast_saturate.v4f32(<4 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.mix.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, <2 x i32>, i32, i32) local_unnamed_addr #4

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.fast_fmax.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.read_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture readonly, <2 x i32>, i32, i32, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i1 @air.any.v2i1(<2 x i1>) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #5 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #6 = { argmemonly nounwind readonly willreturn }
attributes #7 = { nounwind readnone willreturn }
attributes #8 = { convergent nobuiltin "no-builtins" }
attributes #9 = { argmemonly nounwind willreturn }
attributes #10 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!28}

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
!15 = !{void (<4 x float>, <2 x float>, i32, %struct._texture_2d_array_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, i32 addrspace(2)*, %"struct.metal::matrix.38" addrspace(2)*)* @MPIRefineFS, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27}
!18 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos", !"air.arg_unused"}
!19 = !{i32 1, !"air.fragment_input", !"generated(2uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!20 = !{i32 2, !"air.fragment_input", !"generated(5layerj)", !"air.flat", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!21 = !{i32 3, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.arg_type_name", !"texture2d_array<float, read_write>", !"air.arg_name", !"colors"}
!22 = !{i32 4, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"refinement_weight_map"}
!23 = !{i32 5, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.read_write", !"air.raster_order_group", i32 0, !"air.arg_type_name", !"texture2d<float, read_write>", !"air.arg_name", !"trans"}
!24 = !{i32 6, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"gt_image"}
!25 = !{i32 7, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"mpi_rendered_image"}
!26 = !{i32 8, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"total_layers"}
!27 = !{i32 9, !"air.buffer", !"air.buffer_size", i32 48, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 48, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float3x3", !"air.arg_name", !"transform_mpi_to_image"}
!28 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state}
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C++ TBAA"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"air-alias-scope-arg(8)"}
!35 = distinct !{!35, !"air-alias-scopes(MPIRefineFS)"}
!36 = !{!37, !38}
!37 = distinct !{!37, !35, !"air-alias-scope-textures"}
!38 = distinct !{!38, !35, !"air-alias-scope-arg(9)"}
!39 = !{!37}
!40 = !{!34, !38}
!41 = !{!31, !31, i64 0}
!42 = !{!38}
!43 = !{!37, !34}

0x000000000094b0 -- RasterPanoFS:
source_filename = "RasterPanoFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.3 = internal addrspace(2) constant [2 x i64] [i64 34901797601020562, i64 0], align 8

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
define <4 x half> @RasterPanoFS(<4 x float> %0, <2 x float> %1, %struct._texture_2d_t addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call { <4 x half>, i8 } @air.sample_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture readonly %2, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.3 to %struct._sampler_t addrspace(2)*), <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #2
  %5 = extractvalue { <4 x half>, i8 } %4, 0
  ret <4 x half> %5
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x half>, i8 } @air.sample_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #1

attributes #0 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #2 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!22}

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
!15 = !{<4 x half> (<4 x float>, <2 x float>, %struct._texture_2d_t addrspace(1)*)* @RasterPanoFS, !16, !18}
!16 = !{!17}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.arg_type_name", !"half4"}
!18 = !{!19, !20, !21}
!19 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos", !"air.arg_unused"}
!20 = !{i32 1, !"air.fragment_input", !"generated(2uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"uv"}
!21 = !{i32 2, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"color"}
!22 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.3}

0x0000000000a2c0 -- InitIndices:
source_filename = "InitIndices"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define void @InitIndices(i32 addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = zext i32 %1 to i64
  %4 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %3
  store i32 %1, i32 addrspace(1)* %4, align 4, !tbaa !20, !alias.scope !24
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32)* @InitIndices, !16, !17}
!16 = !{}
!17 = !{!18, !19}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"indices"}
!19 = !{i32 1, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"air-alias-scope-arg(0)"}
!26 = distinct !{!26, !"air-alias-scopes(InitIndices)"}

0x0000000000afc0 -- ClearBuffer:
source_filename = "ClearBuffer"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define void @ClearBuffer(i32 addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %0, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(2)* %1, align 4, !tbaa !21, !alias.scope !25, !noalias !28
  %5 = zext i32 %2 to i64
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %5
  store i32 %4, i32 addrspace(1)* %6, align 4, !tbaa !21, !alias.scope !28, !noalias !25
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(2)*, i32)* @ClearBuffer, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"buffer"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = !{!26}
!26 = distinct !{!26, !27, !"air-alias-scope-arg(1)"}
!27 = distinct !{!27, !"air-alias-scopes(ClearBuffer)"}
!28 = !{!29}
!29 = distinct !{!29, !27, !"air-alias-scope-arg(0)"}

0x0000000000bd70 -- ReduceSumKernel_uint:
source_filename = "ReduceSumKernel_uint"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ15ReduceSumKernelILt1024ELt32EjEvPU9MTLdeviceKT1_PU9MTLdeviceS0_jjjE6shared = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @ReduceSumKernel_uint(i32 addrspace(1)* noundef "air-buffer-no-alias" %0, i32 addrspace(1)* noundef "air-buffer-no-alias" %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = zext i32 %2 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !23, !alias.scope !27, !noalias !30
  %9 = zext i32 %4 to i64
  %10 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15ReduceSumKernelILt1024ELt32EjEvPU9MTLdeviceKT1_PU9MTLdeviceS0_jjjE6shared, i64 0, i64 %9
  store i32 %8, i32 addrspace(3)* %10, align 4, !tbaa !23
  tail call void @air.wg.barrier(i32 2, i32 1) #2
  %11 = icmp ugt i32 %4, 31
  br i1 %11, label %32, label %12

12:                                               ; preds = %5
  %13 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !23
  br label %18

14:                                               ; preds = %18
  store i32 %26, i32 addrspace(3)* %10, align 4, !tbaa !23
  tail call void @air.simdgroup.barrier(i32 2, i32 4) #2
  %15 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !23
  %16 = tail call i32 @air.simd_sum.u.i32(i32 %15) #2
  %17 = icmp eq i32 %4, 0
  br i1 %17, label %29, label %32

18:                                               ; preds = %18, %12
  %19 = phi i32 [ 1, %12 ], [ %27, %18 ]
  %20 = phi i32 [ %13, %12 ], [ %26, %18 ]
  %21 = shl nuw nsw i32 %19, 5
  %22 = add i32 %21, %4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15ReduceSumKernelILt1024ELt32EjEvPU9MTLdeviceKT1_PU9MTLdeviceS0_jjjE6shared, i64 0, i64 %23
  %25 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !23
  %26 = add i32 %25, %20
  %27 = add nuw nsw i32 %19, 1
  %28 = icmp eq i32 %27, 32
  br i1 %28, label %14, label %18, !llvm.loop !32

29:                                               ; preds = %14
  %30 = zext i32 %3 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  store i32 %16, i32 addrspace(1)* %31, align 4, !tbaa !23, !alias.scope !30, !noalias !27
  br label %32

32:                                               ; preds = %29, %14, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare i32 @air.simd_sum.u.i32(i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.simdgroup.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { convergent nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32)* @ReduceSumKernel_uint, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!19 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_data"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!21 = !{i32 3, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!22 = !{i32 4, !"air.thread_index_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"air-alias-scope-arg(0)"}
!29 = distinct !{!29, !"air-alias-scopes(ReduceSumKernel_uint)"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"air-alias-scope-arg(1)"}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.mustprogress"}

0x0000000000cdc0 -- PrefixExclusiveSumKernel_uint_false:
source_filename = "PrefixExclusiveSumKernel_uint_false"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @PrefixExclusiveSumKernel_uint_false(i32 addrspace(1)* noundef "air-buffer-no-alias" %0, i32 addrspace(1)* noundef "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !24, !alias.scope !28, !noalias !31
  %10 = zext i32 %5 to i64
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %10
  store i32 %9, i32 addrspace(3)* %11, align 4, !tbaa !24
  tail call void @air.wg.barrier(i32 2, i32 1) #2
  %12 = icmp ult i32 %5, 32
  br i1 %12, label %13, label %59

13:                                               ; preds = %6
  %14 = shl i32 %5, 5
  %15 = or i32 %14, 31
  %16 = or i32 %14, 1
  %17 = icmp ugt i32 %16, %15
  br i1 %17, label %23, label %18

18:                                               ; preds = %13
  %19 = or i32 %14, 31
  %20 = zext i32 %14 to i64
  %21 = getelementptr [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %20
  %22 = load i32, i32 addrspace(3)* %21, align 4
  br label %28

23:                                               ; preds = %28, %13
  %24 = zext i32 %15 to i64
  %25 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %24
  %26 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !24
  %27 = icmp ugt i32 %15, %14
  br i1 %27, label %42, label %37

28:                                               ; preds = %28, %18
  %29 = phi i32 [ %22, %18 ], [ %34, %28 ]
  %30 = phi i32 [ %16, %18 ], [ %35, %28 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !24
  %34 = add i32 %33, %29
  store i32 %34, i32 addrspace(3)* %32, align 4, !tbaa !24
  %35 = add nuw i32 %30, 1
  %36 = icmp eq i32 %30, %19
  br i1 %36, label %23, label %28, !llvm.loop !33

37:                                               ; preds = %42, %23
  %38 = zext i32 %14 to i64
  %39 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %38
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !24
  %40 = tail call i32 @air.simd_prefix_exclusive_sum.u.i32(i32 %26) #2
  %41 = or i32 %14, 31
  br label %51

42:                                               ; preds = %42, %23
  %43 = phi i32 [ %44, %42 ], [ %15, %23 ]
  %44 = add nsw i32 %43, -1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !24
  %48 = zext i32 %43 to i64
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %48
  store i32 %47, i32 addrspace(3)* %49, align 4, !tbaa !24
  %50 = icmp ugt i32 %44, %14
  br i1 %50, label %42, label %37, !llvm.loop !35

51:                                               ; preds = %51, %37
  %52 = phi i32 [ %14, %37 ], [ %57, %51 ]
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb0EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !24
  %56 = add i32 %55, %40
  store i32 %56, i32 addrspace(3)* %54, align 4, !tbaa !24
  %57 = add nuw i32 %52, 1
  %58 = icmp eq i32 %52, %41
  br i1 %58, label %59, label %51, !llvm.loop !36

59:                                               ; preds = %51, %6
  tail call void @air.wg.barrier(i32 2, i32 1) #2
  %60 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !24
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %7
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !24, !alias.scope !31, !noalias !28
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare i32 @air.simd_prefix_exclusive_sum.u.i32(i32) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { convergent nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32)* @PrefixExclusiveSumKernel_uint_false, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!19 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_data"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"group_prefix_sums", !"air.arg_unused"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!22 = !{i32 4, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid", !"air.arg_unused"}
!23 = !{i32 5, !"air.thread_index_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = !{!29}
!29 = distinct !{!29, !30, !"air-alias-scope-arg(0)"}
!30 = distinct !{!30, !"air-alias-scopes(PrefixExclusiveSumKernel_uint_false)"}
!31 = !{!32}
!32 = distinct !{!32, !30, !"air-alias-scope-arg(1)"}
!33 = distinct !{!33, !34}
!34 = !{!"llvm.loop.mustprogress"}
!35 = distinct !{!35, !34}
!36 = distinct !{!36, !34}

0x0000000000df30 -- PrefixExclusiveSumKernel_uint_true:
source_filename = "PrefixExclusiveSumKernel_uint_true"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4
@_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE17sharedGroupPrefix = internal unnamed_addr addrspace(3) global i32 0, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @PrefixExclusiveSumKernel_uint_true(i32 addrspace(1)* noundef "air-buffer-no-alias" %0, i32 addrspace(1)* noundef "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !24, !alias.scope !28, !noalias !31
  %10 = zext i32 %5 to i64
  %11 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %10
  store i32 %9, i32 addrspace(3)* %11, align 4, !tbaa !24
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %6
  %14 = zext i32 %4 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !24, !alias.scope !34, !noalias !35
  store i32 %16, i32 addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE17sharedGroupPrefix, align 4, !tbaa !24
  br label %17

17:                                               ; preds = %13, %6
  tail call void @air.wg.barrier(i32 2, i32 1) #2
  %18 = icmp ult i32 %5, 32
  br i1 %18, label %19, label %67

19:                                               ; preds = %17
  %20 = shl i32 %5, 5
  %21 = or i32 %20, 31
  %22 = or i32 %20, 1
  %23 = icmp ugt i32 %22, %21
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = or i32 %20, 31
  %26 = zext i32 %20 to i64
  %27 = getelementptr [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %26
  %28 = load i32, i32 addrspace(3)* %27, align 4
  br label %34

29:                                               ; preds = %34, %19
  %30 = zext i32 %21 to i64
  %31 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %30
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !24
  %33 = icmp ugt i32 %21, %20
  br i1 %33, label %50, label %43

34:                                               ; preds = %34, %24
  %35 = phi i32 [ %28, %24 ], [ %40, %34 ]
  %36 = phi i32 [ %22, %24 ], [ %41, %34 ]
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !24
  %40 = add i32 %39, %35
  store i32 %40, i32 addrspace(3)* %38, align 4, !tbaa !24
  %41 = add nuw i32 %36, 1
  %42 = icmp eq i32 %36, %25
  br i1 %42, label %29, label %34, !llvm.loop !36

43:                                               ; preds = %50, %29
  %44 = zext i32 %20 to i64
  %45 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %44
  store i32 0, i32 addrspace(3)* %45, align 4, !tbaa !24
  %46 = load i32, i32 addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE17sharedGroupPrefix, align 4, !tbaa !24
  %47 = tail call i32 @air.simd_prefix_exclusive_sum.u.i32(i32 %32) #2
  %48 = add i32 %47, %46
  %49 = or i32 %20, 31
  br label %59

50:                                               ; preds = %50, %29
  %51 = phi i32 [ %52, %50 ], [ %21, %29 ]
  %52 = add nsw i32 %51, -1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !24
  %56 = zext i32 %51 to i64
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %56
  store i32 %55, i32 addrspace(3)* %57, align 4, !tbaa !24
  %58 = icmp ugt i32 %52, %20
  br i1 %58, label %50, label %43, !llvm.loop !38

59:                                               ; preds = %59, %43
  %60 = phi i32 [ %20, %43 ], [ %65, %59 ]
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ24PrefixExclusiveSumKernelILt1024ELt32EjLb1EEvPU9MTLdeviceKT1_PU9MTLdeviceS0_S2_jjjE6shared, i64 0, i64 %61
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !24
  %64 = add i32 %48, %63
  store i32 %64, i32 addrspace(3)* %62, align 4, !tbaa !24
  %65 = add nuw i32 %60, 1
  %66 = icmp eq i32 %60, %49
  br i1 %66, label %67, label %59, !llvm.loop !39

67:                                               ; preds = %59, %17
  tail call void @air.wg.barrier(i32 2, i32 1) #2
  %68 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !24
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %7
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !24, !alias.scope !40, !noalias !41
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare i32 @air.simd_prefix_exclusive_sum.u.i32(i32) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { convergent nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32)* @PrefixExclusiveSumKernel_uint_true, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!19 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_data"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"group_prefix_sums"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!22 = !{i32 4, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!23 = !{i32 5, !"air.thread_index_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C++ TBAA"}
!28 = !{!29}
!29 = distinct !{!29, !30, !"air-alias-scope-arg(0)"}
!30 = distinct !{!30, !"air-alias-scopes(PrefixExclusiveSumKernel_uint_true)"}
!31 = !{!32, !33}
!32 = distinct !{!32, !30, !"air-alias-scope-arg(1)"}
!33 = distinct !{!33, !30, !"air-alias-scope-arg(2)"}
!34 = !{!33}
!35 = !{!29, !32}
!36 = distinct !{!36, !37}
!37 = !{!"llvm.loop.mustprogress"}
!38 = distinct !{!38, !37}
!39 = distinct !{!39, !37}
!40 = !{!32}
!41 = !{!29, !33}

0x0000000000f190 -- RadixSortMakeHistogramKernel256_uint:
source_filename = "RadixSortMakeHistogramKernel256_uint"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ28RadixSortMakeHistogramKernelILt1024EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram = internal addrspace(3) global [256 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @RadixSortMakeHistogramKernel256_uint(i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %0, i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 addrspace(1)* noundef "air-buffer-no-alias" %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) local_unnamed_addr #0 {
  %9 = icmp ult i32 %6, 256
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = zext i32 %6 to i64
  %12 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %11
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !26
  br label %13

13:                                               ; preds = %10, %8
  tail call void @air.wg.barrier(i32 2, i32 1) #3
  %14 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !26, !alias.scope !30, !noalias !33
  %15 = icmp ugt i32 %14, %4
  br i1 %15, label %16, label %27

16:                                               ; preds = %13
  %17 = zext i32 %4 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !26, !alias.scope !37, !noalias !38
  %20 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !26, !alias.scope !39, !noalias !40
  %21 = and i32 %20, 31
  %22 = lshr i32 %19, %21
  %23 = and i32 %22, 255
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %24
  %26 = tail call i32 @air.atomic.local.add.u.i32(i32 addrspace(3)* nocapture %25, i32 1, i32 0, i32 1, i1 true) #4
  br label %27

27:                                               ; preds = %16, %13
  tail call void @air.wg.barrier(i32 2, i32 1) #3
  br i1 %9, label %28, label %36

28:                                               ; preds = %27
  %29 = mul i32 %7, %6
  %30 = add i32 %29, %5
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %33 = zext i32 %6 to i64
  %34 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %33
  %35 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !26
  store i32 %35, i32 addrspace(1)* %32, align 4, !tbaa !26, !alias.scope !41, !noalias !42
  br label %36

36:                                               ; preds = %28, %27
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn
declare i32 @air.atomic.local.add.u.i32(i32 addrspace(3)* nocapture, i32, i32, i32, i1) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nounwind willreturn }
attributes #3 = { convergent nounwind willreturn }
attributes #4 = { nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32, i32)* @RadixSortMakeHistogramKernel256_uint, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25}
!18 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"bit_offset"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!21 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"globalHistogram"}
!22 = !{i32 4, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!23 = !{i32 5, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!24 = !{i32 6, !"air.thread_position_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!25 = !{i32 7, !"air.threadgroups_per_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"numThreadgroups"}
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C++ TBAA"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"air-alias-scope-arg(1)"}
!32 = distinct !{!32, !"air-alias-scopes(RadixSortMakeHistogramKernel256_uint)"}
!33 = !{!34, !35, !36}
!34 = distinct !{!34, !32, !"air-alias-scope-arg(0)"}
!35 = distinct !{!35, !32, !"air-alias-scope-arg(2)"}
!36 = distinct !{!36, !32, !"air-alias-scope-arg(3)"}
!37 = !{!35}
!38 = !{!34, !31, !36}
!39 = !{!34}
!40 = !{!31, !35, !36}
!41 = !{!36}
!42 = !{!34, !31, !35}

0x00000000010350 -- RadixSortReorderKernel256_uint:
source_filename = "RadixSortReorderKernel256_uint"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks = internal addrspace(3) global [256 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @RadixSortReorderKernel256_uint(i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %0, i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 addrspace(1)* noundef "air-buffer-no-alias" %3, i32 addrspace(1)* noundef "air-buffer-no-alias" %4, i32 addrspace(1)* noundef "air-buffer-no-alias" %5, i32 addrspace(1)* noundef "air-buffer-no-alias" %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10) local_unnamed_addr #0 {
  %12 = icmp ult i32 %9, 256
  br i1 %12, label %13, label %22

13:                                               ; preds = %11
  %14 = zext i32 %9 to i64
  %15 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks, i64 0, i64 %14
  %16 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets, i64 0, i64 %14
  %17 = mul i32 %10, %9
  %18 = add i32 %17, %8
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !29, !alias.scope !33, !noalias !36
  store i32 %21, i32 addrspace(3)* %16, align 4, !tbaa !29
  store i32 0, i32 addrspace(3)* %15, align 4, !tbaa !29
  br label %22

22:                                               ; preds = %13, %11
  %23 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !29, !alias.scope !43, !noalias !44
  %24 = icmp ugt i32 %23, %7
  br i1 %24, label %25, label %34

25:                                               ; preds = %22
  %26 = zext i32 %9 to i64
  %27 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices, i64 0, i64 %26
  %28 = zext i32 %7 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data, i64 0, i64 %26
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !29, !alias.scope !45, !noalias !46
  store i32 %32, i32 addrspace(3)* %30, align 4, !tbaa !29
  %33 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !29, !alias.scope !47, !noalias !48
  store i32 %33, i32 addrspace(3)* %27, align 4, !tbaa !29
  br label %34

34:                                               ; preds = %25, %22
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %35 = icmp ugt i32 %9, 31
  br i1 %35, label %77, label %36

36:                                               ; preds = %34
  %37 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !29, !alias.scope !43, !noalias !44
  %38 = mul i32 %8, -1024
  %39 = add i32 %38, -1
  %40 = add i32 %39, %37
  %41 = shl nuw i32 1, %9
  br label %42

42:                                               ; preds = %74, %36
  %43 = phi i32 [ 0, %36 ], [ %75, %74 ]
  %44 = shl nuw nsw i32 %43, 5
  %45 = add i32 %44, %9
  %46 = icmp ugt i32 %45, %40
  br i1 %46, label %74, label %47

47:                                               ; preds = %42
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data, i64 0, i64 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !29
  %51 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices, i64 0, i64 %48
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !29
  %53 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !29, !alias.scope !49, !noalias !50
  %54 = and i32 %53, 31
  %55 = lshr i32 %50, %54
  %56 = and i32 %55, 255
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks, i64 0, i64 %57
  %59 = tail call i32 @air.atomic.local.or.u.i32(i32 addrspace(3)* nocapture %58, i32 %41, i32 0, i32 1, i1 true) #5
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %60 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !29
  %61 = tail call i32 @air.extract_bits.u.i32(i32 %60, i32 0, i32 %9) #6
  %62 = tail call i32 @air.popcount.i32(i32 %61) #6
  %63 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt256EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets, i64 0, i64 %57
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !29
  %65 = add i32 %64, %62
  %66 = icmp eq i32 %62, 0
  br i1 %66, label %67, label %70

67:                                               ; preds = %47
  %68 = tail call i32 @air.popcount.i32(i32 %60) #6
  %69 = add i32 %68, %64
  store i32 %69, i32 addrspace(3)* %63, align 4, !tbaa !29
  br label %70

70:                                               ; preds = %67, %47
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !29
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %71 = zext i32 %65 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %71
  store i32 %50, i32 addrspace(1)* %72, align 4, !tbaa !29, !alias.scope !51, !noalias !52
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %71
  store i32 %52, i32 addrspace(1)* %73, align 4, !tbaa !29, !alias.scope !53, !noalias !54
  br label %74

74:                                               ; preds = %70, %42
  %75 = add nuw nsw i32 %43, 1
  %76 = icmp eq i32 %75, 32
  br i1 %76, label %77, label %42, !llvm.loop !55

77:                                               ; preds = %74, %34
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.popcount.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.extract_bits.u.i32(i32, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn
declare i32 @air.atomic.local.or.u.i32(i32 addrspace(3)* nocapture, i32, i32, i32, i1) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { mustprogress nounwind willreturn }
attributes #4 = { convergent nounwind willreturn }
attributes #5 = { nounwind willreturn }
attributes #6 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32, i32)* @RadixSortReorderKernel256_uint, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28}
!18 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"bit_offset"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!21 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_indices"}
!22 = !{i32 4, !"air.buffer", !"air.location_index", i32 4, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"baseOffsets"}
!23 = !{i32 5, !"air.buffer", !"air.location_index", i32 5, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_data"}
!24 = !{i32 6, !"air.buffer", !"air.location_index", i32 6, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_indices"}
!25 = !{i32 7, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!26 = !{i32 8, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!27 = !{i32 9, !"air.thread_position_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!28 = !{i32 10, !"air.threadgroups_per_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"numThreadgroups"}
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C++ TBAA"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"air-alias-scope-arg(4)"}
!35 = distinct !{!35, !"air-alias-scopes(RadixSortReorderKernel256_uint)"}
!36 = !{!37, !38, !39, !40, !41, !42}
!37 = distinct !{!37, !35, !"air-alias-scope-arg(0)"}
!38 = distinct !{!38, !35, !"air-alias-scope-arg(1)"}
!39 = distinct !{!39, !35, !"air-alias-scope-arg(2)"}
!40 = distinct !{!40, !35, !"air-alias-scope-arg(3)"}
!41 = distinct !{!41, !35, !"air-alias-scope-arg(5)"}
!42 = distinct !{!42, !35, !"air-alias-scope-arg(6)"}
!43 = !{!38}
!44 = !{!37, !39, !40, !34, !41, !42}
!45 = !{!39}
!46 = !{!37, !38, !40, !34, !41, !42}
!47 = !{!40}
!48 = !{!37, !38, !39, !34, !41, !42}
!49 = !{!37}
!50 = !{!38, !39, !40, !34, !41, !42}
!51 = !{!41}
!52 = !{!37, !38, !39, !40, !34, !42}
!53 = !{!42}
!54 = !{!37, !38, !39, !40, !34, !41}
!55 = distinct !{!55, !56}
!56 = !{!"llvm.loop.mustprogress"}

0x00000000011ac0 -- RadixSortMakeHistogramKernel16_uint:
source_filename = "RadixSortMakeHistogramKernel16_uint"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ28RadixSortMakeHistogramKernelILt1024EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram = internal addrspace(3) global [16 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @RadixSortMakeHistogramKernel16_uint(i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %0, i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 addrspace(1)* noundef "air-buffer-no-alias" %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) local_unnamed_addr #0 {
  %9 = icmp ult i32 %6, 16
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = zext i32 %6 to i64
  %12 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %11
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !26
  br label %13

13:                                               ; preds = %10, %8
  tail call void @air.wg.barrier(i32 2, i32 1) #3
  %14 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !26, !alias.scope !30, !noalias !33
  %15 = icmp ugt i32 %14, %4
  br i1 %15, label %16, label %27

16:                                               ; preds = %13
  %17 = zext i32 %4 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !26, !alias.scope !37, !noalias !38
  %20 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !26, !alias.scope !39, !noalias !40
  %21 = and i32 %20, 31
  %22 = lshr i32 %19, %21
  %23 = and i32 %22, 15
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %24
  %26 = tail call i32 @air.atomic.local.add.u.i32(i32 addrspace(3)* nocapture %25, i32 1, i32 0, i32 1, i1 true) #4
  br label %27

27:                                               ; preds = %16, %13
  tail call void @air.wg.barrier(i32 2, i32 1) #3
  br i1 %9, label %28, label %36

28:                                               ; preds = %27
  %29 = mul i32 %7, %6
  %30 = add i32 %29, %5
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %33 = zext i32 %6 to i64
  %34 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ28RadixSortMakeHistogramKernelILt1024EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT0_PU9MTLdevicejjjjjE15sharedHistogram, i64 0, i64 %33
  %35 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !26
  store i32 %35, i32 addrspace(1)* %32, align 4, !tbaa !26, !alias.scope !41, !noalias !42
  br label %36

36:                                               ; preds = %28, %27
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nounwind willreturn
declare i32 @air.atomic.local.add.u.i32(i32 addrspace(3)* nocapture, i32, i32, i32, i1) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nounwind willreturn }
attributes #3 = { convergent nounwind willreturn }
attributes #4 = { nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32, i32)* @RadixSortMakeHistogramKernel16_uint, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25}
!18 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"bit_offset"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!21 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"globalHistogram"}
!22 = !{i32 4, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!23 = !{i32 5, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!24 = !{i32 6, !"air.thread_position_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!25 = !{i32 7, !"air.threadgroups_per_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"numThreadgroups"}
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C++ TBAA"}
!30 = !{!31}
!31 = distinct !{!31, !32, !"air-alias-scope-arg(1)"}
!32 = distinct !{!32, !"air-alias-scopes(RadixSortMakeHistogramKernel16_uint)"}
!33 = !{!34, !35, !36}
!34 = distinct !{!34, !32, !"air-alias-scope-arg(0)"}
!35 = distinct !{!35, !32, !"air-alias-scope-arg(2)"}
!36 = distinct !{!36, !32, !"air-alias-scope-arg(3)"}
!37 = !{!35}
!38 = !{!34, !31, !36}
!39 = !{!34}
!40 = !{!31, !35, !36}
!41 = !{!36}
!42 = !{!34, !31, !35}

0x00000000012c70 -- RadixSortReorderKernel16_uint:
source_filename = "RadixSortReorderKernel16_uint"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks = internal addrspace(3) global [16 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4
@_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 4

; Function Attrs: convergent mustprogress nounwind
define weak_odr void @RadixSortReorderKernel16_uint(i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %0, i32 addrspace(1)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(1)* noundef "air-buffer-no-alias" %2, i32 addrspace(1)* noundef "air-buffer-no-alias" %3, i32 addrspace(1)* noundef "air-buffer-no-alias" %4, i32 addrspace(1)* noundef "air-buffer-no-alias" %5, i32 addrspace(1)* noundef "air-buffer-no-alias" %6, i32 noundef %7, i32 noundef %8, i32 noundef %9, i32 noundef %10) local_unnamed_addr #0 {
  %12 = icmp ult i32 %9, 16
  br i1 %12, label %13, label %22

13:                                               ; preds = %11
  %14 = zext i32 %9 to i64
  %15 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks, i64 0, i64 %14
  %16 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets, i64 0, i64 %14
  %17 = mul i32 %10, %9
  %18 = add i32 %17, %8
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !29, !alias.scope !33, !noalias !36
  store i32 %21, i32 addrspace(3)* %16, align 4, !tbaa !29
  store i32 0, i32 addrspace(3)* %15, align 4, !tbaa !29
  br label %22

22:                                               ; preds = %13, %11
  %23 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !29, !alias.scope !43, !noalias !44
  %24 = icmp ugt i32 %23, %7
  br i1 %24, label %25, label %34

25:                                               ; preds = %22
  %26 = zext i32 %9 to i64
  %27 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices, i64 0, i64 %26
  %28 = zext i32 %7 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data, i64 0, i64 %26
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !29, !alias.scope !45, !noalias !46
  store i32 %32, i32 addrspace(3)* %30, align 4, !tbaa !29
  %33 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !29, !alias.scope !47, !noalias !48
  store i32 %33, i32 addrspace(3)* %27, align 4, !tbaa !29
  br label %34

34:                                               ; preds = %25, %22
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %35 = icmp ugt i32 %9, 31
  br i1 %35, label %77, label %36

36:                                               ; preds = %34
  %37 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !29, !alias.scope !43, !noalias !44
  %38 = mul i32 %8, -1024
  %39 = add i32 %38, -1
  %40 = add i32 %39, %37
  %41 = shl nuw i32 1, %9
  br label %42

42:                                               ; preds = %74, %36
  %43 = phi i32 [ 0, %36 ], [ %75, %74 ]
  %44 = shl nuw nsw i32 %43, 5
  %45 = add i32 %44, %9
  %46 = icmp ugt i32 %45, %40
  br i1 %46, label %74, label %47

47:                                               ; preds = %42
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE17shared_input_data, i64 0, i64 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !29
  %51 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_input_indices, i64 0, i64 %48
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !29
  %53 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !29, !alias.scope !49, !noalias !50
  %54 = and i32 %53, 31
  %55 = lshr i32 %50, %54
  %56 = and i32 %55, 15
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE16shared_key_masks, i64 0, i64 %57
  %59 = tail call i32 @air.atomic.local.or.u.i32(i32 addrspace(3)* nocapture %58, i32 %41, i32 0, i32 1, i1 true) #5
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %60 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !29
  %61 = tail call i32 @air.extract_bits.u.i32(i32 %60, i32 0, i32 %9) #6
  %62 = tail call i32 @air.popcount.i32(i32 %61) #6
  %63 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ22RadixSortReorderKernelILt1024ELt32EjLt16EEvRU9MTLdeviceKjS1_PU9MTLdeviceKT1_PS0_S5_PU9MTLdeviceS2_PU9MTLdevicejjjjjE20shared_based_offsets, i64 0, i64 %57
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !29
  %65 = add i32 %64, %62
  %66 = icmp eq i32 %62, 0
  br i1 %66, label %67, label %70

67:                                               ; preds = %47
  %68 = tail call i32 @air.popcount.i32(i32 %60) #6
  %69 = add i32 %68, %64
  store i32 %69, i32 addrspace(3)* %63, align 4, !tbaa !29
  br label %70

70:                                               ; preds = %67, %47
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !29
  tail call void @air.wg.barrier(i32 2, i32 1) #4
  %71 = zext i32 %65 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %71
  store i32 %50, i32 addrspace(1)* %72, align 4, !tbaa !29, !alias.scope !51, !noalias !52
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %71
  store i32 %52, i32 addrspace(1)* %73, align 4, !tbaa !29, !alias.scope !53, !noalias !54
  br label %74

74:                                               ; preds = %70, %42
  %75 = add nuw nsw i32 %43, 1
  %76 = icmp eq i32 %75, 32
  br i1 %76, label %77, label %42, !llvm.loop !55

77:                                               ; preds = %74, %34
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @air.wg.barrier(i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.popcount.i32(i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.extract_bits.u.i32(i32, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind willreturn
declare i32 @air.atomic.local.or.u.i32(i32 addrspace(3)* nocapture, i32, i32, i32, i1) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { mustprogress nounwind willreturn }
attributes #4 = { convergent nounwind willreturn }
attributes #5 = { nounwind willreturn }
attributes #6 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32 addrspace(1)*, i32, i32, i32, i32)* @RadixSortReorderKernel16_uint, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28}
!18 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"bit_offset"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!20 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_data"}
!21 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"input_indices"}
!22 = !{i32 4, !"air.buffer", !"air.location_index", i32 4, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"baseOffsets"}
!23 = !{i32 5, !"air.buffer", !"air.location_index", i32 5, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_data"}
!24 = !{i32 6, !"air.buffer", !"air.location_index", i32 6, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"output_indices"}
!25 = !{i32 7, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"tid"}
!26 = !{i32 8, !"air.threadgroup_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!27 = !{i32 9, !"air.thread_position_in_threadgroup", !"air.arg_type_name", !"uint", !"air.arg_name", !"lid"}
!28 = !{i32 10, !"air.threadgroups_per_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"numThreadgroups"}
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C++ TBAA"}
!33 = !{!34}
!34 = distinct !{!34, !35, !"air-alias-scope-arg(4)"}
!35 = distinct !{!35, !"air-alias-scopes(RadixSortReorderKernel16_uint)"}
!36 = !{!37, !38, !39, !40, !41, !42}
!37 = distinct !{!37, !35, !"air-alias-scope-arg(0)"}
!38 = distinct !{!38, !35, !"air-alias-scope-arg(1)"}
!39 = distinct !{!39, !35, !"air-alias-scope-arg(2)"}
!40 = distinct !{!40, !35, !"air-alias-scope-arg(3)"}
!41 = distinct !{!41, !35, !"air-alias-scope-arg(5)"}
!42 = distinct !{!42, !35, !"air-alias-scope-arg(6)"}
!43 = !{!38}
!44 = !{!37, !39, !40, !34, !41, !42}
!45 = !{!39}
!46 = !{!37, !38, !40, !34, !41, !42}
!47 = !{!40}
!48 = !{!37, !38, !39, !34, !41, !42}
!49 = !{!37}
!50 = !{!38, !39, !40, !34, !41, !42}
!51 = !{!41}
!52 = !{!37, !38, !39, !40, !34, !42}
!53 = !{!42}
!54 = !{!37, !38, !39, !40, !34, !41}
!55 = distinct !{!55, !56}
!56 = !{!"llvm.loop.mustprogress"}

0x000000000143d0 -- ComputeCov3D:
source_filename = "ComputeCov3D"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: convergent mustprogress nofree nosync nounwind willreturn
define void @ComputeCov3D(<3 x float> %0, <4 x float> %1, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %4, float addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = mul i32 %6, 6
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %4, i64 %9
  %11 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !25, !alias.scope !29, !noalias !32
  %12 = load float, float addrspace(2)* %2, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %13 = zext i32 %6 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  tail call fastcc void @_Z12ComputeCov3DDv3_fN9apple3dgs14ActivationTypeEfDv4_fPU9MTLdevicefS4_(<3 x float> noundef %0, i32 noundef %11, float noundef %12, <4 x float> noundef %1, float addrspace(1)* noundef %10, float addrspace(1)* noundef %14) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define internal fastcc void @_Z12ComputeCov3DDv3_fN9apple3dgs14ActivationTypeEfDv4_fPU9MTLdevicefS4_(<3 x float> noundef %0, i32 noundef %1, float noundef %2, <4 x float> noundef %3, float addrspace(1)* nocapture noundef writeonly %4, float addrspace(1)* nocapture noundef writeonly %5) unnamed_addr #1 {
  switch i32 %1, label %14 [
    i32 2, label %9
    i32 1, label %7
  ]

7:                                                ; preds = %6
  %8 = tail call fast <3 x float> @air.fast_exp.v3f32(<3 x float> %0) #4
  br label %14

9:                                                ; preds = %6
  %10 = fneg fast <3 x float> %0
  %11 = tail call fast <3 x float> @air.fast_exp.v3f32(<3 x float> %10) #4
  %12 = fadd fast <3 x float> %11, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  %13 = fdiv fast <3 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %12
  br label %14

14:                                               ; preds = %9, %7, %6
  %15 = phi <3 x float> [ %13, %9 ], [ %8, %7 ], [ %0, %6 ]
  %16 = extractelement <3 x float> %15, i64 0
  %17 = fmul fast float %16, %2
  %18 = insertelement <3 x float> <float poison, float 0.000000e+00, float 0.000000e+00>, float %17, i64 0
  %19 = extractelement <3 x float> %15, i64 1
  %20 = fmul fast float %19, %2
  %21 = insertelement <3 x float> <float 0.000000e+00, float poison, float 0.000000e+00>, float %20, i64 1
  %22 = extractelement <3 x float> %15, i64 2
  %23 = fmul fast float %22, %2
  %24 = insertelement <3 x float> <float 0.000000e+00, float 0.000000e+00, float poison>, float %23, i64 2
  %25 = tail call fast float @air.dot.v4f32(<4 x float> %3, <4 x float> %3) #4
  %26 = tail call fast float @air.fast_rsqrt.f32(float %25) #4
  %27 = insertelement <4 x float> poison, float %26, i64 0
  %28 = shufflevector <4 x float> %27, <4 x float> poison, <4 x i32> zeroinitializer
  %29 = fmul fast <4 x float> %28, %3
  %30 = bitcast <4 x float> %29 to <4 x i32>
  %31 = and <4 x i32> %30, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %32 = icmp ugt <4 x i32> %31, <i32 2139095040, i32 2139095040, i32 2139095040, i32 2139095040>
  %33 = select reassoc nsz arcp contract afn <4 x i1> %32, <4 x float> zeroinitializer, <4 x float> %29
  %34 = extractelement <4 x float> %33, i64 2
  %35 = fmul fast float %34, %34
  %36 = extractelement <4 x float> %33, i64 3
  %37 = fmul fast float %36, %36
  %38 = fadd fast float %35, %37
  %39 = fmul fast float %38, 2.000000e+00
  %40 = fsub fast float 1.000000e+00, %39
  %41 = insertelement <3 x float> undef, float %40, i64 0
  %42 = extractelement <4 x float> %33, i64 1
  %43 = fmul fast float %42, %34
  %44 = extractelement <4 x float> %33, i64 0
  %45 = fmul fast float %44, %36
  %46 = fsub fast float %43, %45
  %47 = fmul fast float %46, 2.000000e+00
  %48 = fmul fast float %42, %36
  %49 = fmul fast float %44, %34
  %50 = fadd fast float %48, %49
  %51 = fmul fast float %50, 2.000000e+00
  %52 = fadd fast float %43, %45
  %53 = fmul fast float %52, 2.000000e+00
  %54 = insertelement <3 x float> undef, float %53, i64 0
  %55 = fmul fast float %42, %42
  %56 = fadd fast float %55, %37
  %57 = fmul fast float %56, 2.000000e+00
  %58 = fsub fast float 1.000000e+00, %57
  %59 = fmul fast float %34, %36
  %60 = fmul fast float %44, %42
  %61 = fsub fast float %59, %60
  %62 = fmul fast float %61, 2.000000e+00
  %63 = fsub fast float %48, %49
  %64 = fmul fast float %63, 2.000000e+00
  %65 = insertelement <3 x float> undef, float %64, i64 0
  %66 = fadd fast float %59, %60
  %67 = fmul fast float %66, 2.000000e+00
  %68 = fadd fast float %55, %35
  %69 = fmul fast float %68, 2.000000e+00
  %70 = fsub fast float 1.000000e+00, %69
  %71 = shufflevector <3 x float> %41, <3 x float> poison, <3 x i32> zeroinitializer
  %72 = fmul fast <3 x float> %71, %18
  %73 = insertelement <3 x float> undef, float %47, i64 0
  %74 = shufflevector <3 x float> %73, <3 x float> poison, <3 x i32> zeroinitializer
  %75 = fmul fast <3 x float> %74, %21
  %76 = insertelement <3 x float> undef, float %51, i64 0
  %77 = shufflevector <3 x float> %76, <3 x float> poison, <3 x i32> zeroinitializer
  %78 = fmul fast <3 x float> %77, %24
  %79 = fadd fast <3 x float> %78, %75
  %80 = fadd fast <3 x float> %79, %72
  %81 = shufflevector <3 x float> %54, <3 x float> poison, <3 x i32> zeroinitializer
  %82 = fmul fast <3 x float> %81, %18
  %83 = insertelement <3 x float> undef, float %58, i64 0
  %84 = shufflevector <3 x float> %83, <3 x float> poison, <3 x i32> zeroinitializer
  %85 = fmul fast <3 x float> %84, %21
  %86 = insertelement <3 x float> undef, float %62, i64 0
  %87 = shufflevector <3 x float> %86, <3 x float> poison, <3 x i32> zeroinitializer
  %88 = fmul fast <3 x float> %87, %24
  %89 = fadd fast <3 x float> %88, %82
  %90 = fadd fast <3 x float> %89, %85
  %91 = shufflevector <3 x float> %65, <3 x float> poison, <3 x i32> zeroinitializer
  %92 = fmul fast <3 x float> %91, %18
  %93 = insertelement <3 x float> undef, float %67, i64 0
  %94 = shufflevector <3 x float> %93, <3 x float> poison, <3 x i32> zeroinitializer
  %95 = fmul fast <3 x float> %94, %21
  %96 = fadd fast <3 x float> %92, %95
  %97 = insertelement <3 x float> undef, float %70, i64 0
  %98 = shufflevector <3 x float> %97, <3 x float> poison, <3 x i32> zeroinitializer
  %99 = fmul fast <3 x float> %98, %24
  %100 = fadd fast <3 x float> %96, %99
  %101 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 0, i32 3, i32 undef>
  %102 = shufflevector <3 x float> %101, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 3>
  %103 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 1, i32 4, i32 undef>
  %104 = shufflevector <3 x float> %103, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 4>
  %105 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 2, i32 5, i32 undef>
  %106 = shufflevector <3 x float> %105, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 5>
  %107 = shufflevector <3 x float> %80, <3 x float> poison, <3 x i32> zeroinitializer
  %108 = fmul fast <3 x float> %102, %107
  %109 = shufflevector <3 x float> %80, <3 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %110 = fmul fast <3 x float> %104, %109
  %111 = fadd fast <3 x float> %108, %110
  %112 = shufflevector <3 x float> %80, <3 x float> undef, <3 x i32> <i32 2, i32 2, i32 2>
  %113 = fmul fast <3 x float> %106, %112
  %114 = fadd fast <3 x float> %111, %113
  %115 = shufflevector <3 x float> %90, <3 x float> poison, <3 x i32> <i32 undef, i32 0, i32 0>
  %116 = fmul fast <3 x float> %102, %115
  %117 = shufflevector <3 x float> %90, <3 x float> undef, <3 x i32> <i32 undef, i32 1, i32 1>
  %118 = fmul fast <3 x float> %104, %117
  %119 = fadd fast <3 x float> %116, %118
  %120 = shufflevector <3 x float> %90, <3 x float> undef, <3 x i32> <i32 undef, i32 2, i32 2>
  %121 = fmul fast <3 x float> %106, %120
  %122 = fadd fast <3 x float> %119, %121
  %123 = shufflevector <3 x float> %100, <3 x float> poison, <3 x i32> <i32 undef, i32 undef, i32 0>
  %124 = fmul fast <3 x float> %102, %123
  %125 = shufflevector <3 x float> %100, <3 x float> undef, <3 x i32> <i32 undef, i32 undef, i32 1>
  %126 = fmul fast <3 x float> %104, %125
  %127 = fadd fast <3 x float> %124, %126
  %128 = fmul fast <3 x float> %106, %100
  %129 = fadd fast <3 x float> %127, %128
  %130 = extractelement <3 x float> %114, i64 0
  store float %130, float addrspace(1)* %4, align 4, !tbaa !36
  %131 = extractelement <3 x float> %114, i64 1
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 1
  store float %131, float addrspace(1)* %132, align 4, !tbaa !36
  %133 = extractelement <3 x float> %114, i64 2
  %134 = getelementptr inbounds float, float addrspace(1)* %4, i64 2
  store float %133, float addrspace(1)* %134, align 4, !tbaa !36
  %135 = extractelement <3 x float> %122, i64 1
  %136 = getelementptr inbounds float, float addrspace(1)* %4, i64 3
  store float %135, float addrspace(1)* %136, align 4, !tbaa !36
  %137 = extractelement <3 x float> %122, i64 2
  %138 = getelementptr inbounds float, float addrspace(1)* %4, i64 4
  store float %137, float addrspace(1)* %138, align 4, !tbaa !36
  %139 = extractelement <3 x float> %129, i64 2
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 5
  store float %139, float addrspace(1)* %140, align 4, !tbaa !36
  %141 = fmul fast float %2, 3.000000e+00
  %142 = tail call fast float @air.fast_fmax.f32(float %16, float %19) #4
  %143 = tail call fast float @air.fast_fmax.f32(float %142, float %22) #4
  %144 = fmul fast float %141, %143
  store float %144, float addrspace(1)* %5, align 4, !tbaa !36
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_rsqrt.f32(float) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.dot.v4f32(<4 x float>, <4 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.fast_exp.v3f32(<3 x float>) local_unnamed_addr #2

attributes #0 = { convergent mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (<3 x float>, <4 x float>, float addrspace(2)*, i32 addrspace(2)*, float addrspace(1)*, float addrspace(1)*, i32)* @ComputeCov3D, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24}
!18 = !{i32 0, !"air.stage_in", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"float3", !"air.arg_name", !"scale"}
!19 = !{i32 1, !"air.stage_in", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"float4", !"air.arg_name", !"rotation"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"scale_modifier"}
!21 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"int", !"air.arg_name", !"activation_scale"}
!22 = !{i32 4, !"air.buffer", !"air.location_index", i32 4, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"cov3Ds"}
!23 = !{i32 5, !"air.buffer", !"air.location_index", i32 5, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"radius"}
!24 = !{i32 6, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!25 = !{!26, !26, i64 0}
!26 = !{!"_ZTSN9apple3dgs14ActivationTypeE", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(3)"}
!31 = distinct !{!31, !"air-alias-scopes(ComputeCov3D)"}
!32 = !{!33, !34, !35}
!33 = distinct !{!33, !31, !"air-alias-scope-arg(2)"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(4)"}
!35 = distinct !{!35, !31, !"air-alias-scope-arg(5)"}
!36 = !{!37, !37, i64 0}
!37 = !{!"float", !27, i64 0}
!38 = !{!33}
!39 = !{!30, !34, !35}

0x00000000015a50 -- PrecomputeDistanceAndColor:
source_filename = "PrecomputeDistanceAndColor"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.apple3dgs::PreComputeDistanceUniforms" = type <{ %"struct.metal::matrix.1", %"struct.metal::matrix.1", %"struct.metal::array", <3 x float>, i32, i32, i32, i32, i32, [12 x i8] }>
%"struct.metal::matrix.1" = type { [4 x <4 x float>] }
%"struct.metal::array" = type { [6 x <4 x float>] }
%struct._texture_buffer_1d_t = type opaque
%struct.Coeff1Attribute = type { <3 x half>, <3 x half>, <3 x half> }
%struct.Coeff2Attribute = type { <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half> }
%struct.Coeff3Attribute = type { <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half> }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_GSRenderer.metal, i8* null }]
@_ZL6kUseC3 = internal unnamed_addr addrspace(2) global i8 0, align 1
@_ZL6kUseC2 = internal unnamed_addr addrspace(2) global i8 0, align 1
@_ZL6kUseC1 = internal unnamed_addr addrspace(2) global i8 0, align 1
@_Z18kSplattingShDegree.MTL_FC_INIT_5_j = internal unnamed_addr addrspace(2) externally_initialized constant i32 undef, section "air.fc_initializer", align 4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define internal void @_GLOBAL__sub_I_GSRenderer.metal() #0 section "air.static_init" {
  %1 = load i32, i32 addrspace(2)* @_Z18kSplattingShDegree.MTL_FC_INIT_5_j, align 4, !tbaa !44
  %2 = icmp ne i32 %1, 0
  %3 = zext i1 %2 to i8
  store i8 %3, i8 addrspace(2)* @_ZL6kUseC1, align 1, !tbaa !48
  %4 = icmp ugt i32 %1, 1
  %5 = zext i1 %4 to i8
  store i8 %5, i8 addrspace(2)* @_ZL6kUseC2, align 1, !tbaa !48
  %6 = icmp ugt i32 %1, 2
  %7 = zext i1 %6 to i8
  store i8 %7, i8 addrspace(2)* @_ZL6kUseC3, align 1, !tbaa !48
  ret void
}

; Function Attrs: convergent mustprogress nounwind
define void @PrecomputeDistanceAndColor(half %0, <3 x half> %1, <3 x half> %2, <3 x half> %3, <3 x half> %4, <3 x half> %5, <3 x half> %6, <3 x half> %7, <3 x half> %8, <3 x half> %9, <3 x half> %10, <3 x half> %11, <3 x half> %12, <3 x half> %13, <3 x half> %14, <3 x half> %15, <3 x half> %16, [3 x float] addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %17, float addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %18, %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(260) "air-buffer-no-alias" %19, float addrspace(1)* nocapture noundef "air-buffer-no-alias" %20, %struct._texture_buffer_1d_t addrspace(1)* %21, i32 noundef %22) local_unnamed_addr #1 {
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 0
  %26 = load float, float addrspace(1)* %25, align 4, !alias.scope !50, !noalias !53
  %27 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 1
  %28 = load float, float addrspace(1)* %27, align 4, !alias.scope !50, !noalias !53
  %29 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 2
  %30 = load float, float addrspace(1)* %29, align 4, !alias.scope !50, !noalias !53
  %31 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 0
  %32 = load <4 x float>, <4 x float> addrspace(2)* %31, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %33 = insertelement <4 x float> poison, float %26, i64 0
  %34 = shufflevector <4 x float> %33, <4 x float> poison, <4 x i32> zeroinitializer
  %35 = fmul fast <4 x float> %32, %34
  %36 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 1
  %37 = load <4 x float>, <4 x float> addrspace(2)* %36, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %38 = insertelement <4 x float> poison, float %28, i64 0
  %39 = shufflevector <4 x float> %38, <4 x float> poison, <4 x i32> zeroinitializer
  %40 = fmul fast <4 x float> %37, %39
  %41 = fadd fast <4 x float> %40, %35
  %42 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 2
  %43 = load <4 x float>, <4 x float> addrspace(2)* %42, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %44 = insertelement <4 x float> poison, float %30, i64 0
  %45 = shufflevector <4 x float> %44, <4 x float> poison, <4 x i32> zeroinitializer
  %46 = fmul fast <4 x float> %43, %45
  %47 = fadd fast <4 x float> %41, %46
  %48 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 3
  %49 = load <4 x float>, <4 x float> addrspace(2)* %48, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %50 = fadd fast <4 x float> %47, %49
  %51 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 5
  %52 = load i32, i32 addrspace(2)* %51, align 4, !tbaa !61, !alias.scope !59, !noalias !60
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %70, label %54

54:                                               ; preds = %23
  %55 = getelementptr inbounds float, float addrspace(1)* %18, i64 %24
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !69, !alias.scope !71, !noalias !72
  br label %60

57:                                               ; preds = %60
  %58 = add nuw nsw i32 %61, 1
  %59 = icmp eq i32 %58, 5
  br i1 %59, label %70, label %60, !llvm.loop !73

60:                                               ; preds = %57, %54
  %61 = phi i32 [ 0, %54 ], [ %58, %57 ]
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 2, i32 0, i64 %62
  %64 = load <4 x float>, <4 x float> addrspace(2)* %63, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %65 = tail call fast float @air.dot.v4f32(<4 x float> %50, <4 x float> %64) #5
  %66 = fadd fast float %65, %56
  %67 = fcmp fast olt float %66, 0.000000e+00
  br i1 %67, label %68, label %57

68:                                               ; preds = %60
  %69 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float 0x7FF8000000000000, float addrspace(1)* %69, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %125

70:                                               ; preds = %57, %23
  %71 = insertelement <3 x float> undef, float %26, i64 0
  %72 = insertelement <3 x float> %71, float %28, i64 1
  %73 = insertelement <3 x float> %72, float %30, i64 2
  %74 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 3
  %75 = load <3 x float>, <3 x float> addrspace(2)* %74, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %76 = insertvalue %struct.Coeff1Attribute poison, <3 x half> %2, 0
  %77 = insertvalue %struct.Coeff1Attribute %76, <3 x half> %3, 1
  %78 = insertvalue %struct.Coeff1Attribute %77, <3 x half> %4, 2
  %79 = insertvalue %struct.Coeff2Attribute poison, <3 x half> %5, 0
  %80 = insertvalue %struct.Coeff2Attribute %79, <3 x half> %6, 1
  %81 = insertvalue %struct.Coeff2Attribute %80, <3 x half> %7, 2
  %82 = insertvalue %struct.Coeff2Attribute %81, <3 x half> %8, 3
  %83 = insertvalue %struct.Coeff2Attribute %82, <3 x half> %9, 4
  %84 = insertvalue %struct.Coeff3Attribute poison, <3 x half> %10, 0
  %85 = insertvalue %struct.Coeff3Attribute %84, <3 x half> %11, 1
  %86 = insertvalue %struct.Coeff3Attribute %85, <3 x half> %12, 2
  %87 = insertvalue %struct.Coeff3Attribute %86, <3 x half> %13, 3
  %88 = insertvalue %struct.Coeff3Attribute %87, <3 x half> %14, 4
  %89 = insertvalue %struct.Coeff3Attribute %88, <3 x half> %15, 5
  %90 = insertvalue %struct.Coeff3Attribute %89, <3 x half> %16, 6
  %91 = tail call fast fastcc <3 x half> @_Z18ComputeColorFromSHIDhEDv3_T_31PrecomputeDistanceAndColorInputDv3_fS3_(half %0, <3 x half> %1, %struct.Coeff1Attribute %78, %struct.Coeff2Attribute %83, %struct.Coeff3Attribute %90, <3 x float> noundef %73, <3 x float> noundef %75) #6
  %92 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 4
  %93 = load i32, i32 addrspace(2)* %92, align 16, !tbaa !77, !alias.scope !59, !noalias !60
  switch i32 %93, label %103 [
    i32 0, label %94
    i32 1, label %98
  ]

94:                                               ; preds = %70
  %95 = extractelement <4 x float> %50, i64 2
  %96 = tail call fast float @air.fast_fabs.f32(float %95) #5
  %97 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float %96, float addrspace(1)* %97, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %103

98:                                               ; preds = %70
  %99 = shufflevector <4 x float> %50, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %100 = tail call fast float @air.dot.v3f32(<3 x float> %99, <3 x float> %99) #5
  %101 = tail call fast float @air.fast_sqrt.f32(float %100) #5
  %102 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float %101, float addrspace(1)* %102, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %103

103:                                              ; preds = %98, %94, %70
  %104 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 8
  %105 = load i32, i32 addrspace(2)* %104, align 16, !tbaa !78, !alias.scope !59, !noalias !60
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %111

107:                                              ; preds = %103
  %108 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  %110 = fdiv fast float 1.000000e+00, %109
  store float %110, float addrspace(1)* %108, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %111

111:                                              ; preds = %107, %103
  %112 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 7
  %113 = load i32, i32 addrspace(2)* %112, align 4, !tbaa !79, !alias.scope !59, !noalias !60
  switch i32 %113, label %121 [
    i32 2, label %116
    i32 1, label %114
  ]

114:                                              ; preds = %111
  %115 = tail call fast half @air.exp.f16(half %0) #5
  br label %121

116:                                              ; preds = %111
  %117 = fneg fast half %0
  %118 = tail call fast half @air.exp.f16(half %117) #5
  %119 = fadd fast half %118, 0xH3C00
  %120 = fdiv fast half 0xH3C00, %119
  br label %121

121:                                              ; preds = %116, %114, %111
  %122 = phi half [ %120, %116 ], [ %115, %114 ], [ %0, %111 ]
  %123 = shufflevector <3 x half> %91, <3 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %124 = insertelement <4 x half> %123, half %122, i64 3
  tail call void @air.write_texture_buffer_1d.v4f16(%struct._texture_buffer_1d_t addrspace(1)* nocapture %21, i32 %22, <4 x half> %124, i32 2) #7, !alias.scope !80, !noalias !81
  br label %125

125:                                              ; preds = %121, %68
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_buffer_1d.v4f16(%struct._texture_buffer_1d_t addrspace(1)* nocapture, i32, <4 x half>, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare half @air.exp.f16(half) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.dot.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fabs.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nounwind
define internal fastcc <3 x half> @_Z18ComputeColorFromSHIDhEDv3_T_31PrecomputeDistanceAndColorInputDv3_fS3_(half %0, <3 x half> %1, %struct.Coeff1Attribute %2, %struct.Coeff2Attribute %3, %struct.Coeff3Attribute %4, <3 x float> noundef %5, <3 x float> noundef %6) unnamed_addr #4 {
  %8 = extractvalue %struct.Coeff2Attribute %3, 0
  %9 = extractvalue %struct.Coeff2Attribute %3, 1
  %10 = extractvalue %struct.Coeff2Attribute %3, 2
  %11 = extractvalue %struct.Coeff2Attribute %3, 3
  %12 = extractvalue %struct.Coeff2Attribute %3, 4
  %13 = extractvalue %struct.Coeff3Attribute %4, 0
  %14 = extractvalue %struct.Coeff3Attribute %4, 1
  %15 = extractvalue %struct.Coeff3Attribute %4, 2
  %16 = extractvalue %struct.Coeff3Attribute %4, 3
  %17 = extractvalue %struct.Coeff3Attribute %4, 4
  %18 = extractvalue %struct.Coeff3Attribute %4, 5
  %19 = extractvalue %struct.Coeff3Attribute %4, 6
  %20 = fmul fast <3 x half> %1, <half 0xH3483, half 0xH3483, half 0xH3483>
  %21 = load i8, i8 addrspace(2)* @_ZL6kUseC1, align 1, !tbaa !48, !range !82
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %138, label %23

23:                                               ; preds = %7
  %24 = extractvalue %struct.Coeff1Attribute %2, 2
  %25 = extractvalue %struct.Coeff1Attribute %2, 1
  %26 = extractvalue %struct.Coeff1Attribute %2, 0
  %27 = fsub fast <3 x float> %5, %6
  %28 = tail call fast float @air.dot.v3f32(<3 x float> %27, <3 x float> %27) #5
  %29 = tail call fast float @air.fast_rsqrt.f32(float %28) #5
  %30 = insertelement <3 x float> poison, float %29, i64 0
  %31 = shufflevector <3 x float> %30, <3 x float> poison, <3 x i32> zeroinitializer
  %32 = fmul fast <3 x float> %31, %27
  %33 = tail call fast <3 x half> @air.convert.f.v3f16.f.v3f32(<3 x float> %32) #5
  %34 = extractelement <3 x half> %33, i64 1
  %35 = fneg fast half %34
  %36 = insertelement <3 x half> poison, half %35, i64 0
  %37 = shufflevector <3 x half> %36, <3 x half> poison, <3 x i32> zeroinitializer
  %38 = fmul fast <3 x half> %37, %26
  %39 = extractelement <3 x half> %33, i64 2
  %40 = shufflevector <3 x half> %33, <3 x half> undef, <3 x i32> <i32 2, i32 2, i32 2>
  %41 = fmul fast <3 x half> %40, %25
  %42 = extractelement <3 x half> %33, i64 0
  %43 = shufflevector <3 x half> %33, <3 x half> poison, <3 x i32> zeroinitializer
  %44 = fmul fast <3 x half> %24, %43
  %45 = fsub fast <3 x half> %41, %44
  %46 = fadd fast <3 x half> %45, %38
  %47 = fmul fast <3 x half> %46, <half 0xH37D1, half 0xH37D1, half 0xH37D1>
  %48 = fadd fast <3 x half> %47, %20
  %49 = load i8, i8 addrspace(2)* @_ZL6kUseC2, align 1, !tbaa !48, !range !82
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %138, label %51

51:                                               ; preds = %23
  %52 = fmul fast half %42, %42
  %53 = fmul fast half %34, %34
  %54 = fmul fast half %39, %39
  %55 = fmul fast half %42, %34
  %56 = fmul fast half %55, 0xH3C5F
  %57 = insertelement <3 x half> poison, half %56, i64 0
  %58 = shufflevector <3 x half> %57, <3 x half> poison, <3 x i32> zeroinitializer
  %59 = fmul fast <3 x half> %58, %8
  %60 = fmul fast half %39, 0xHBC5F
  %61 = fmul fast half %60, %34
  %62 = insertelement <3 x half> poison, half %61, i64 0
  %63 = shufflevector <3 x half> %62, <3 x half> poison, <3 x i32> zeroinitializer
  %64 = fmul fast <3 x half> %63, %9
  %65 = fadd fast <3 x half> %59, %64
  %66 = fmul fast half %54, 0xH4000
  %67 = fadd fast half %52, %53
  %68 = fsub fast half %66, %67
  %69 = fmul fast half %68, 0xH350C
  %70 = insertelement <3 x half> poison, half %69, i64 0
  %71 = shufflevector <3 x half> %70, <3 x half> poison, <3 x i32> zeroinitializer
  %72 = fmul fast <3 x half> %71, %10
  %73 = fmul fast half %60, %42
  %74 = insertelement <3 x half> poison, half %73, i64 0
  %75 = shufflevector <3 x half> %74, <3 x half> poison, <3 x i32> zeroinitializer
  %76 = fmul fast <3 x half> %75, %11
  %77 = fsub fast half %52, %53
  %78 = fmul fast half %77, 0xH385F
  %79 = insertelement <3 x half> poison, half %78, i64 0
  %80 = shufflevector <3 x half> %79, <3 x half> poison, <3 x i32> zeroinitializer
  %81 = fmul fast <3 x half> %80, %12
  %82 = fadd fast <3 x half> %65, %76
  %83 = fadd fast <3 x half> %82, %81
  %84 = fadd fast <3 x half> %83, %48
  %85 = fadd fast <3 x half> %84, %72
  %86 = load i8, i8 addrspace(2)* @_ZL6kUseC3, align 1, !tbaa !48, !range !82
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %138, label %88

88:                                               ; preds = %51
  %89 = fmul fast half %34, 0xHB8B8
  %90 = fmul fast half %52, 0xH4200
  %91 = fsub fast half %90, %53
  %92 = fmul fast half %89, %91
  %93 = insertelement <3 x half> poison, half %92, i64 0
  %94 = shufflevector <3 x half> %93, <3 x half> poison, <3 x i32> zeroinitializer
  %95 = fmul fast <3 x half> %94, %13
  %96 = fmul fast half %39, 0xH41C8
  %97 = fmul fast half %96, %55
  %98 = insertelement <3 x half> poison, half %97, i64 0
  %99 = shufflevector <3 x half> %98, <3 x half> poison, <3 x i32> zeroinitializer
  %100 = fmul fast <3 x half> %99, %14
  %101 = fmul fast half %54, 0xH4400
  %102 = fsub fast half %101, %67
  %103 = fmul fast half %102, 0xHB750
  %104 = fmul fast half %103, %34
  %105 = insertelement <3 x half> poison, half %104, i64 0
  %106 = shufflevector <3 x half> %105, <3 x half> poison, <3 x i32> zeroinitializer
  %107 = fmul fast <3 x half> %106, %15
  %108 = fmul fast half %39, 0xH35F9
  %109 = fmul fast half %53, 0xH4200
  %110 = fadd fast half %109, %90
  %111 = fsub fast half %66, %110
  %112 = fmul fast half %108, %111
  %113 = insertelement <3 x half> poison, half %112, i64 0
  %114 = shufflevector <3 x half> %113, <3 x half> poison, <3 x i32> zeroinitializer
  %115 = fmul fast <3 x half> %114, %16
  %116 = fmul fast half %103, %42
  %117 = insertelement <3 x half> poison, half %116, i64 0
  %118 = shufflevector <3 x half> %117, <3 x half> poison, <3 x i32> zeroinitializer
  %119 = fmul fast <3 x half> %118, %17
  %120 = fmul fast half %39, 0xH3DC8
  %121 = fmul fast half %120, %77
  %122 = insertelement <3 x half> poison, half %121, i64 0
  %123 = shufflevector <3 x half> %122, <3 x half> poison, <3 x i32> zeroinitializer
  %124 = fmul fast <3 x half> %123, %18
  %125 = fmul fast half %42, 0xHB8B8
  %126 = fsub fast half %52, %109
  %127 = fmul fast half %125, %126
  %128 = insertelement <3 x half> poison, half %127, i64 0
  %129 = shufflevector <3 x half> %128, <3 x half> poison, <3 x i32> zeroinitializer
  %130 = fmul fast <3 x half> %129, %19
  %131 = fadd fast <3 x half> %119, %107
  %132 = fadd fast <3 x half> %131, %100
  %133 = fadd fast <3 x half> %132, %124
  %134 = fadd fast <3 x half> %133, %95
  %135 = fadd fast <3 x half> %134, %130
  %136 = fadd fast <3 x half> %135, %115
  %137 = fadd fast <3 x half> %136, %85
  br label %138

138:                                              ; preds = %88, %51, %23, %7
  %139 = phi <3 x half> [ %20, %7 ], [ %48, %23 ], [ %137, %88 ], [ %85, %51 ]
  %140 = fadd fast <3 x half> %139, <half 0xH3800, half 0xH3800, half 0xH3800>
  %141 = tail call fast <3 x half> @air.fmax.v3f16(<3 x half> %140, <3 x half> zeroinitializer) #5
  ret <3 x half> %141
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x half> @air.fmax.v3f16(<3 x half>, <3 x half>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x half> @air.convert.f.v3f16.f.v3f32(<3 x float>) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_rsqrt.f32(float) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.dot.v4f32(<4 x float>, <4 x float>) local_unnamed_addr #3

attributes #0 = { mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #2 = { argmemonly mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="96" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { nobuiltin "no-builtins" }
attributes #7 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}
!air.function_constants = !{!43}

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
!15 = !{void (half, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, <3 x half>, [3 x float] addrspace(1)*, float addrspace(1)*, %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)*, float addrspace(1)*, %struct._texture_buffer_1d_t addrspace(1)*, i32)* @PrecomputeDistanceAndColor, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !40, !41, !42}
!18 = !{i32 0, !"air.stage_in", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"half", !"air.arg_name", !"alpha"}
!19 = !{i32 1, !"air.stage_in", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh0"}
!20 = !{i32 2, !"air.stage_in", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh1"}
!21 = !{i32 3, !"air.stage_in", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh2"}
!22 = !{i32 4, !"air.stage_in", !"air.location_index", i32 4, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh3"}
!23 = !{i32 5, !"air.stage_in", !"air.location_index", i32 5, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh4"}
!24 = !{i32 6, !"air.stage_in", !"air.location_index", i32 6, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh5"}
!25 = !{i32 7, !"air.stage_in", !"air.location_index", i32 7, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh6"}
!26 = !{i32 8, !"air.stage_in", !"air.location_index", i32 8, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh7"}
!27 = !{i32 9, !"air.stage_in", !"air.location_index", i32 9, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh8"}
!28 = !{i32 10, !"air.stage_in", !"air.location_index", i32 10, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh9"}
!29 = !{i32 11, !"air.stage_in", !"air.location_index", i32 11, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh10"}
!30 = !{i32 12, !"air.stage_in", !"air.location_index", i32 12, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh11"}
!31 = !{i32 13, !"air.stage_in", !"air.location_index", i32 13, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh12"}
!32 = !{i32 14, !"air.stage_in", !"air.location_index", i32 14, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh13"}
!33 = !{i32 15, !"air.stage_in", !"air.location_index", i32 15, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh14"}
!34 = !{i32 16, !"air.stage_in", !"air.location_index", i32 16, i32 1, !"air.arg_type_name", !"half3", !"air.arg_name", !"sh15"}
!35 = !{i32 17, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"coords"}
!36 = !{i32 18, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"radius"}
!37 = !{i32 19, !"air.buffer", !"air.buffer_size", i32 272, !"air.location_index", i32 4, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !38, !"air.arg_type_size", i32 272, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"apple3dgs::PreComputeDistanceUniforms", !"air.arg_name", !"uniforms"}
!38 = !{i32 0, i32 64, i32 0, !"float4x4", !"model_view", i32 64, i32 64, i32 0, !"float4x4", !"projection", !"air.struct_type_info", !39, i32 128, i32 96, i32 0, !"metal::array", !"frustum_planes", i32 224, i32 16, i32 0, !"float3", !"cam_position", i32 240, i32 4, i32 0, !"int", !"sorting_mode", i32 244, i32 4, i32 0, !"int", !"culling_mode", i32 248, i32 4, i32 0, !"uint", !"size", i32 252, i32 4, i32 0, !"int", !"activation_opacity", i32 256, i32 4, i32 0, !"int", !"blending_order"}
!39 = !{i32 0, i32 16, i32 6, !"float4", !"__elems"}
!40 = !{i32 20, !"air.buffer", !"air.location_index", i32 5, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"distances"}
!41 = !{i32 21, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.write", !"air.arg_type_name", !"texture_buffer<half, write>", !"air.arg_name", !"colors"}
!42 = !{i32 22, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!43 = !{i32 addrspace(2)* @_Z18kSplattingShDegree.MTL_FC_INIT_5_j, !"uint", !"kSplattingShDegree", i32 5, i1 true}
!44 = !{!45, !45, i64 0}
!45 = !{!"int", !46, i64 0}
!46 = !{!"omnipotent char", !47, i64 0}
!47 = !{!"Simple C++ TBAA"}
!48 = !{!49, !49, i64 0}
!49 = !{!"bool", !46, i64 0}
!50 = !{!51}
!51 = distinct !{!51, !52, !"air-alias-scope-arg(17)"}
!52 = distinct !{!52, !"air-alias-scopes(PrecomputeDistanceAndColor)"}
!53 = !{!54, !55, !56, !57}
!54 = distinct !{!54, !52, !"air-alias-scope-arg(18)"}
!55 = distinct !{!55, !52, !"air-alias-scope-arg(19)"}
!56 = distinct !{!56, !52, !"air-alias-scope-arg(20)"}
!57 = distinct !{!57, !52, !"air-alias-scope-textures"}
!58 = !{!46, !46, i64 0}
!59 = !{!55}
!60 = !{!51, !54, !56, !57}
!61 = !{!62, !66, i64 244}
!62 = !{!"_ZTSN9apple3dgs26PreComputeDistanceUniformsE", !63, i64 0, !63, i64 64, !64, i64 128, !46, i64 224, !65, i64 240, !66, i64 244, !45, i64 248, !67, i64 252, !68, i64 256}
!63 = !{!"_ZTSN5metal6matrixIfLi4ELi4EvEE", !46, i64 0}
!64 = !{!"_ZTSN5metal5arrayIDv4_fLm6EEE", !46, i64 0}
!65 = !{!"_ZTSN9apple3dgs11SortingModeE", !46, i64 0}
!66 = !{!"_ZTSN9apple3dgs11CullingModeE", !46, i64 0}
!67 = !{!"_ZTSN9apple3dgs14ActivationTypeE", !46, i64 0}
!68 = !{!"_ZTSN9apple3dgs13BlendingOrderE", !46, i64 0}
!69 = !{!70, !70, i64 0}
!70 = !{!"float", !46, i64 0}
!71 = !{!54}
!72 = !{!51, !55, !56, !57}
!73 = distinct !{!73, !74}
!74 = !{!"llvm.loop.mustprogress"}
!75 = !{!56}
!76 = !{!51, !54, !55, !57}
!77 = !{!62, !65, i64 240}
!78 = !{!62, !68, i64 256}
!79 = !{!62, !67, i64 252}
!80 = !{!57}
!81 = !{!51, !54, !55, !56}
!82 = !{i8 0, i8 2}

0x00000000017ec0 -- ComputePrimitiveIndices:
source_filename = "ComputePrimitiveIndices"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define void @ComputePrimitiveIndices(float addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, i32 addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = zext i32 %2 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  %6 = bitcast float addrspace(1)* %5 to i32 addrspace(1)*
  %7 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !21, !alias.scope !25, !noalias !28
  %8 = and i32 %7, 2147483647
  %9 = icmp ugt i32 %8, 2139095040
  br i1 %9, label %10, label %20

10:                                               ; preds = %3
  %11 = icmp eq i32 %2, 0
  br i1 %11, label %19, label %12

12:                                               ; preds = %10
  %13 = add i32 %2, -1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !21, !alias.scope !25, !noalias !28
  %17 = fcmp fast ogt float %16, 0.000000e+00
  br i1 %17, label %18, label %20

18:                                               ; preds = %12
  store i32 %2, i32 addrspace(1)* %1, align 4, !tbaa !30, !alias.scope !28, !noalias !25
  br label %20

19:                                               ; preds = %10
  store i32 0, i32 addrspace(1)* %1, align 4, !tbaa !30, !alias.scope !28, !noalias !25
  br label %20

20:                                               ; preds = %19, %18, %12, %3
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (float addrspace(1)*, i32 addrspace(1)*, i32)* @ComputePrimitiveIndices, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"sorted_distances"}
!19 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"index_count"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = !{!26}
!26 = distinct !{!26, !27, !"air-alias-scope-arg(0)"}
!27 = distinct !{!27, !"air-alias-scopes(ComputePrimitiveIndices)"}
!28 = !{!29}
!29 = distinct !{!29, !27, !"air-alias-scope-arg(1)"}
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !23, i64 0}

0x00000000018d00 -- UpscaleTexture:
source_filename = "UpscaleTexture"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state = internal addrspace(2) constant [2 x i64] [i64 34901797601020489, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind willreturn
define void @UpscaleTexture(<2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %0, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %1, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %2, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, <2 x i32> noundef %8) local_unnamed_addr #0 {
  %10 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #5, !alias.scope !28, !noalias !31
  %11 = insertelement <2 x i32> undef, i32 %10, i64 0
  %12 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #5, !alias.scope !28, !noalias !31
  %13 = insertelement <2 x i32> %11, i32 %12, i64 1
  %14 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #5, !alias.scope !28, !noalias !31
  %15 = extractelement <2 x i32> %8, i64 0
  %16 = icmp ult i32 %15, %14
  br i1 %16, label %17, label %61

17:                                               ; preds = %9
  %18 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #5, !alias.scope !28, !noalias !31
  %19 = extractelement <2 x i32> %8, i64 1
  %20 = icmp ult i32 %19, %18
  br i1 %20, label %21, label %61

21:                                               ; preds = %17
  %22 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !alias.scope !38, !noalias !39
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = icmp ult i32 %15, %23
  br i1 %24, label %35, label %25

25:                                               ; preds = %21
  %26 = load <2 x i32>, <2 x i32> addrspace(2)* %3, align 8, !alias.scope !40, !noalias !41
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = icmp ult i32 %15, %27
  %29 = extractelement <2 x i32> %22, i64 1
  %30 = icmp uge i32 %19, %29
  %31 = select i1 %28, i1 %30, i1 false
  %32 = extractelement <2 x i32> %26, i64 1
  %33 = icmp ult i32 %19, %32
  %34 = select i1 %31, i1 %33, i1 false
  br i1 %34, label %39, label %35

35:                                               ; preds = %25, %21
  %36 = load float, float addrspace(2)* %4, align 4, !tbaa !42, !alias.scope !46, !noalias !47
  %37 = insertelement <4 x float> poison, float %36, i64 0
  %38 = shufflevector <4 x float> %37, <4 x float> poison, <4 x i32> zeroinitializer
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %7, <2 x i32> %8, <4 x float> %38, i32 0, i32 2) #6, !alias.scope !28, !noalias !31
  br label %61

39:                                               ; preds = %25
  %40 = sub <2 x i32> %8, %22
  %41 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %40) #7
  %42 = fadd fast <2 x float> %41, <float 5.000000e-01, float 5.000000e-01>
  %43 = sub <2 x i32> %26, %22
  %44 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %43) #7
  %45 = load <2 x i32>, <2 x i32> addrspace(2)* %1, align 8, !tbaa !48, !alias.scope !49, !noalias !50
  %46 = load <2 x i32>, <2 x i32> addrspace(2)* %0, align 8, !tbaa !48, !alias.scope !51, !noalias !52
  %47 = sub <2 x i32> %45, %46
  %48 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %47) #7
  %49 = fmul fast <2 x float> %48, %42
  %50 = fdiv fast <2 x float> %49, %44
  %51 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %46) #7
  %52 = fadd fast <2 x float> %50, %51
  %53 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %13) #7
  %54 = fdiv fast <2 x float> %52, %53
  %55 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %54, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %56 = extractvalue { <4 x float>, i8 } %55, 0
  %57 = load float, float addrspace(2)* %5, align 4, !tbaa !42, !alias.scope !53, !noalias !54
  %58 = insertelement <4 x float> poison, float %57, i64 0
  %59 = shufflevector <4 x float> %58, <4 x float> poison, <4 x i32> zeroinitializer
  %60 = fmul fast <4 x float> %59, %56
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %7, <2 x i32> %8, <4 x float> %60, i32 0, i32 2) #6, !alias.scope !28, !noalias !31
  br label %61

61:                                               ; preds = %39, %35, %17, %9
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

attributes #0 = { convergent mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #5 = { argmemonly nounwind readonly willreturn }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind readnone willreturn }
attributes #8 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}
!air.sampler_states = !{!27}

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
!15 = !{void (<2 x i32> addrspace(2)*, <2 x i32> addrspace(2)*, <2 x i32> addrspace(2)*, <2 x i32> addrspace(2)*, float addrspace(2)*, float addrspace(2)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, <2 x i32>)* @UpscaleTexture, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26}
!18 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"in_min"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"in_max"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"out_min"}
!21 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"out_max"}
!22 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 4, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"background_intensity"}
!23 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 5, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"gain"}
!24 = !{i32 6, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"input"}
!25 = !{i32 7, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"output"}
!26 = !{i32 8, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!27 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state}
!28 = !{!29}
!29 = distinct !{!29, !30, !"air-alias-scope-textures"}
!30 = distinct !{!30, !"air-alias-scopes(UpscaleTexture)"}
!31 = !{!32, !33, !34, !35, !36, !37}
!32 = distinct !{!32, !30, !"air-alias-scope-arg(0)"}
!33 = distinct !{!33, !30, !"air-alias-scope-arg(1)"}
!34 = distinct !{!34, !30, !"air-alias-scope-arg(2)"}
!35 = distinct !{!35, !30, !"air-alias-scope-arg(3)"}
!36 = distinct !{!36, !30, !"air-alias-scope-arg(4)"}
!37 = distinct !{!37, !30, !"air-alias-scope-arg(5)"}
!38 = !{!34}
!39 = !{!32, !33, !35, !36, !37, !29}
!40 = !{!35}
!41 = !{!32, !33, !34, !36, !37, !29}
!42 = !{!43, !43, i64 0}
!43 = !{!"float", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C++ TBAA"}
!46 = !{!36}
!47 = !{!32, !33, !34, !35, !37, !29}
!48 = !{!44, !44, i64 0}
!49 = !{!33}
!50 = !{!32, !34, !35, !36, !37, !29}
!51 = !{!32}
!52 = !{!33, !34, !35, !36, !37, !29}
!53 = !{!37}
!54 = !{!32, !33, !34, !35, !36, !29}

0x0000000001a220 -- ConcateDiffuseRest:
source_filename = "ConcateDiffuseRest"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define void @ConcateDiffuseRest([3 x float] addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, [3 x float] addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, [3 x float] addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !23, !alias.scope !27, !noalias !30
  %7 = add i32 %6, 1
  %8 = mul i32 %7, %7
  %9 = mul i32 %8, %4
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %3, i64 %10
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %12, i64 0
  %14 = load float, float addrspace(1)* %13, align 4, !alias.scope !34, !noalias !35
  %15 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %12, i64 1
  %16 = load float, float addrspace(1)* %15, align 4, !alias.scope !34, !noalias !35
  %17 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %12, i64 2
  %18 = load float, float addrspace(1)* %17, align 4, !alias.scope !34, !noalias !35
  %19 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %11, i64 0, i64 0
  store float %14, float addrspace(1)* %19, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %20 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %3, i64 %10, i64 1
  store float %16, float addrspace(1)* %20, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %21 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %3, i64 %10, i64 2
  store float %18, float addrspace(1)* %21, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %22 = add i32 %8, -1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %5
  %25 = mul i32 %22, %4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %1, i64 %26
  br label %29

28:                                               ; preds = %29, %5
  ret void

29:                                               ; preds = %29, %24
  %30 = phi i32 [ 0, %24 ], [ %39, %29 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %27, i64 %31
  %33 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %32, i64 0, i64 0
  %34 = load float, float addrspace(1)* %33, align 4, !alias.scope !40, !noalias !41
  %35 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %32, i64 0, i64 1
  %36 = load float, float addrspace(1)* %35, align 4, !alias.scope !40, !noalias !41
  %37 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %32, i64 0, i64 2
  %38 = load float, float addrspace(1)* %37, align 4, !alias.scope !40, !noalias !41
  %39 = add nuw i32 %30, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %11, i64 %40
  %42 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %41, i64 0, i64 0
  store float %34, float addrspace(1)* %42, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %43 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %41, i64 0, i64 1
  store float %36, float addrspace(1)* %43, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %44 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %41, i64 0, i64 2
  store float %38, float addrspace(1)* %44, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %45 = icmp eq i32 %39, %22
  br i1 %45, label %28, label %29, !llvm.loop !42
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void ([3 x float] addrspace(1)*, [3 x float] addrspace(1)*, i32 addrspace(2)*, [3 x float] addrspace(1)*, i32)* @ConcateDiffuseRest, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"colors_diffuse"}
!19 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"colors_rest"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"degree"}
!21 = !{i32 3, !"air.buffer", !"air.location_index", i32 3, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"shs"}
!22 = !{i32 4, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"air-alias-scope-arg(2)"}
!29 = distinct !{!29, !"air-alias-scopes(ConcateDiffuseRest)"}
!30 = !{!31, !32, !33}
!31 = distinct !{!31, !29, !"air-alias-scope-arg(0)"}
!32 = distinct !{!32, !29, !"air-alias-scope-arg(1)"}
!33 = distinct !{!33, !29, !"air-alias-scope-arg(3)"}
!34 = !{!31}
!35 = !{!32, !28, !33}
!36 = !{!37, !37, i64 0}
!37 = !{!"float", !25, i64 0}
!38 = !{!33}
!39 = !{!31, !32, !28}
!40 = !{!32}
!41 = !{!31, !28, !33}
!42 = distinct !{!42, !43}
!43 = !{!"llvm.loop.mustprogress"}

0x0000000001b240 -- NDCDepthToRealDepth:
source_filename = "NDCDepthToRealDepth"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._depth_2d_t = type opaque
%struct._texture_2d_t = type opaque
%"struct.metal::matrix.1" = type { [4 x <4 x float>] }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind willreturn
define void @NDCDepthToRealDepth(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._texture_2d_t addrspace(1)* %1, %"struct.metal::matrix.1" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %2, <3 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = shufflevector <3 x i32> %3, <3 x i32> poison, <2 x i32> <i32 0, i32 1>
  %6 = tail call { float, i8 } @air.read_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 1, <2 x i32> %5, i32 0, i32 1) #3, !alias.scope !22, !noalias !25
  %7 = extractvalue { float, i8 } %6, 0
  %8 = fcmp fast ogt float %7, 0.000000e+00
  br i1 %8, label %9, label %18

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %2, i64 0, i32 0, i64 3
  %11 = load <4 x float>, <4 x float> addrspace(2)* %10, align 16, !tbaa !27, !alias.scope !25, !noalias !22
  %12 = extractelement <4 x float> %11, i64 2
  %13 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %2, i64 0, i32 0, i64 2
  %14 = load <4 x float>, <4 x float> addrspace(2)* %13, align 16, !tbaa !27, !alias.scope !25, !noalias !22
  %15 = extractelement <4 x float> %14, i64 2
  %16 = fsub fast float %7, %15
  %17 = fdiv fast float %12, %16
  br label %18

18:                                               ; preds = %9, %4
  %19 = phi fast float [ %17, %9 ], [ 0.000000e+00, %4 ]
  %20 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00>, float %19, i64 0
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %20, i32 0, i32 2) #4, !alias.scope !22, !noalias !25
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { float, i8 } @air.read_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly, i32, <2 x i32>, i32, i32) local_unnamed_addr #2

attributes #0 = { mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #3 = { argmemonly nounwind readonly willreturn }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (%struct._depth_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %"struct.metal::matrix.1" addrspace(2)*, <3 x i32>)* @NDCDepthToRealDepth, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.read", !"air.arg_type_name", !"depth2d<float, read>", !"air.arg_name", !"ndc_depth_texture"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"real_depth_texture"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 64, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 64, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4x4", !"air.arg_name", !"ndc_projection"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint3", !"air.arg_name", !"gid"}
!22 = !{!23}
!23 = distinct !{!23, !24, !"air-alias-scope-textures"}
!24 = distinct !{!24, !"air-alias-scopes(NDCDepthToRealDepth)"}
!25 = !{!26}
!26 = distinct !{!26, !24, !"air-alias-scope-arg(2)"}
!27 = !{!28, !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C++ TBAA"}

0x0000000001c220 -- FlipYAxis:
source_filename = "FlipYAxis"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind willreturn
define void @FlipYAxis(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._texture_2d_t addrspace(1)* %1, <2 x i32> noundef %2) local_unnamed_addr #0 {
  %4 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, <2 x i32> %2, i32 0, i32 1) #3, !alias.scope !21
  %5 = extractvalue { <4 x float>, i8 } %4, 0
  %6 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, i32 0) #3, !alias.scope !21
  %7 = extractelement <2 x i32> %2, i64 1
  %8 = xor i32 %7, -1
  %9 = add i32 %6, %8
  %10 = insertelement <2 x i32> %2, i32 %9, i64 1
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %10, <4 x float> %5, i32 0, i32 2) #4, !alias.scope !21
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, <2 x i32>, i32, i32) local_unnamed_addr #2

attributes #0 = { mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #3 = { argmemonly nounwind readonly willreturn }
attributes #4 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (%struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, <2 x i32>)* @FlipYAxis, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.read", !"air.arg_type_name", !"texture2d<float, read>", !"air.arg_name", !"input"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"output"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!21 = !{!22}
!22 = distinct !{!22, !23, !"air-alias-scope-textures"}
!23 = distinct !{!23, !"air-alias-scopes(FlipYAxis)"}

0x0000000001d050 -- ComputeIndexRange:
source_filename = "ComputeIndexRange"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.apple3dgs::ComputeIndexRangeUniforms" = type { <2 x float>, i32, i32 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define void @ComputeIndexRange(float addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, %"struct.apple3dgs::ComputeIndexRangeUniforms" addrspace(2)* nocapture noundef readonly align 8 dereferenceable(16) "air-buffer-no-alias" %1, i32 addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %"struct.apple3dgs::ComputeIndexRangeUniforms", %"struct.apple3dgs::ComputeIndexRangeUniforms" addrspace(2)* %1, i64 0, i32 0
  %6 = load <2 x float>, <2 x float> addrspace(2)* %5, align 8, !tbaa !23, !alias.scope !26, !noalias !29
  %7 = extractelement <2 x float> %6, i64 0
  %8 = extractelement <2 x float> %6, i64 1
  %9 = zext i32 %3 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = bitcast float addrspace(1)* %10 to i32 addrspace(1)*
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !32, !alias.scope !34, !noalias !35
  %13 = and i32 %12, 2147483647
  %14 = icmp ugt i32 %13, 2139095040
  %15 = bitcast i32 %12 to float
  br i1 %14, label %52, label %16

16:                                               ; preds = %4
  %17 = add i32 %3, 1
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = bitcast float addrspace(1)* %19 to i32 addrspace(1)*
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !32, !alias.scope !34, !noalias !35
  %22 = and i32 %21, 2147483647
  %23 = icmp ugt i32 %22, 2139095040
  %24 = bitcast i32 %21 to float
  br i1 %23, label %52, label %25

25:                                               ; preds = %16
  %26 = getelementptr inbounds %"struct.apple3dgs::ComputeIndexRangeUniforms", %"struct.apple3dgs::ComputeIndexRangeUniforms" addrspace(2)* %1, i64 0, i32 2
  %27 = load i32, i32 addrspace(2)* %26, align 4, !tbaa !36, !alias.scope !26, !noalias !29
  switch i32 %27, label %52 [
    i32 0, label %28
    i32 1, label %41
  ]

28:                                               ; preds = %25
  %29 = fdiv fast float 1.000000e+00, %15
  %30 = fdiv fast float 1.000000e+00, %24
  %31 = fcmp fast ule float %29, %8
  %32 = fcmp fast ugt float %30, %8
  %33 = select i1 %31, i1 true, i1 %32
  br i1 %33, label %35, label %34

34:                                               ; preds = %28
  store i32 %3, i32 addrspace(1)* %2, align 4, !tbaa !40, !alias.scope !41, !noalias !42
  br label %35

35:                                               ; preds = %34, %28
  %36 = fcmp fast ule float %29, %7
  %37 = fcmp fast ugt float %30, %7
  %38 = select i1 %36, i1 true, i1 %37
  br i1 %38, label %52, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  store i32 %3, i32 addrspace(1)* %40, align 4, !tbaa !40, !alias.scope !41, !noalias !42
  br label %52

41:                                               ; preds = %25
  %42 = fcmp fast oge float %7, %15
  %43 = fcmp fast olt float %7, %24
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  store i32 %3, i32 addrspace(1)* %2, align 4, !tbaa !40, !alias.scope !41, !noalias !42
  br label %46

46:                                               ; preds = %45, %41
  %47 = fcmp fast oge float %8, %15
  %48 = fcmp fast olt float %8, %24
  %49 = select i1 %47, i1 %48, i1 false
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  store i32 %3, i32 addrspace(1)* %51, align 4, !tbaa !40, !alias.scope !41, !noalias !42
  br label %52

52:                                               ; preds = %50, %46, %39, %35, %25, %16, %4
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (float addrspace(1)*, %"struct.apple3dgs::ComputeIndexRangeUniforms" addrspace(2)*, i32 addrspace(1)*, i32)* @ComputeIndexRange, !16, !17}
!16 = !{}
!17 = !{!18, !19, !21, !22}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"sorted_distances"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !20, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"apple3dgs::ComputeIndexRangeUniforms", !"air.arg_name", !"uniforms"}
!20 = !{i32 0, i32 8, i32 0, !"float2", !"near_far_planes", i32 8, i32 4, i32 0, !"uint", !"pnum", i32 12, i32 4, i32 0, !"int", !"blending_order"}
!21 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"range"}
!22 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!23 = !{!24, !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(1)"}
!28 = distinct !{!28, !"air-alias-scopes(ComputeIndexRange)"}
!29 = !{!30, !31}
!30 = distinct !{!30, !28, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !28, !"air-alias-scope-arg(2)"}
!32 = !{!33, !33, i64 0}
!33 = !{!"float", !24, i64 0}
!34 = !{!30}
!35 = !{!27, !31}
!36 = !{!37, !39, i64 12}
!37 = !{!"_ZTSN9apple3dgs25ComputeIndexRangeUniformsE", !24, i64 0, !38, i64 8, !39, i64 12}
!38 = !{!"int", !24, i64 0}
!39 = !{!"_ZTSN9apple3dgs13BlendingOrderE", !24, i64 0}
!40 = !{!38, !38, i64 0}
!41 = !{!31}
!42 = !{!30, !27}

0x0000000001e130 -- UpdateIndirectBuffer:
source_filename = "UpdateIndirectBuffer"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.metal::MTLDrawPrimitivesIndirectArguments" = type { i32, i32, i32, i32 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @UpdateIndirectBuffer(i32 addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* nocapture noundef writeonly align 4 dereferenceable(16) "air-buffer-no-alias" %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %1, align 4, !tbaa !23, !alias.scope !27, !noalias !30
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 0
  store i32 %5, i32 addrspace(1)* %8, align 4, !tbaa !34, !alias.scope !36, !noalias !37
  br label %9

9:                                                ; preds = %7, %4
  %10 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !23, !alias.scope !38, !noalias !39
  %11 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 2
  store i32 %10, i32 addrspace(1)* %11, align 4, !tbaa !40, !alias.scope !36, !noalias !37
  %12 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !23, !alias.scope !41, !noalias !42
  %13 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 3
  store i32 %12, i32 addrspace(1)* %13, align 4, !tbaa !43, !alias.scope !36, !noalias !37
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !23, !alias.scope !41, !noalias !42
  %16 = sub i32 1, %12
  %17 = add i32 %16, %15
  %18 = tail call i32 @air.abs.u.i32(i32 %17) #2
  %19 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 1
  store i32 %18, i32 addrspace(1)* %19, align 4, !tbaa !44, !alias.scope !36, !noalias !37
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @air.abs.u.i32(i32) local_unnamed_addr #1

attributes #0 = { argmemonly mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(2)*, i32 addrspace(2)*, %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)*)* @UpdateIndirectBuffer, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"range"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"int", !"air.arg_name", !"vertex_count"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"vertex_start"}
!21 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 3, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.struct_type_info", !22, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"metal::MTLDrawPrimitivesIndirectArguments", !"air.arg_name", !"indirect_buffer"}
!22 = !{i32 0, i32 4, i32 0, !"uint", !"vertexCount", i32 4, i32 4, i32 0, !"uint", !"instanceCount", i32 8, i32 4, i32 0, !"uint", !"vertexStart", i32 12, i32 4, i32 0, !"uint", !"baseInstance"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C++ TBAA"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"air-alias-scope-arg(1)"}
!29 = distinct !{!29, !"air-alias-scopes(UpdateIndirectBuffer)"}
!30 = !{!31, !32, !33}
!31 = distinct !{!31, !29, !"air-alias-scope-arg(0)"}
!32 = distinct !{!32, !29, !"air-alias-scope-arg(2)"}
!33 = distinct !{!33, !29, !"air-alias-scope-arg(3)"}
!34 = !{!35, !24, i64 0}
!35 = !{!"_ZTSN5metal34MTLDrawPrimitivesIndirectArgumentsE", !24, i64 0, !24, i64 4, !24, i64 8, !24, i64 12}
!36 = !{!33}
!37 = !{!31, !28, !32}
!38 = !{!32}
!39 = !{!31, !28, !33}
!40 = !{!35, !24, i64 8}
!41 = !{!31}
!42 = !{!28, !32, !33}
!43 = !{!35, !24, i64 12}
!44 = !{!35, !24, i64 4}

0x0000000001f200 -- UpscaleFloat:
source_filename = "UpscaleFloat"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @UpscaleFloat([3 x float] addrspace(1)* noundef "air-buffer-no-alias" %0, %struct._texture_2d_t addrspace(1)* %1, <2 x i32> addrspace(2)* noundef align 8 dereferenceable(8) "air-buffer-no-alias" %2, <2 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %6 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %7 = extractelement <2 x i32> %3, i64 0
  %8 = icmp ult i32 %7, %5
  %9 = extractelement <2 x i32> %3, i64 1
  %10 = icmp ult i32 %9, %6
  %11 = select i1 %8, i1 %10, i1 false
  br i1 %11, label %12, label %40

12:                                               ; preds = %4
  %13 = insertelement <2 x i32> undef, i32 %5, i64 0
  %14 = insertelement <2 x i32> %13, i32 %6, i64 1
  %15 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %3) #5
  %16 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %14) #5
  %17 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !tbaa !28, !alias.scope !31, !noalias !32
  %18 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %17) #5
  %19 = fmul fast <2 x float> %18, %15
  %20 = fdiv fast <2 x float> %19, %16
  %21 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %20) #5
  %22 = extractelement <2 x i32> %21, i64 1
  %23 = extractelement <2 x i32> %17, i64 0
  %24 = mul i32 %22, %23
  %25 = extractelement <2 x i32> %21, i64 0
  %26 = add i32 %24, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %27, i64 0
  %29 = load float, float addrspace(1)* %28, align 4, !alias.scope !33, !noalias !34
  %30 = insertelement <3 x float> undef, float %29, i64 0
  %31 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %27, i64 1
  %32 = load float, float addrspace(1)* %31, align 4, !alias.scope !33, !noalias !34
  %33 = insertelement <3 x float> %30, float %32, i64 1
  %34 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %0, i64 %27, i64 2
  %35 = load float, float addrspace(1)* %34, align 4, !alias.scope !33, !noalias !34
  %36 = insertelement <3 x float> %33, float %35, i64 2
  %37 = tail call fast <3 x float> @air.fast_clamp.v3f32(<3 x float> %36, <3 x float> zeroinitializer, <3 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>) #5
  %38 = shufflevector <3 x float> %37, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %39 = insertelement <4 x float> %38, float 1.000000e+00, i64 3
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x float> %39, i32 0, i32 2) #6, !alias.scope !22, !noalias !25
  br label %40

40:                                               ; preds = %12, %4
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.fast_clamp.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #4 = { argmemonly nounwind readonly willreturn }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void ([3 x float] addrspace(1)*, %struct._texture_2d_t addrspace(1)*, <2 x i32> addrspace(2)*, <2 x i32>)* @UpscaleFloat, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"buffer"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"texture"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"forward_size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!22 = !{!23}
!23 = distinct !{!23, !24, !"air-alias-scope-textures"}
!24 = distinct !{!24, !"air-alias-scopes(UpscaleFloat)"}
!25 = !{!26, !27}
!26 = distinct !{!26, !24, !"air-alias-scope-arg(0)"}
!27 = distinct !{!27, !24, !"air-alias-scope-arg(2)"}
!28 = !{!29, !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!27}
!32 = !{!26, !23}
!33 = !{!26}
!34 = !{!23, !27}

0x000000000203a0 -- UpscaleHalf:
source_filename = "UpscaleHalf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @UpscaleHalf([3 x half] addrspace(1)* noundef "air-buffer-no-alias" %0, %struct._texture_2d_t addrspace(1)* %1, <2 x i32> addrspace(2)* noundef align 8 dereferenceable(8) "air-buffer-no-alias" %2, <2 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %6 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %7 = extractelement <2 x i32> %3, i64 0
  %8 = icmp ult i32 %7, %5
  %9 = extractelement <2 x i32> %3, i64 1
  %10 = icmp ult i32 %9, %6
  %11 = select i1 %8, i1 %10, i1 false
  br i1 %11, label %12, label %41

12:                                               ; preds = %4
  %13 = insertelement <2 x i32> undef, i32 %5, i64 0
  %14 = insertelement <2 x i32> %13, i32 %6, i64 1
  %15 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %3) #5
  %16 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %14) #5
  %17 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !tbaa !28, !alias.scope !31, !noalias !32
  %18 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %17) #5
  %19 = fmul fast <2 x float> %18, %15
  %20 = fdiv fast <2 x float> %19, %16
  %21 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %20) #5
  %22 = extractelement <2 x i32> %21, i64 1
  %23 = extractelement <2 x i32> %17, i64 0
  %24 = mul i32 %22, %23
  %25 = extractelement <2 x i32> %21, i64 0
  %26 = add i32 %24, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 0
  %29 = load half, half addrspace(1)* %28, align 2, !alias.scope !33, !noalias !34
  %30 = insertelement <3 x half> undef, half %29, i64 0
  %31 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 1
  %32 = load half, half addrspace(1)* %31, align 2, !alias.scope !33, !noalias !34
  %33 = insertelement <3 x half> %30, half %32, i64 1
  %34 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 2
  %35 = load half, half addrspace(1)* %34, align 2, !alias.scope !33, !noalias !34
  %36 = insertelement <3 x half> %33, half %35, i64 2
  %37 = tail call fast <3 x half> @air.clamp.v3f16(<3 x half> %36, <3 x half> zeroinitializer, <3 x half> <half 0xH3C00, half 0xH3C00, half 0xH3C00>) #5
  %38 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %37) #5
  %39 = shufflevector <3 x float> %38, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %40 = insertelement <4 x float> %39, float 1.000000e+00, i64 3
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x float> %40, i32 0, i32 2) #6, !alias.scope !22, !noalias !25
  br label %41

41:                                               ; preds = %12, %4
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x half> @air.clamp.v3f16(<3 x half>, <3 x half>, <3 x half>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #3

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #4 = { argmemonly nounwind readonly willreturn }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void ([3 x half] addrspace(1)*, %struct._texture_2d_t addrspace(1)*, <2 x i32> addrspace(2)*, <2 x i32>)* @UpscaleHalf, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 6, !"air.arg_type_align_size", i32 2, !"air.arg_type_name", !"packed_half3", !"air.arg_name", !"buffer"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"texture"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"uint2", !"air.arg_name", !"forward_size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!22 = !{!23}
!23 = distinct !{!23, !24, !"air-alias-scope-textures"}
!24 = distinct !{!24, !"air-alias-scopes(UpscaleHalf)"}
!25 = !{!26, !27}
!26 = distinct !{!26, !24, !"air-alias-scope-arg(0)"}
!27 = distinct !{!27, !24, !"air-alias-scope-arg(2)"}
!28 = !{!29, !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!27}
!32 = !{!26, !23}
!33 = !{!26}
!34 = !{!23, !27}

0x00000000021590 -- SetValueFloat:
source_filename = "SetValueFloat"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetValueFloat(float addrspace(1)* noundef "air-buffer-no-alias" %0, float addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !22, !alias.scope !26, !noalias !29
  %6 = icmp ugt i32 %5, %3
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = load float, float addrspace(2)* %1, align 4, !tbaa !32, !alias.scope !34, !noalias !35
  store float %10, float addrspace(1)* %9, align 4, !tbaa !32, !alias.scope !36, !noalias !37
  br label %11

11:                                               ; preds = %7, %4
  ret void
}

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (float addrspace(1)*, float addrspace(2)*, i32 addrspace(2)*, i32)* @SetValueFloat, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(2)"}
!28 = distinct !{!28, !"air-alias-scopes(SetValueFloat)"}
!29 = !{!30, !31}
!30 = distinct !{!30, !28, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !28, !"air-alias-scope-arg(1)"}
!32 = !{!33, !33, i64 0}
!33 = !{!"float", !24, i64 0}
!34 = !{!31}
!35 = !{!30, !27}
!36 = !{!30}
!37 = !{!31, !27}

0x000000000223e0 -- SetValueHalf:
source_filename = "SetValueHalf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetValueHalf(half addrspace(1)* noundef "air-buffer-no-alias" %0, half addrspace(2)* noundef align 2 dereferenceable(2) "air-buffer-no-alias" %1, i32 addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !22, !alias.scope !26, !noalias !29
  %6 = icmp ugt i32 %5, %3
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds half, half addrspace(1)* %0, i64 %8
  %10 = load half, half addrspace(2)* %1, align 2, !tbaa !32, !alias.scope !34, !noalias !35
  store half %10, half addrspace(1)* %9, align 2, !tbaa !32, !alias.scope !36, !noalias !37
  br label %11

11:                                               ; preds = %7, %4
  ret void
}

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (half addrspace(1)*, half addrspace(2)*, i32 addrspace(2)*, i32)* @SetValueHalf, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 2, !"air.arg_type_align_size", i32 2, !"air.arg_type_name", !"half", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 2, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 2, !"air.arg_type_align_size", i32 2, !"air.arg_type_name", !"half", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(2)"}
!28 = distinct !{!28, !"air-alias-scopes(SetValueHalf)"}
!29 = !{!30, !31}
!30 = distinct !{!30, !28, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !28, !"air-alias-scope-arg(1)"}
!32 = !{!33, !33, i64 0}
!33 = !{!"half", !24, i64 0}
!34 = !{!31}
!35 = !{!30, !27}
!36 = !{!30}
!37 = !{!31, !27}

0x00000000023220 -- SetValueUchar:
source_filename = "SetValueUchar"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetValueUchar(i8 addrspace(1)* noundef "air-buffer-no-alias" %0, i8 addrspace(2)* noundef align 1 dereferenceable(1) "air-buffer-no-alias" %1, i32 addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !22, !alias.scope !26, !noalias !29
  %6 = icmp ugt i32 %5, %3
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %8
  %10 = load i8, i8 addrspace(2)* %1, align 1, !tbaa !32, !alias.scope !33, !noalias !34
  store i8 %10, i8 addrspace(1)* %9, align 1, !tbaa !32, !alias.scope !35, !noalias !36
  br label %11

11:                                               ; preds = %7, %4
  ret void
}

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i8 addrspace(1)*, i8 addrspace(2)*, i32 addrspace(2)*, i32)* @SetValueUchar, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 1, !"air.arg_type_align_size", i32 1, !"air.arg_type_name", !"uchar", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 1, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 1, !"air.arg_type_align_size", i32 1, !"air.arg_type_name", !"uchar", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(2)"}
!28 = distinct !{!28, !"air-alias-scopes(SetValueUchar)"}
!29 = !{!30, !31}
!30 = distinct !{!30, !28, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !28, !"air-alias-scope-arg(1)"}
!32 = !{!24, !24, i64 0}
!33 = !{!31}
!34 = !{!30, !27}
!35 = !{!30}
!36 = !{!31, !27}

0x00000000024060 -- SetValueUInt:
source_filename = "SetValueUInt"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetValueUInt(i32 addrspace(1)* noundef "air-buffer-no-alias" %0, i32 addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(2)* noundef align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !22, !alias.scope !26, !noalias !29
  %6 = icmp ugt i32 %5, %3
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %8
  %10 = load i32, i32 addrspace(2)* %1, align 4, !tbaa !22, !alias.scope !32, !noalias !33
  store i32 %10, i32 addrspace(1)* %9, align 4, !tbaa !22, !alias.scope !34, !noalias !35
  br label %11

11:                                               ; preds = %7, %4
  ret void
}

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (i32 addrspace(1)*, i32 addrspace(2)*, i32 addrspace(2)*, i32)* @SetValueUInt, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21}
!18 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read_write", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"size"}
!21 = !{i32 3, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint", !"air.arg_name", !"gid"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C++ TBAA"}
!26 = !{!27}
!27 = distinct !{!27, !28, !"air-alias-scope-arg(2)"}
!28 = distinct !{!28, !"air-alias-scopes(SetValueUInt)"}
!29 = !{!30, !31}
!30 = distinct !{!30, !28, !"air-alias-scope-arg(0)"}
!31 = distinct !{!31, !28, !"air-alias-scope-arg(1)"}
!32 = !{!31}
!33 = !{!30, !27}
!34 = !{!30}
!35 = !{!31, !27}

0x00000000024e80 -- SetTextureValueFloat:
source_filename = "SetTextureValueFloat"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetTextureValueFloat(%struct._texture_2d_t addrspace(1)* %0, <4 x float> addrspace(2)* noundef align 16 dereferenceable(16) "air-buffer-no-alias" %1, <2 x i32> noundef %2) local_unnamed_addr #0 {
  %4 = load <4 x float>, <4 x float> addrspace(2)* %1, align 16, !tbaa !21, !alias.scope !24, !noalias !27
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %0, <2 x i32> %2, <4 x float> %4, i32 0, i32 2) #2, !alias.scope !27, !noalias !24
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #1

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (%struct._texture_2d_t addrspace(1)*, <4 x float> addrspace(2)*, <2 x i32>)* @SetTextureValueFloat, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float4", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!21 = !{!22, !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"air-alias-scope-arg(1)"}
!26 = distinct !{!26, !"air-alias-scopes(SetTextureValueFloat)"}
!27 = !{!28}
!28 = distinct !{!28, !26, !"air-alias-scope-textures"}

0x00000000025cc0 -- SetTextureValueHalf:
source_filename = "SetTextureValueHalf"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: mustprogress nounwind
define weak_odr void @SetTextureValueHalf(%struct._texture_2d_t addrspace(1)* %0, <4 x half> addrspace(2)* noundef align 8 dereferenceable(8) "air-buffer-no-alias" %1, <2 x i32> noundef %2) local_unnamed_addr #0 {
  %4 = load <4 x half>, <4 x half> addrspace(2)* %1, align 8, !tbaa !21, !alias.scope !24, !noalias !27
  tail call void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture %0, <2 x i32> %2, <4 x half> %4, i32 0, i32 2) #2, !alias.scope !27, !noalias !24
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x half>, i32, i32) local_unnamed_addr #1

attributes #0 = { mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="64" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly mustprogress nounwind willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}

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
!15 = !{void (%struct._texture_2d_t addrspace(1)*, <4 x half> addrspace(2)*, <2 x i32>)* @SetTextureValueHalf, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<half, write>", !"air.arg_name", !"values"}
!19 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"half4", !"air.arg_name", !"value"}
!20 = !{i32 2, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!21 = !{!22, !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = !{!25}
!25 = distinct !{!25, !26, !"air-alias-scope-arg(1)"}
!26 = distinct !{!26, !"air-alias-scopes(SetTextureValueHalf)"}
!27 = !{!28}
!28 = distinct !{!28, !26, !"air-alias-scope-textures"}

0x00000000026b00 -- SeparableMinFilter:
source_filename = "SeparableMinFilter"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.10 = internal addrspace(2) constant [2 x i64] [i64 34901797601050697, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define void @SeparableMinFilter(%struct._texture_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, <2 x i32> noundef %5) local_unnamed_addr #0 {
  %7 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %5) #4
  %8 = fadd fast <2 x float> %7, <float 5.000000e-01, float 5.000000e-01>
  %9 = load float, float addrspace(2)* %4, align 4, !tbaa !25, !alias.scope !29, !noalias !32
  %10 = insertelement <4 x float> poison, float %9, i64 0
  %11 = shufflevector <4 x float> %10, <4 x float> poison, <4 x i32> zeroinitializer
  %12 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %6
  %15 = sub nsw i32 0, %12
  %16 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !36, !alias.scope !40, !noalias !41
  br label %19

17:                                               ; preds = %19, %6
  %18 = phi <4 x float> [ %11, %6 ], [ %26, %19 ]
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %18, i32 0, i32 2) #5, !alias.scope !42, !noalias !43
  ret void

19:                                               ; preds = %19, %14
  %20 = phi <4 x float> [ %11, %14 ], [ %26, %19 ]
  %21 = phi i32 [ %15, %14 ], [ %27, %19 ]
  %22 = phi <2 x i32> [ zeroinitializer, %14 ], [ %23, %19 ]
  %23 = insertelement <2 x i32> %22, i32 %21, i32 %16
  %24 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.10 to %struct._sampler_t addrspace(2)*), <2 x float> %8, i1 true, <2 x i32> %23, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %25 = extractvalue { <4 x float>, i8 } %24, 0
  %26 = tail call fast <4 x float> @air.fast_fmin.v4f32(<4 x float> %20, <4 x float> %25) #4
  %27 = add i32 %21, 1
  %28 = icmp eq i32 %21, %12
  br i1 %28, label %17, label %19, !llvm.loop !44
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <4 x float> @air.fast_fmin.v4f32(<4 x float>, <4 x float>) local_unnamed_addr #1

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #3 = { argmemonly mustprogress nounwind willreturn }
attributes #4 = { nounwind readnone willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}
!air.sampler_states = !{!24}

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
!15 = !{void (%struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, i32 addrspace(2)*, i32 addrspace(2)*, float addrspace(2)*, <2 x i32>)* @SeparableMinFilter, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"input"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"output"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"int", !"air.arg_name", !"width"}
!21 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"direction"}
!22 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"init"}
!23 = !{i32 5, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!24 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.10}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(4)"}
!31 = distinct !{!31, !"air-alias-scopes(SeparableMinFilter)"}
!32 = !{!33, !34, !35}
!33 = distinct !{!33, !31, !"air-alias-scope-textures"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(2)"}
!35 = distinct !{!35, !31, !"air-alias-scope-arg(3)"}
!36 = !{!37, !37, i64 0}
!37 = !{!"int", !27, i64 0}
!38 = !{!34}
!39 = !{!33, !35, !30}
!40 = !{!35}
!41 = !{!33, !34, !30}
!42 = !{!33}
!43 = !{!34, !35, !30}
!44 = distinct !{!44, !45}
!45 = !{!"llvm.loop.mustprogress"}

0x00000000027d50 -- SeparableBoxFilter:
source_filename = "SeparableBoxFilter"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_2d_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state.10 = internal addrspace(2) constant [2 x i64] [i64 34901797601050697, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define void @SeparableBoxFilter(%struct._texture_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, <2 x i32> noundef %5) local_unnamed_addr #0 {
  %7 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %5) #4
  %8 = fadd fast <2 x float> %7, <float 5.000000e-01, float 5.000000e-01>
  %9 = load float, float addrspace(2)* %4, align 4, !tbaa !25, !alias.scope !29, !noalias !32
  %10 = insertelement <4 x float> poison, float %9, i64 0
  %11 = shufflevector <4 x float> %10, <4 x float> poison, <4 x i32> zeroinitializer
  %12 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %6
  %15 = sub nsw i32 0, %12
  %16 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !36, !alias.scope !40, !noalias !41
  br label %25

17:                                               ; preds = %25, %6
  %18 = phi <4 x float> [ %11, %6 ], [ %32, %25 ]
  %19 = shl nsw i32 %12, 1
  %20 = or i32 %19, 1
  %21 = tail call fast float @air.convert.f.f32.s.i32(i32 %20) #4
  %22 = insertelement <4 x float> poison, float %21, i64 0
  %23 = shufflevector <4 x float> %22, <4 x float> poison, <4 x i32> zeroinitializer
  %24 = fdiv fast <4 x float> %18, %23
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %24, i32 0, i32 2) #5, !alias.scope !42, !noalias !43
  ret void

25:                                               ; preds = %25, %14
  %26 = phi <4 x float> [ %11, %14 ], [ %32, %25 ]
  %27 = phi i32 [ %15, %14 ], [ %33, %25 ]
  %28 = phi <2 x i32> [ zeroinitializer, %14 ], [ %29, %25 ]
  %29 = insertelement <2 x i32> %28, i32 %27, i32 %16
  %30 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.10 to %struct._sampler_t addrspace(2)*), <2 x float> %8, i1 true, <2 x i32> %29, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %31 = extractvalue { <4 x float>, i8 } %30, 0
  %32 = fadd fast <4 x float> %31, %26
  %33 = add i32 %27, 1
  %34 = icmp eq i32 %27, %12
  br i1 %34, label %17, label %25, !llvm.loop !44
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.s.i32(i32) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #3

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #2 = { argmemonly mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #4 = { nounwind readnone willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { argmemonly convergent nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.kernel = !{!15}
!air.sampler_states = !{!24}

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
!15 = !{void (%struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, i32 addrspace(2)*, i32 addrspace(2)*, float addrspace(2)*, <2 x i32>)* @SeparableBoxFilter, !16, !17}
!16 = !{}
!17 = !{!18, !19, !20, !21, !22, !23}
!18 = !{i32 0, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"input"}
!19 = !{i32 1, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.write", !"air.arg_type_name", !"texture2d<float, write>", !"air.arg_name", !"output"}
!20 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"int", !"air.arg_name", !"width"}
!21 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"direction"}
!22 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"init"}
!23 = !{i32 5, !"air.thread_position_in_grid", !"air.arg_type_name", !"uint2", !"air.arg_name", !"gid"}
!24 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state.10}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!30}
!30 = distinct !{!30, !31, !"air-alias-scope-arg(4)"}
!31 = distinct !{!31, !"air-alias-scopes(SeparableBoxFilter)"}
!32 = !{!33, !34, !35}
!33 = distinct !{!33, !31, !"air-alias-scope-textures"}
!34 = distinct !{!34, !31, !"air-alias-scope-arg(2)"}
!35 = distinct !{!35, !31, !"air-alias-scope-arg(3)"}
!36 = !{!37, !37, i64 0}
!37 = !{!"int", !27, i64 0}
!38 = !{!34}
!39 = !{!33, !35, !30}
!40 = !{!35}
!41 = !{!33, !34, !30}
!42 = !{!33}
!43 = !{!34, !35, !30}
!44 = distinct !{!44, !45}
!45 = !{!"llvm.loop.mustprogress"}

0x00000000028fc0 -- AlphaBlendVS:
source_filename = "AlphaBlendVS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%struct._texture_buffer_1d_t = type opaque
%"struct.apple3dgs::SplattingUniformsVS" = type <{ %"struct.metal::array.22", %"struct.metal::array.22", %"struct.metal::array.22", <2 x float>, <2 x i32>, i32, i32, i32, [4 x i8] }>
%"struct.metal::array.22" = type { [2 x %"struct.metal::matrix.1"] }
%"struct.metal::matrix.1" = type { [4 x <4 x float>] }

@__metal_implicit_fc_pred_0 = internal addrspace(2) global i8 0, align 1
@__metal_implicit_fc_pred_1 = internal addrspace(2) global i8 0, align 1
@__metal_implicit_fc_pred_2 = internal addrspace(2) global i8 0, align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_GSRenderer.metal, i8* null }]
@_ZL16kUseAntiAliasing = internal unnamed_addr addrspace(2) global i8 undef, align 1
@_Z16kUseAntiAliasing.MTL_FC_INIT_3_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@_ZL17kLayeredRendering = internal unnamed_addr addrspace(2) global i8 undef, align 1
@_Z17kLayeredRendering.MTL_FC_INIT_1_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@_ZL25kSplattingModePerspective = internal unnamed_addr addrspace(2) global i8 undef, align 1
@_Z25kSplattingModePerspective.MTL_FC_INIT_0_b = internal unnamed_addr addrspace(2) externally_initialized constant i8 undef, section "air.fc_initializer", align 1
@_ZL12kOctVertices = internal unnamed_addr addrspace(2) constant [16 x float] [float 0x3FDA8279A0000000, float 1.000000e+00, float 0xBFDA8279A0000000, float 1.000000e+00, float 1.000000e+00, float 0x3FDA8279A0000000, float -1.000000e+00, float 0x3FDA8279A0000000, float 1.000000e+00, float 0xBFDA8279A0000000, float -1.000000e+00, float 0xBFDA8279A0000000, float 0x3FDA8279A0000000, float -1.000000e+00, float 0xBFDA8279A0000000, float -1.000000e+00], align 4
@_ZL12kHexVertices = internal unnamed_addr addrspace(2) constant [12 x float] [float 1.000000e+00, float 0x3FE279A740000000, float 0.000000e+00, float 0x3FF279A740000000, float 1.000000e+00, float 0xBFE279A740000000, float -1.000000e+00, float 0x3FE279A740000000, float 0.000000e+00, float 0xBFF279A740000000, float -1.000000e+00, float 0xBFE279A740000000], align 4
@_ZL13kRectVertices = internal unnamed_addr addrspace(2) constant [8 x float] [float 1.000000e+00, float 1.000000e+00, float -1.000000e+00, float 1.000000e+00, float 1.000000e+00, float -1.000000e+00, float -1.000000e+00, float -1.000000e+00], align 4
@_ZL12kTriVertices = internal unnamed_addr addrspace(2) constant [6 x float] [float 0.000000e+00, float 2.000000e+00, float 0xBFFBB67AE0000000, float -1.000000e+00, float 0x3FFBB67AE0000000, float -1.000000e+00], align 4
@llvm.compiler.used = appending global [3 x i8*] [i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_0 to i8*), i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_1 to i8*), i8* addrspacecast (i8 addrspace(2)* @__metal_implicit_fc_pred_2 to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define internal void @_GLOBAL__sub_I_GSRenderer.metal() #0 section "air.static_init" {
  %1 = load i8, i8 addrspace(2)* @_Z25kSplattingModePerspective.MTL_FC_INIT_0_b, align 1, !tbaa !43, !range !47
  store i8 %1, i8 addrspace(2)* @_ZL25kSplattingModePerspective, align 1, !tbaa !43
  %2 = load i8, i8 addrspace(2)* @_Z17kLayeredRendering.MTL_FC_INIT_1_b, align 1, !tbaa !43, !range !47
  store i8 %2, i8 addrspace(2)* @_ZL17kLayeredRendering, align 1, !tbaa !43
  %3 = load i8, i8 addrspace(2)* @_Z16kUseAntiAliasing.MTL_FC_INIT_3_b, align 1, !tbaa !43, !range !47
  store i8 %3, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !43
  %4 = xor i8 %3, 1
  %5 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %4) #5
  store i8 %5, i8 addrspace(2)* @__metal_implicit_fc_pred_0, align 1
  %6 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %3) #5
  store i8 %6, i8 addrspace(2)* @__metal_implicit_fc_pred_1, align 1
  %7 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %2) #5
  store i8 %7, i8 addrspace(2)* @__metal_implicit_fc_pred_2, align 1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i8 @air.normalize_function_constant_predicate.i8(i8) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind readonly
define <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> @AlphaBlendVS(i32 addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, float addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %1, [3 x float] addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %2, %struct._texture_buffer_1d_t addrspace(1)* %3, %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(412) "air-buffer-no-alias" %4, <2 x float> addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %5, i32 noundef %6, i32 noundef %7, i32 noundef %8) local_unnamed_addr #2 {
  %10 = zext i32 %6 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !48, !alias.scope !50, !noalias !53
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %2, i64 %13, i64 0
  %15 = load float, float addrspace(1)* %14, align 4, !alias.scope !59, !noalias !60
  %16 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %2, i64 %13, i64 1
  %17 = load float, float addrspace(1)* %16, align 4, !alias.scope !59, !noalias !60
  %18 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %2, i64 %13, i64 2
  %19 = load float, float addrspace(1)* %18, align 4, !alias.scope !59, !noalias !60
  %20 = tail call { <4 x half>, i8 } @air.read_texture_buffer_1d.v4f16(%struct._texture_buffer_1d_t addrspace(1)* nocapture readonly %3, i32 %12, i32 1) #6, !alias.scope !61, !noalias !62
  %21 = extractvalue { <4 x half>, i8 } %20, 0
  %22 = mul i32 %12, 6
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = zext i32 %8 to i64
  %26 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 0, i32 0, i64 %25, i32 0, i64 0
  %27 = load <4 x float>, <4 x float> addrspace(2)* %26, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %28 = insertelement <4 x float> poison, float %15, i64 0
  %29 = shufflevector <4 x float> %28, <4 x float> poison, <4 x i32> zeroinitializer
  %30 = fmul fast <4 x float> %27, %29
  %31 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 0, i32 0, i64 %25, i32 0, i64 1
  %32 = load <4 x float>, <4 x float> addrspace(2)* %31, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %33 = insertelement <4 x float> poison, float %17, i64 0
  %34 = shufflevector <4 x float> %33, <4 x float> poison, <4 x i32> zeroinitializer
  %35 = fmul fast <4 x float> %32, %34
  %36 = fadd fast <4 x float> %35, %30
  %37 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 0, i32 0, i64 %25, i32 0, i64 2
  %38 = load <4 x float>, <4 x float> addrspace(2)* %37, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %39 = insertelement <4 x float> poison, float %19, i64 0
  %40 = shufflevector <4 x float> %39, <4 x float> poison, <4 x i32> zeroinitializer
  %41 = fmul fast <4 x float> %38, %40
  %42 = fadd fast <4 x float> %36, %41
  %43 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 0, i32 0, i64 %25, i32 0, i64 3
  %44 = load <4 x float>, <4 x float> addrspace(2)* %43, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %45 = fadd fast <4 x float> %42, %44
  %46 = load i8, i8 addrspace(2)* @_ZL17kLayeredRendering, align 1, !tbaa !43, !range !47
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %101, label %48

48:                                               ; preds = %9
  %49 = extractelement <4 x float> %45, i64 2
  %50 = tail call fast float @air.fast_fabs.f32(float %49) #5
  %51 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 7
  %52 = load i32, i32 addrspace(2)* %51, align 8, !tbaa !66, !alias.scope !64, !noalias !65
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %54, label %70

54:                                               ; preds = %48
  %55 = extractelement <4 x float> %45, i64 1
  %56 = tail call fast float @air.fast_fabs.f32(float %55) #5
  %57 = tail call fast float @air.fast_fmax.f32(float %50, float %56) #5
  %58 = extractelement <4 x float> %45, i64 0
  %59 = tail call fast float @air.fast_fabs.f32(float %58) #5
  %60 = tail call fast float @air.fast_fmax.f32(float %57, float %59) #5
  %61 = shufflevector <4 x float> %45, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %62 = insertelement <3 x float> poison, float %50, i64 0
  %63 = shufflevector <3 x float> %62, <3 x float> poison, <3 x i32> zeroinitializer
  %64 = insertelement <3 x float> poison, float %60, i64 0
  %65 = shufflevector <3 x float> %64, <3 x float> poison, <3 x i32> zeroinitializer
  %66 = fmul fast <3 x float> %65, %61
  %67 = fdiv fast <3 x float> %66, %63
  %68 = shufflevector <3 x float> %67, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %69 = shufflevector <4 x float> %68, <4 x float> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  br label %70

70:                                               ; preds = %54, %48
  %71 = phi float [ %60, %54 ], [ %50, %48 ]
  %72 = phi <4 x float> [ %69, %54 ], [ %45, %48 ]
  %73 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 2
  %74 = load <4 x float>, <4 x float> addrspace(2)* %73, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %75 = extractelement <4 x float> %74, i64 2
  %76 = fmul fast float %75, %71
  %77 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 3
  %78 = load <4 x float>, <4 x float> addrspace(2)* %77, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %79 = extractelement <4 x float> %78, i64 2
  %80 = fadd fast float %76, %79
  %81 = extractelement <4 x float> %74, i64 3
  %82 = fmul fast float %81, %71
  %83 = fdiv fast float %80, %82
  %84 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 6
  %85 = load i32, i32 addrspace(2)* %84, align 4, !tbaa !71, !alias.scope !64, !noalias !65
  %86 = add i32 %85, -1
  %87 = icmp eq i32 %85, 0
  br i1 %87, label %101, label %88

88:                                               ; preds = %98, %70
  %89 = phi i32 [ %99, %98 ], [ 0, %70 ]
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %5, i64 %90
  %92 = load <2 x float>, <2 x float> addrspace(1)* %91, align 8, !alias.scope !72, !noalias !73
  %93 = extractelement <2 x float> %92, i64 0
  %94 = fcmp fast olt float %83, %93
  %95 = extractelement <2 x float> %92, i64 1
  %96 = fcmp fast ogt float %83, %95
  %97 = select i1 %94, i1 %96, i1 false
  br i1 %97, label %101, label %98

98:                                               ; preds = %88
  %99 = add nuw i32 %89, 1
  %100 = icmp eq i32 %99, %85
  br i1 %100, label %101, label %88, !llvm.loop !74

101:                                              ; preds = %98, %88, %70, %9
  %102 = phi <4 x float> [ %45, %9 ], [ %72, %70 ], [ %72, %98 ], [ %72, %88 ]
  %103 = phi i32 [ undef, %9 ], [ -1, %70 ], [ %86, %98 ], [ %89, %88 ]
  %104 = load i8, i8 addrspace(2)* @_ZL25kSplattingModePerspective, align 1, !tbaa !43, !range !47
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %261, label %106

106:                                              ; preds = %101
  %107 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 2, i32 0, i64 %25, i32 0, i64 0
  %108 = load <4 x float>, <4 x float> addrspace(2)* %107, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %109 = fmul fast <4 x float> %108, %29
  %110 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 2, i32 0, i64 %25, i32 0, i64 1
  %111 = load <4 x float>, <4 x float> addrspace(2)* %110, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %112 = fmul fast <4 x float> %111, %34
  %113 = fadd fast <4 x float> %112, %109
  %114 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 2, i32 0, i64 %25, i32 0, i64 2
  %115 = load <4 x float>, <4 x float> addrspace(2)* %114, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %116 = fmul fast <4 x float> %115, %40
  %117 = fadd fast <4 x float> %113, %116
  %118 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 2, i32 0, i64 %25, i32 0, i64 3
  %119 = load <4 x float>, <4 x float> addrspace(2)* %118, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %120 = fadd fast <4 x float> %117, %119
  %121 = extractelement <4 x float> %120, i64 3
  %122 = fdiv fast float 1.000000e+00, %121
  %123 = insertelement <4 x float> poison, float %122, i64 0
  %124 = shufflevector <4 x float> %123, <4 x float> poison, <4 x i32> zeroinitializer
  %125 = fmul fast <4 x float> %124, %120
  %126 = shufflevector <4 x float> %125, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %127 = tail call fast <2 x float> @air.fast_clamp.v2f32(<2 x float> %126, <2 x float> <float 0xBFF4CCCCC0000000, float 0xBFF4CCCCC0000000>, <2 x float> <float 0x3FF4CCCCC0000000, float 0x3FF4CCCCC0000000>) #5
  %128 = extractelement <2 x float> %127, i64 0
  %129 = fneg fast float %128
  %130 = fmul fast float %122, %129
  %131 = extractelement <2 x float> %127, i64 1
  %132 = fneg fast float %131
  %133 = fmul fast float %122, %132
  %134 = shufflevector <4 x float> %108, <4 x float> %111, <4 x i32> <i32 0, i32 4, i32 undef, i32 undef>
  %135 = shufflevector <4 x float> %134, <4 x float> %115, <4 x i32> <i32 0, i32 1, i32 4, i32 undef>
  %136 = shufflevector <4 x float> %135, <4 x float> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %137 = shufflevector <4 x float> %108, <4 x float> %111, <4 x i32> <i32 1, i32 5, i32 undef, i32 undef>
  %138 = shufflevector <4 x float> %137, <4 x float> %115, <4 x i32> <i32 0, i32 1, i32 5, i32 undef>
  %139 = shufflevector <4 x float> %138, <4 x float> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %140 = shufflevector <4 x float> %108, <4 x float> %111, <4 x i32> <i32 3, i32 7, i32 undef, i32 undef>
  %141 = shufflevector <4 x float> %140, <4 x float> %115, <4 x i32> <i32 0, i32 1, i32 7, i32 undef>
  %142 = shufflevector <4 x float> %141, <4 x float> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %143 = fmul fast <4 x float> %124, %136
  %144 = insertelement <4 x float> undef, float %130, i64 0
  %145 = shufflevector <4 x float> %144, <4 x float> poison, <4 x i32> zeroinitializer
  %146 = fmul fast <4 x float> %145, %142
  %147 = fadd fast <4 x float> %146, %143
  %148 = insertelement <4 x float> undef, float %122, i64 0
  %149 = shufflevector <4 x float> %148, <4 x float> poison, <4 x i32> zeroinitializer
  %150 = fmul fast <4 x float> %149, %139
  %151 = insertelement <4 x float> undef, float %133, i64 0
  %152 = shufflevector <4 x float> %151, <4 x float> poison, <4 x i32> zeroinitializer
  %153 = fmul fast <4 x float> %152, %142
  %154 = fadd fast <4 x float> %153, %150
  %155 = load float, float addrspace(1)* %24, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %156 = getelementptr inbounds float, float addrspace(1)* %24, i64 1
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %158 = getelementptr inbounds float, float addrspace(1)* %24, i64 2
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %160 = insertelement <4 x float> poison, float %155, i64 0
  %161 = getelementptr inbounds float, float addrspace(1)* %24, i64 3
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %163 = getelementptr inbounds float, float addrspace(1)* %24, i64 4
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %165 = insertelement <4 x float> poison, float %157, i64 0
  %166 = getelementptr inbounds float, float addrspace(1)* %24, i64 5
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %168 = insertelement <4 x float> poison, float %159, i64 0
  %169 = shufflevector <4 x float> %147, <4 x float> %154, <2 x i32> <i32 0, i32 4>
  %170 = shufflevector <4 x float> %147, <4 x float> %154, <2 x i32> <i32 1, i32 5>
  %171 = shufflevector <4 x float> %147, <4 x float> %154, <2 x i32> <i32 2, i32 6>
  %172 = shufflevector <4 x float> %160, <4 x float> undef, <2 x i32> zeroinitializer
  %173 = fmul fast <2 x float> %169, %172
  %174 = insertelement <2 x float> undef, float %157, i64 0
  %175 = shufflevector <2 x float> %174, <2 x float> poison, <2 x i32> zeroinitializer
  %176 = fmul fast <2 x float> %170, %175
  %177 = fadd fast <2 x float> %176, %173
  %178 = insertelement <2 x float> undef, float %159, i64 0
  %179 = shufflevector <2 x float> %178, <2 x float> poison, <2 x i32> zeroinitializer
  %180 = fmul fast <2 x float> %171, %179
  %181 = fadd fast <2 x float> %177, %180
  %182 = shufflevector <4 x float> %165, <4 x float> undef, <2 x i32> zeroinitializer
  %183 = fmul fast <2 x float> %169, %182
  %184 = insertelement <2 x float> undef, float %162, i64 0
  %185 = shufflevector <2 x float> %184, <2 x float> poison, <2 x i32> zeroinitializer
  %186 = fmul fast <2 x float> %170, %185
  %187 = fadd fast <2 x float> %186, %183
  %188 = insertelement <2 x float> undef, float %164, i64 0
  %189 = shufflevector <2 x float> %188, <2 x float> poison, <2 x i32> zeroinitializer
  %190 = fmul fast <2 x float> %171, %189
  %191 = fadd fast <2 x float> %187, %190
  %192 = shufflevector <4 x float> %168, <4 x float> undef, <2 x i32> zeroinitializer
  %193 = fmul fast <2 x float> %169, %192
  %194 = fmul fast <2 x float> %170, %189
  %195 = fadd fast <2 x float> %194, %193
  %196 = insertelement <2 x float> undef, float %167, i64 0
  %197 = shufflevector <2 x float> %196, <2 x float> poison, <2 x i32> zeroinitializer
  %198 = fmul fast <2 x float> %171, %197
  %199 = fadd fast <2 x float> %195, %198
  %200 = shufflevector <4 x float> %147, <4 x float> undef, <2 x i32> zeroinitializer
  %201 = fmul fast <2 x float> %181, %200
  %202 = shufflevector <4 x float> %147, <4 x float> undef, <2 x i32> <i32 1, i32 1>
  %203 = fmul fast <2 x float> %191, %202
  %204 = fadd fast <2 x float> %203, %201
  %205 = shufflevector <4 x float> %147, <4 x float> undef, <2 x i32> <i32 2, i32 2>
  %206 = fmul fast <2 x float> %199, %205
  %207 = fadd fast <2 x float> %204, %206
  %208 = shufflevector <4 x float> %154, <4 x float> undef, <2 x i32> <i32 undef, i32 0>
  %209 = fmul fast <2 x float> %181, %208
  %210 = shufflevector <4 x float> %154, <4 x float> undef, <2 x i32> <i32 undef, i32 1>
  %211 = fmul fast <2 x float> %191, %210
  %212 = fadd fast <2 x float> %211, %209
  %213 = shufflevector <4 x float> %154, <4 x float> undef, <2 x i32> <i32 undef, i32 2>
  %214 = fmul fast <2 x float> %199, %213
  %215 = fadd fast <2 x float> %212, %214
  %216 = shufflevector <2 x float> %207, <2 x float> %215, <3 x i32> <i32 0, i32 1, i32 3>
  %217 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 3
  %218 = load <2 x float>, <2 x float> addrspace(2)* %217, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %219 = shufflevector <3 x float> %216, <3 x float> poison, <2 x i32> <i32 0, i32 2>
  %220 = fadd fast <2 x float> %219, %218
  %221 = shufflevector <2 x float> %220, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 undef>
  %222 = shufflevector <3 x float> %216, <3 x float> %221, <3 x i32> <i32 3, i32 1, i32 4>
  %223 = load i8, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !43, !range !47
  %224 = icmp eq i8 %223, 0
  br i1 %224, label %225, label %231

225:                                              ; preds = %106
  %226 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 4
  %227 = load <2 x i32>, <2 x i32> addrspace(2)* %226, align 8, !alias.scope !64, !noalias !65
  %228 = extractelement <2 x i32> %227, i64 0
  %229 = tail call fast float @air.convert.f.f32.u.i32(i32 %228) #5
  %230 = fdiv fast float 8.192000e+03, %229
  br label %231

231:                                              ; preds = %225, %106
  %232 = phi fast float [ %230, %225 ], [ 0x47EFFFFFE0000000, %106 ]
  %233 = extractelement <2 x float> %220, i64 0
  %234 = extractelement <2 x float> %207, i64 1
  %235 = extractelement <2 x float> %220, i64 1
  %236 = fmul fast float %234, %234
  %237 = fmul fast float %236, 4.000000e+00
  %238 = fsub fast float %233, %235
  %239 = fmul fast float %238, %238
  %240 = fadd fast float %239, %237
  %241 = tail call fast float @air.fast_sqrt.f32(float %240) #5
  %242 = fadd fast float %233, %235
  %243 = fadd fast float %241, %242
  %244 = fmul fast float %243, 5.000000e-01
  %245 = insertelement <2 x float> undef, float %244, i64 0
  %246 = fsub fast float %242, %241
  %247 = fmul fast float %246, 5.000000e-01
  %248 = insertelement <2 x float> %245, float %247, i64 1
  %249 = tail call fast <2 x float> @air.fast_sqrt.v2f32(<2 x float> %248) #5
  %250 = fsub fast float %244, %233
  %251 = tail call fast float @air.fast_atan2.f32(float %250, float %234) #5
  %252 = shufflevector <2 x float> %249, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 undef>
  %253 = insertelement <3 x float> %252, float %251, i64 2
  %254 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 5
  %255 = extractelement <4 x half> %21, i64 3
  %256 = fpext half %255 to float
  %257 = tail call fast fastcc <2 x float> @_Z25Gaussian2DToPolygonOffsetRU11MTLconstantKN9apple3dgs13PrimitiveTypeEDv3_fjff(i32 addrspace(2)* noundef align 4 dereferenceable(4) %254, <3 x float> noundef %253, i32 noundef %7, float noundef %256, float noundef %232) #7
  %258 = fadd fast <2 x float> %257, %126
  %259 = shufflevector <4 x float> %125, <4 x float> poison, <2 x i32> <i32 2, i32 3>
  %260 = shufflevector <2 x float> %258, <2 x float> %259, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  br label %486

261:                                              ; preds = %101
  %262 = shufflevector <4 x float> %102, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %263 = tail call fast float @air.dot.v3f32(<3 x float> %262, <3 x float> %262) #5
  %264 = tail call fast float @air.fast_rsqrt.f32(float %263) #5
  %265 = insertelement <3 x float> poison, float %264, i64 0
  %266 = shufflevector <3 x float> %265, <3 x float> poison, <3 x i32> zeroinitializer
  %267 = fmul fast <3 x float> %266, %262
  %268 = fadd fast <3 x float> %267, <float 0.000000e+00, float 0.000000e+00, float 1.000000e+00>
  %269 = extractelement <3 x float> %268, i64 0
  %270 = fmul fast float %269, %269
  %271 = insertelement <3 x float> undef, float %270, i64 0
  %272 = extractelement <3 x float> %268, i64 1
  %273 = fmul fast float %269, %272
  %274 = insertelement <3 x float> %271, float %273, i64 1
  %275 = extractelement <3 x float> %268, i64 2
  %276 = fmul fast float %269, %275
  %277 = insertelement <3 x float> %274, float %276, i64 2
  %278 = insertelement <3 x float> undef, float %273, i64 0
  %279 = fmul fast float %272, %272
  %280 = insertelement <3 x float> %278, float %279, i64 1
  %281 = fmul fast float %272, %275
  %282 = insertelement <3 x float> %280, float %281, i64 2
  %283 = insertelement <3 x float> undef, float %276, i64 0
  %284 = insertelement <3 x float> %283, float %281, i64 1
  %285 = fmul fast float %275, %275
  %286 = insertelement <3 x float> %284, float %285, i64 2
  %287 = tail call fast float @air.dot.v3f32(<3 x float> %268, <3 x float> %268) #5
  %288 = fmul fast <3 x float> %277, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>
  %289 = fmul fast <3 x float> %282, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>
  %290 = fmul fast <3 x float> %286, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>
  %291 = insertelement <3 x float> poison, float %287, i64 0
  %292 = shufflevector <3 x float> %291, <3 x float> poison, <3 x i32> zeroinitializer
  %293 = fdiv fast <3 x float> %288, %292
  %294 = fdiv fast <3 x float> %289, %292
  %295 = fdiv fast <3 x float> %290, %292
  %296 = fadd fast <3 x float> %293, <float -1.000000e+00, float -0.000000e+00, float -0.000000e+00>
  %297 = fadd fast <3 x float> %294, <float -0.000000e+00, float -1.000000e+00, float -0.000000e+00>
  %298 = fadd fast <3 x float> %295, <float -0.000000e+00, float -0.000000e+00, float -1.000000e+00>
  %299 = fcmp fast ogt float %287, 0x3E112E0BE0000000
  %300 = select i1 %299, <3 x float> %296, <3 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  %301 = select i1 %299, <3 x float> %297, <3 x float> <float -1.000000e+00, float -1.000000e+00, float -1.000000e+00>
  %302 = select i1 %299, <3 x float> %298, <3 x float> <float -1.000000e+00, float -1.000000e+00, float -1.000000e+00>
  %303 = shufflevector <4 x float> %27, <4 x float> poison, <3 x i32> zeroinitializer
  %304 = fmul fast <3 x float> %300, %303
  %305 = shufflevector <4 x float> %27, <4 x float> poison, <3 x i32> <i32 1, i32 1, i32 1>
  %306 = fmul fast <3 x float> %301, %305
  %307 = fadd fast <3 x float> %304, %306
  %308 = shufflevector <4 x float> %27, <4 x float> poison, <3 x i32> <i32 2, i32 2, i32 2>
  %309 = fmul fast <3 x float> %302, %308
  %310 = fadd fast <3 x float> %307, %309
  %311 = shufflevector <4 x float> %32, <4 x float> poison, <3 x i32> zeroinitializer
  %312 = fmul fast <3 x float> %300, %311
  %313 = shufflevector <4 x float> %32, <4 x float> poison, <3 x i32> <i32 1, i32 1, i32 1>
  %314 = fmul fast <3 x float> %301, %313
  %315 = fadd fast <3 x float> %312, %314
  %316 = shufflevector <4 x float> %32, <4 x float> poison, <3 x i32> <i32 2, i32 2, i32 2>
  %317 = fmul fast <3 x float> %302, %316
  %318 = fadd fast <3 x float> %315, %317
  %319 = shufflevector <4 x float> %38, <4 x float> poison, <3 x i32> zeroinitializer
  %320 = fmul fast <3 x float> %300, %319
  %321 = shufflevector <4 x float> %38, <4 x float> poison, <3 x i32> <i32 1, i32 1, i32 1>
  %322 = fmul fast <3 x float> %301, %321
  %323 = fadd fast <3 x float> %320, %322
  %324 = shufflevector <4 x float> %38, <4 x float> poison, <3 x i32> <i32 2, i32 2, i32 2>
  %325 = fmul fast <3 x float> %302, %324
  %326 = fadd fast <3 x float> %323, %325
  %327 = shufflevector <4 x float> %102, <4 x float> undef, <3 x i32> zeroinitializer
  %328 = fmul fast <3 x float> %300, %327
  %329 = shufflevector <4 x float> %102, <4 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %330 = fmul fast <3 x float> %301, %329
  %331 = fadd fast <3 x float> %328, %330
  %332 = shufflevector <4 x float> %102, <4 x float> undef, <3 x i32> <i32 2, i32 2, i32 2>
  %333 = fmul fast <3 x float> %302, %332
  %334 = fadd fast <3 x float> %331, %333
  %335 = shufflevector <3 x float> %334, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %336 = insertelement <4 x float> %335, float 1.000000e+00, i64 3
  %337 = shufflevector <3 x float> %334, <3 x float> undef, <4 x i32> <i32 2, i32 2, i32 undef, i32 2>
  %338 = fdiv fast <4 x float> %336, %337
  %339 = shufflevector <4 x float> %338, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %340 = extractelement <4 x float> %338, i64 3
  %341 = extractelement <4 x float> %338, i64 0
  %342 = fneg fast float %341
  %343 = fmul fast float %340, %342
  %344 = extractelement <4 x float> %338, i64 1
  %345 = fneg fast float %344
  %346 = fmul fast float %340, %345
  %347 = shufflevector <3 x float> %310, <3 x float> %318, <3 x i32> <i32 0, i32 3, i32 undef>
  %348 = shufflevector <3 x float> %347, <3 x float> %326, <3 x i32> <i32 0, i32 1, i32 3>
  %349 = shufflevector <3 x float> %310, <3 x float> %318, <3 x i32> <i32 1, i32 4, i32 undef>
  %350 = shufflevector <3 x float> %349, <3 x float> %326, <3 x i32> <i32 0, i32 1, i32 4>
  %351 = shufflevector <3 x float> %310, <3 x float> %318, <3 x i32> <i32 2, i32 5, i32 undef>
  %352 = shufflevector <3 x float> %351, <3 x float> %326, <3 x i32> <i32 0, i32 1, i32 5>
  %353 = shufflevector <4 x float> %338, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %354 = fmul fast <3 x float> %353, %348
  %355 = insertelement <3 x float> undef, float %343, i64 0
  %356 = shufflevector <3 x float> %355, <3 x float> poison, <3 x i32> zeroinitializer
  %357 = fmul fast <3 x float> %356, %352
  %358 = fadd fast <3 x float> %357, %354
  %359 = fmul fast <3 x float> %353, %350
  %360 = insertelement <3 x float> undef, float %346, i64 0
  %361 = shufflevector <3 x float> %360, <3 x float> poison, <3 x i32> zeroinitializer
  %362 = fmul fast <3 x float> %361, %352
  %363 = fadd fast <3 x float> %362, %359
  %364 = load float, float addrspace(1)* %24, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %365 = insertelement <3 x float> undef, float %364, i64 0
  %366 = getelementptr inbounds float, float addrspace(1)* %24, i64 1
  %367 = load float, float addrspace(1)* %366, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %368 = getelementptr inbounds float, float addrspace(1)* %24, i64 2
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %370 = insertelement <3 x float> undef, float %367, i64 0
  %371 = getelementptr inbounds float, float addrspace(1)* %24, i64 3
  %372 = load float, float addrspace(1)* %371, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %373 = getelementptr inbounds float, float addrspace(1)* %24, i64 4
  %374 = load float, float addrspace(1)* %373, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %375 = insertelement <3 x float> undef, float %369, i64 0
  %376 = getelementptr inbounds float, float addrspace(1)* %24, i64 5
  %377 = load float, float addrspace(1)* %376, align 4, !tbaa !76, !alias.scope !78, !noalias !79
  %378 = shufflevector <3 x float> %358, <3 x float> %363, <2 x i32> <i32 0, i32 3>
  %379 = shufflevector <3 x float> %358, <3 x float> %363, <2 x i32> <i32 1, i32 4>
  %380 = shufflevector <3 x float> %358, <3 x float> %363, <2 x i32> <i32 2, i32 5>
  %381 = shufflevector <3 x float> %365, <3 x float> undef, <2 x i32> zeroinitializer
  %382 = fmul fast <2 x float> %378, %381
  %383 = insertelement <2 x float> undef, float %367, i64 0
  %384 = shufflevector <2 x float> %383, <2 x float> poison, <2 x i32> zeroinitializer
  %385 = fmul fast <2 x float> %379, %384
  %386 = fadd fast <2 x float> %382, %385
  %387 = insertelement <2 x float> undef, float %369, i64 0
  %388 = shufflevector <2 x float> %387, <2 x float> poison, <2 x i32> zeroinitializer
  %389 = fmul fast <2 x float> %380, %388
  %390 = fadd fast <2 x float> %386, %389
  %391 = shufflevector <3 x float> %370, <3 x float> undef, <2 x i32> zeroinitializer
  %392 = fmul fast <2 x float> %378, %391
  %393 = insertelement <2 x float> undef, float %372, i64 0
  %394 = shufflevector <2 x float> %393, <2 x float> poison, <2 x i32> zeroinitializer
  %395 = fmul fast <2 x float> %379, %394
  %396 = fadd fast <2 x float> %395, %392
  %397 = insertelement <2 x float> undef, float %374, i64 0
  %398 = shufflevector <2 x float> %397, <2 x float> poison, <2 x i32> zeroinitializer
  %399 = fmul fast <2 x float> %380, %398
  %400 = fadd fast <2 x float> %396, %399
  %401 = shufflevector <3 x float> %375, <3 x float> undef, <2 x i32> zeroinitializer
  %402 = fmul fast <2 x float> %378, %401
  %403 = fmul fast <2 x float> %379, %398
  %404 = fadd fast <2 x float> %403, %402
  %405 = insertelement <2 x float> undef, float %377, i64 0
  %406 = shufflevector <2 x float> %405, <2 x float> poison, <2 x i32> zeroinitializer
  %407 = fmul fast <2 x float> %380, %406
  %408 = fadd fast <2 x float> %404, %407
  %409 = shufflevector <3 x float> %358, <3 x float> undef, <2 x i32> zeroinitializer
  %410 = fmul fast <2 x float> %390, %409
  %411 = shufflevector <3 x float> %358, <3 x float> undef, <2 x i32> <i32 1, i32 1>
  %412 = fmul fast <2 x float> %400, %411
  %413 = fadd fast <2 x float> %412, %410
  %414 = shufflevector <3 x float> %358, <3 x float> undef, <2 x i32> <i32 2, i32 2>
  %415 = fmul fast <2 x float> %408, %414
  %416 = fadd fast <2 x float> %413, %415
  %417 = shufflevector <3 x float> %363, <3 x float> undef, <2 x i32> <i32 undef, i32 0>
  %418 = fmul fast <2 x float> %390, %417
  %419 = shufflevector <3 x float> %363, <3 x float> undef, <2 x i32> <i32 undef, i32 1>
  %420 = fmul fast <2 x float> %400, %419
  %421 = fadd fast <2 x float> %420, %418
  %422 = shufflevector <3 x float> %363, <3 x float> undef, <2 x i32> <i32 undef, i32 2>
  %423 = fmul fast <2 x float> %408, %422
  %424 = fadd fast <2 x float> %421, %423
  %425 = shufflevector <2 x float> %416, <2 x float> %424, <3 x i32> <i32 0, i32 1, i32 3>
  %426 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 3
  %427 = load <2 x float>, <2 x float> addrspace(2)* %426, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %428 = shufflevector <3 x float> %425, <3 x float> poison, <2 x i32> <i32 0, i32 2>
  %429 = fadd fast <2 x float> %428, %427
  %430 = shufflevector <2 x float> %429, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 undef>
  %431 = shufflevector <3 x float> %425, <3 x float> %430, <3 x i32> <i32 3, i32 1, i32 4>
  %432 = extractelement <2 x float> %429, i64 0
  %433 = extractelement <2 x float> %416, i64 1
  %434 = extractelement <2 x float> %429, i64 1
  %435 = fmul fast float %433, %433
  %436 = fmul fast float %435, 4.000000e+00
  %437 = fsub fast float %432, %434
  %438 = fmul fast float %437, %437
  %439 = fadd fast float %438, %436
  %440 = tail call fast float @air.fast_sqrt.f32(float %439) #5
  %441 = fadd fast float %432, %434
  %442 = fadd fast float %441, %440
  %443 = fmul fast float %442, 5.000000e-01
  %444 = insertelement <2 x float> undef, float %443, i64 0
  %445 = fsub fast float %441, %440
  %446 = fmul fast float %445, 5.000000e-01
  %447 = insertelement <2 x float> %444, float %446, i64 1
  %448 = tail call fast <2 x float> @air.fast_sqrt.v2f32(<2 x float> %447) #5
  %449 = fsub fast float %443, %432
  %450 = tail call fast float @air.fast_atan2.f32(float %449, float %433) #5
  %451 = shufflevector <2 x float> %448, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 undef>
  %452 = insertelement <3 x float> %451, float %450, i64 2
  %453 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 5
  %454 = extractelement <4 x half> %21, i64 3
  %455 = fpext half %454 to float
  %456 = tail call fast fastcc <2 x float> @_Z25Gaussian2DToPolygonOffsetRU11MTLconstantKN9apple3dgs13PrimitiveTypeEDv3_fjff(i32 addrspace(2)* noundef align 4 dereferenceable(4) %453, <3 x float> noundef %452, i32 noundef %7, float noundef %455, float noundef 0x47EFFFFFE0000000) #7
  %457 = fadd fast <2 x float> %339, %456
  %458 = shufflevector <2 x float> %457, <2 x float> poison, <3 x i32> <i32 0, i32 1, i32 undef>
  %459 = insertelement <3 x float> %458, float 1.000000e+00, i64 2
  %460 = tail call fast float @air.dot.v3f32(<3 x float> %459, <3 x float> %300) #5
  %461 = tail call fast float @air.dot.v3f32(<3 x float> %459, <3 x float> %301) #5
  %462 = tail call fast float @air.dot.v3f32(<3 x float> %459, <3 x float> %302) #5
  %463 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 0
  %464 = load <4 x float>, <4 x float> addrspace(2)* %463, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %465 = insertelement <4 x float> poison, float %460, i64 0
  %466 = shufflevector <4 x float> %465, <4 x float> poison, <4 x i32> zeroinitializer
  %467 = fmul fast <4 x float> %464, %466
  %468 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 1
  %469 = load <4 x float>, <4 x float> addrspace(2)* %468, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %470 = insertelement <4 x float> poison, float %461, i64 0
  %471 = shufflevector <4 x float> %470, <4 x float> poison, <4 x i32> zeroinitializer
  %472 = fmul fast <4 x float> %469, %471
  %473 = fadd fast <4 x float> %472, %467
  %474 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 2
  %475 = load <4 x float>, <4 x float> addrspace(2)* %474, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %476 = insertelement <4 x float> poison, float %462, i64 0
  %477 = shufflevector <4 x float> %476, <4 x float> poison, <4 x i32> zeroinitializer
  %478 = fmul fast <4 x float> %475, %477
  %479 = fadd fast <4 x float> %473, %478
  %480 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 1, i32 0, i64 %25, i32 0, i64 3
  %481 = load <4 x float>, <4 x float> addrspace(2)* %480, align 16, !tbaa !63, !alias.scope !64, !noalias !65
  %482 = shufflevector <4 x float> %338, <4 x float> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %483 = fmul fast <4 x float> %482, %481
  %484 = fadd fast <4 x float> %479, %483
  %485 = load i8, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !43, !range !47
  br label %486

486:                                              ; preds = %261, %231
  %487 = phi i8 [ %223, %231 ], [ %485, %261 ]
  %488 = phi <2 x float> [ %257, %231 ], [ %456, %261 ]
  %489 = phi <3 x float> [ %253, %231 ], [ %452, %261 ]
  %490 = phi <3 x float> [ %222, %231 ], [ %431, %261 ]
  %491 = phi <4 x float> [ %260, %231 ], [ %484, %261 ]
  %492 = icmp eq i8 %487, 0
  br i1 %492, label %547, label %493

493:                                              ; preds = %486
  %494 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 5
  %495 = load i32, i32 addrspace(2)* %494, align 16, !tbaa !80, !alias.scope !64, !noalias !65
  switch i32 %495, label %540 [
    i32 0, label %496
    i32 1, label %507
    i32 2, label %518
    i32 3, label %529
  ]

496:                                              ; preds = %493
  %497 = shl i32 %7, 1
  %498 = zext i32 %497 to i64
  %499 = getelementptr inbounds [6 x float], [6 x float] addrspace(2)* @_ZL12kTriVertices, i64 0, i64 %498
  %500 = load float, float addrspace(2)* %499, align 4, !tbaa !76
  %501 = insertelement <2 x float> undef, float %500, i64 0
  %502 = or i32 %497, 1
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds [6 x float], [6 x float] addrspace(2)* @_ZL12kTriVertices, i64 0, i64 %503
  %505 = load float, float addrspace(2)* %504, align 4, !tbaa !76
  %506 = insertelement <2 x float> %501, float %505, i64 1
  br label %540

507:                                              ; preds = %493
  %508 = shl i32 %7, 1
  %509 = zext i32 %508 to i64
  %510 = getelementptr inbounds [8 x float], [8 x float] addrspace(2)* @_ZL13kRectVertices, i64 0, i64 %509
  %511 = load float, float addrspace(2)* %510, align 4, !tbaa !76
  %512 = insertelement <2 x float> undef, float %511, i64 0
  %513 = or i32 %508, 1
  %514 = zext i32 %513 to i64
  %515 = getelementptr inbounds [8 x float], [8 x float] addrspace(2)* @_ZL13kRectVertices, i64 0, i64 %514
  %516 = load float, float addrspace(2)* %515, align 4, !tbaa !76
  %517 = insertelement <2 x float> %512, float %516, i64 1
  br label %540

518:                                              ; preds = %493
  %519 = shl i32 %7, 1
  %520 = zext i32 %519 to i64
  %521 = getelementptr inbounds [12 x float], [12 x float] addrspace(2)* @_ZL12kHexVertices, i64 0, i64 %520
  %522 = load float, float addrspace(2)* %521, align 4, !tbaa !76
  %523 = insertelement <2 x float> undef, float %522, i64 0
  %524 = or i32 %519, 1
  %525 = zext i32 %524 to i64
  %526 = getelementptr inbounds [12 x float], [12 x float] addrspace(2)* @_ZL12kHexVertices, i64 0, i64 %525
  %527 = load float, float addrspace(2)* %526, align 4, !tbaa !76
  %528 = insertelement <2 x float> %523, float %527, i64 1
  br label %540

529:                                              ; preds = %493
  %530 = shl i32 %7, 1
  %531 = zext i32 %530 to i64
  %532 = getelementptr inbounds [16 x float], [16 x float] addrspace(2)* @_ZL12kOctVertices, i64 0, i64 %531
  %533 = load float, float addrspace(2)* %532, align 4, !tbaa !76
  %534 = insertelement <2 x float> undef, float %533, i64 0
  %535 = or i32 %530, 1
  %536 = zext i32 %535 to i64
  %537 = getelementptr inbounds [16 x float], [16 x float] addrspace(2)* @_ZL12kOctVertices, i64 0, i64 %536
  %538 = load float, float addrspace(2)* %537, align 4, !tbaa !76
  %539 = insertelement <2 x float> %534, float %538, i64 1
  br label %540

540:                                              ; preds = %529, %518, %507, %496, %493
  %541 = phi <2 x float> [ undef, %493 ], [ %539, %529 ], [ %528, %518 ], [ %517, %507 ], [ %506, %496 ]
  %542 = shufflevector <3 x float> %489, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %543 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsVS", %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)* %4, i64 0, i32 4
  %544 = load <2 x i32>, <2 x i32> addrspace(2)* %543, align 8, !tbaa !63, !alias.scope !64, !noalias !65
  %545 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %544) #5
  %546 = fmul fast <2 x float> %545, %542
  br label %562

547:                                              ; preds = %486
  %548 = extractelement <3 x float> %490, i64 0
  %549 = extractelement <3 x float> %490, i64 2
  %550 = fmul fast float %548, %549
  %551 = extractelement <3 x float> %490, i64 1
  %552 = fmul fast float %551, %551
  %553 = fsub fast float %550, %552
  %554 = fdiv fast float 1.000000e+00, %553
  %555 = fmul fast float %554, %549
  %556 = insertelement <3 x float> undef, float %555, i64 0
  %557 = fneg fast float %551
  %558 = fmul fast float %554, %557
  %559 = insertelement <3 x float> %556, float %558, i64 1
  %560 = fmul fast float %554, %548
  %561 = insertelement <3 x float> %559, float %560, i64 2
  br label %562

562:                                              ; preds = %547, %540
  %563 = phi <3 x float> [ undef, %540 ], [ %561, %547 ]
  %564 = phi <2 x float> [ %546, %540 ], [ undef, %547 ]
  %565 = phi <2 x float> [ %541, %540 ], [ undef, %547 ]
  %566 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> undef, <4 x float> %491, 0
  %567 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %566, <4 x half> %21, 1
  %568 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %567, <2 x float> %488, 2
  %569 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %568, <3 x float> %563, 3
  %570 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %569, <2 x float> %564, 4
  %571 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %570, <2 x float> %565, 5
  %572 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %571, i32 %103, 6
  %573 = insertvalue <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %572, i32 0, 7
  ret <{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> %573
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.dot.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readonly willreturn
define internal fastcc <2 x float> @_Z25Gaussian2DToPolygonOffsetRU11MTLconstantKN9apple3dgs13PrimitiveTypeEDv3_fjff(i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) %0, <3 x float> noundef %1, i32 noundef %2, float noundef %3, float noundef %4) unnamed_addr #3 {
  %6 = load i32, i32 addrspace(2)* %0, align 4, !tbaa !80
  switch i32 %6, label %51 [
    i32 0, label %7
    i32 1, label %18
    i32 2, label %29
    i32 3, label %40
  ]

7:                                                ; preds = %5
  %8 = shl i32 %2, 1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [6 x float], [6 x float] addrspace(2)* @_ZL12kTriVertices, i64 0, i64 %9
  %11 = load float, float addrspace(2)* %10, align 4, !tbaa !76
  %12 = insertelement <2 x float> undef, float %11, i64 0
  %13 = or i32 %8, 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [6 x float], [6 x float] addrspace(2)* @_ZL12kTriVertices, i64 0, i64 %14
  %16 = load float, float addrspace(2)* %15, align 4, !tbaa !76
  %17 = insertelement <2 x float> %12, float %16, i64 1
  br label %51

18:                                               ; preds = %5
  %19 = shl i32 %2, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [8 x float], [8 x float] addrspace(2)* @_ZL13kRectVertices, i64 0, i64 %20
  %22 = load float, float addrspace(2)* %21, align 4, !tbaa !76
  %23 = insertelement <2 x float> undef, float %22, i64 0
  %24 = or i32 %19, 1
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [8 x float], [8 x float] addrspace(2)* @_ZL13kRectVertices, i64 0, i64 %25
  %27 = load float, float addrspace(2)* %26, align 4, !tbaa !76
  %28 = insertelement <2 x float> %23, float %27, i64 1
  br label %51

29:                                               ; preds = %5
  %30 = shl i32 %2, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [12 x float], [12 x float] addrspace(2)* @_ZL12kHexVertices, i64 0, i64 %31
  %33 = load float, float addrspace(2)* %32, align 4, !tbaa !76
  %34 = insertelement <2 x float> undef, float %33, i64 0
  %35 = or i32 %30, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds [12 x float], [12 x float] addrspace(2)* @_ZL12kHexVertices, i64 0, i64 %36
  %38 = load float, float addrspace(2)* %37, align 4, !tbaa !76
  %39 = insertelement <2 x float> %34, float %38, i64 1
  br label %51

40:                                               ; preds = %5
  %41 = shl i32 %2, 1
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [16 x float], [16 x float] addrspace(2)* @_ZL12kOctVertices, i64 0, i64 %42
  %44 = load float, float addrspace(2)* %43, align 4, !tbaa !76
  %45 = insertelement <2 x float> undef, float %44, i64 0
  %46 = or i32 %41, 1
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [16 x float], [16 x float] addrspace(2)* @_ZL12kOctVertices, i64 0, i64 %47
  %49 = load float, float addrspace(2)* %48, align 4, !tbaa !76
  %50 = insertelement <2 x float> %45, float %49, i64 1
  br label %51

51:                                               ; preds = %40, %29, %18, %7, %5
  %52 = phi <2 x float> [ undef, %5 ], [ %50, %40 ], [ %39, %29 ], [ %28, %18 ], [ %17, %7 ]
  %53 = insertelement <2 x float> poison, float %4, i64 0
  %54 = shufflevector <2 x float> %53, <2 x float> poison, <2 x i32> zeroinitializer
  %55 = tail call fast float @air.fast_log.f32(float %3) #5
  %56 = fmul fast float %55, 2.000000e+00
  %57 = fadd fast float %56, 1.100000e+01
  %58 = tail call fast float @air.fast_fmax.f32(float 0.000000e+00, float %57) #5
  %59 = tail call fast float @air.fast_sqrt.f32(float %58) #5
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = shufflevector <3 x float> %1, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %63 = fmul fast <2 x float> %61, %62
  %64 = tail call fast <2 x float> @air.fast_fmin.v2f32(<2 x float> %54, <2 x float> %63) #5
  %65 = extractelement <3 x float> %1, i64 2
  %66 = tail call fast float @air.fast_sin.f32(float %65) #5
  %67 = fneg fast float %66
  %68 = insertelement <2 x float> undef, float %67, i64 0
  %69 = tail call fast float @air.fast_cos.f32(float %65) #5
  %70 = insertelement <2 x float> %68, float %69, i64 1
  %71 = insertelement <2 x float> undef, float %69, i64 0
  %72 = insertelement <2 x float> %71, float %66, i64 1
  %73 = fmul fast <2 x float> %64, %52
  %74 = shufflevector <2 x float> %73, <2 x float> poison, <2 x i32> zeroinitializer
  %75 = fmul fast <2 x float> %72, %74
  %76 = shufflevector <2 x float> %73, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  %77 = fmul fast <2 x float> %70, %76
  %78 = fadd fast <2 x float> %75, %77
  ret <2 x float> %78
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_cos.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_sin.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.fast_fmin.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fmax.f32(float, float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_log.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_atan2.f32(float, float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.fast_sqrt.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_rsqrt.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.fast_clamp.v2f32(<2 x float>, <2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_fabs.f32(float) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x half>, i8 } @air.read_texture_buffer_1d.v4f16(%struct._texture_buffer_1d_t addrspace(1)* nocapture readonly, i32, i32) local_unnamed_addr #4

attributes #0 = { mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { convergent nofree nounwind readonly "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #3 = { mustprogress nofree nosync nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="96" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #4 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { argmemonly nounwind readonly willreturn }
attributes #7 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.vertex = !{!15}
!air.function_constants = !{!40, !41, !42}

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
!15 = !{<{ <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32 }> (i32 addrspace(1)*, float addrspace(1)*, [3 x float] addrspace(1)*, %struct._texture_buffer_1d_t addrspace(1)*, %"struct.apple3dgs::SplattingUniformsVS" addrspace(2)*, <2 x float> addrspace(1)*, i32, i32, i32)* @AlphaBlendVS, !16, !28}
!16 = !{!17, !18, !19, !21, !22, !24, !25, !27}
!17 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos"}
!18 = !{!"air.vertex_output", !"generated(5colorDv4_Dh)", !"air.arg_type_name", !"half4", !"air.arg_name", !"color"}
!19 = !{!"air.function_constant", !20, !"air.vertex_output", !"generated(5deltaDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"delta"}
!20 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_0, !"bool", !"kUseConic"}
!21 = !{!"air.function_constant", !20, !"air.vertex_output", !"generated(5conicDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"conic"}
!22 = !{!"air.function_constant", !23, !"air.vertex_output", !"generated(5sigmaDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"sigma"}
!23 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_1, !"bool", !"kUseAntiAliasing"}
!24 = !{!"air.function_constant", !23, !"air.vertex_output", !"generated(11splat_coordDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"splat_coord"}
!25 = !{!"air.function_constant", !26, !"air.render_target_array_index", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer"}
!26 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_2, !"bool", !"kLayeredRendering"}
!27 = !{!"air.viewport_array_index", !"air.shared", !"air.arg_type_name", !"uint", !"air.arg_name", !"viewport"}
!28 = !{!29, !30, !31, !32, !33, !36, !37, !38, !39}
!29 = !{i32 0, !"air.buffer", !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"uint", !"air.arg_name", !"indices"}
!30 = !{i32 1, !"air.buffer", !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"float", !"air.arg_name", !"cov3Ds"}
!31 = !{i32 2, !"air.buffer", !"air.location_index", i32 2, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 12, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"packed_float3", !"air.arg_name", !"coords"}
!32 = !{i32 3, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.read", !"air.arg_type_name", !"texture_buffer<half, read>", !"air.arg_name", !"colors"}
!33 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 416, !"air.location_index", i32 3, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !34, !"air.arg_type_size", i32 416, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"apple3dgs::SplattingUniformsVS", !"air.arg_name", !"uniforms"}
!34 = !{!"air.struct_type_info", !35, i32 0, i32 128, i32 0, !"metal::array", !"model_view", !"air.struct_type_info", !35, i32 128, i32 128, i32 0, !"metal::array", !"ndc_projection", !"air.struct_type_info", !35, i32 256, i32 128, i32 0, !"metal::array", !"mvp", i32 384, i32 8, i32 0, !"float2", !"covariance_reg", i32 392, i32 8, i32 0, !"uint2", !"image_size", i32 400, i32 4, i32 0, !"int", !"primitive_type", i32 404, i32 4, i32 0, !"uint", !"max_layers", i32 408, i32 4, i32 0, !"int", !"sorting_mode"}
!35 = !{i32 0, i32 64, i32 2, !"float4x4", !"__elems"}
!36 = !{i32 5, !"air.function_constant", !26, !"air.buffer", !"air.location_index", i32 4, i32 1, !"air.read", !"air.address_space", i32 1, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"float2", !"air.arg_name", !"ndc_near_far_planes"}
!37 = !{i32 6, !"air.instance_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"instance_id"}
!38 = !{i32 7, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"vid"}
!39 = !{i32 8, !"air.amplification_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"amp_id"}
!40 = !{i8 addrspace(2)* @_Z25kSplattingModePerspective.MTL_FC_INIT_0_b, !"bool", !"kSplattingModePerspective", i32 0, i1 true}
!41 = !{i8 addrspace(2)* @_Z17kLayeredRendering.MTL_FC_INIT_1_b, !"bool", !"kLayeredRendering", i32 1, i1 true}
!42 = !{i8 addrspace(2)* @_Z16kUseAntiAliasing.MTL_FC_INIT_3_b, !"bool", !"kUseAntiAliasing", i32 3, i1 true}
!43 = !{!44, !44, i64 0}
!44 = !{!"bool", !45, i64 0}
!45 = !{!"omnipotent char", !46, i64 0}
!46 = !{!"Simple C++ TBAA"}
!47 = !{i8 0, i8 2}
!48 = !{!49, !49, i64 0}
!49 = !{!"int", !45, i64 0}
!50 = !{!51}
!51 = distinct !{!51, !52, !"air-alias-scope-arg(0)"}
!52 = distinct !{!52, !"air-alias-scopes(AlphaBlendVS)"}
!53 = !{!54, !55, !56, !57, !58}
!54 = distinct !{!54, !52, !"air-alias-scope-arg(1)"}
!55 = distinct !{!55, !52, !"air-alias-scope-arg(2)"}
!56 = distinct !{!56, !52, !"air-alias-scope-textures"}
!57 = distinct !{!57, !52, !"air-alias-scope-arg(4)"}
!58 = distinct !{!58, !52, !"air-alias-scope-arg(5)"}
!59 = !{!55}
!60 = !{!51, !54, !56, !57, !58}
!61 = !{!56}
!62 = !{!51, !54, !55, !57, !58}
!63 = !{!45, !45, i64 0}
!64 = !{!57}
!65 = !{!51, !54, !55, !56, !58}
!66 = !{!67, !70, i64 408}
!67 = !{!"_ZTSN9apple3dgs19SplattingUniformsVSE", !68, i64 0, !68, i64 128, !68, i64 256, !45, i64 384, !45, i64 392, !69, i64 400, !49, i64 404, !70, i64 408}
!68 = !{!"_ZTSN5metal5arrayINS_6matrixIfLi4ELi4EvEELm2EEE", !45, i64 0}
!69 = !{!"_ZTSN9apple3dgs13PrimitiveTypeE", !45, i64 0}
!70 = !{!"_ZTSN9apple3dgs11SortingModeE", !45, i64 0}
!71 = !{!67, !49, i64 404}
!72 = !{!58}
!73 = !{!51, !54, !55, !56, !57}
!74 = distinct !{!74, !75}
!75 = !{!"llvm.loop.mustprogress"}
!76 = !{!77, !77, i64 0}
!77 = !{!"float", !45, i64 0}
!78 = !{!54}
!79 = !{!51, !55, !56, !57, !58}
!80 = !{!69, !69, i64 0}

0x0000000002c520 -- PostAlphaBlendVS:
source_filename = "PostAlphaBlendVS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
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
define internal void @_GLOBAL__sub_I_GSRenderer.metal() #0 section "air.static_init" {
  %1 = load i8, i8 addrspace(2)* @_Z17kLayeredRendering.MTL_FC_INIT_1_b, align 1, !tbaa !40, !range !44
  %2 = load i8, i8 addrspace(2)* @_Z16kUseAntiAliasing.MTL_FC_INIT_3_b, align 1, !tbaa !40, !range !44
  store i8 %2, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !40
  %3 = load i8, i8 addrspace(2)* @_Z15kUseBackToFront.MTL_FC_INIT_4_b, align 1, !tbaa !40, !range !44
  store i8 %3, i8 addrspace(2)* @_ZL15kUseBackToFront, align 1, !tbaa !40
  %4 = xor i8 %2, 1
  %5 = xor i8 %3, 1
  store i8 %5, i8 addrspace(2)* @_ZL18kEnableDepthWrites, align 1, !tbaa !40
  %6 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %4) #5
  store i8 %6, i8 addrspace(2)* @__metal_implicit_fc_pred_0, align 1
  %7 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %2) #5
  store i8 %7, i8 addrspace(2)* @__metal_implicit_fc_pred_1, align 1
  %8 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %1) #5
  store i8 %8, i8 addrspace(2)* @__metal_implicit_fc_pred_2, align 1
  %9 = tail call i8 @air.normalize_function_constant_predicate.i8(i8 %5) #5
  store i8 %9, i8 addrspace(2)* @__metal_implicit_fc_pred_3, align 1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i8 @air.normalize_function_constant_predicate.i8(i8) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
define <{ <4 x half>, float, float }> @AlphaBlendFS(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(16) "air-buffer-no-alias" %0, <4 x half> %1, float %2, <4 x float> %3, <4 x half> %4, <2 x float> %5, <3 x float> %6, <2 x float> %7, <2 x float> %8, i32 %9, i32 %10) local_unnamed_addr #2 {
  %12 = extractelement <4 x float> %3, i64 2
  %13 = extractelement <4 x half> %4, i64 3
  %14 = tail call fastcc %struct.AlphaResult @_Z16GetFragmentAlphaRU11MTLconstantKN9apple3dgs19SplattingUniformsFSE17VertexOutTriangleDh(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* noundef align 4 dereferenceable(16) %0, <4 x float> undef, <4 x half> undef, <2 x float> %5, <3 x float> %6, <2 x float> %7, <2 x float> %8, i32 undef, i32 undef, [8 x i8] undef, half noundef %13) #6
  %15 = extractvalue %struct.AlphaResult %14, 0
  %16 = extractvalue %struct.AlphaResult %14, 1
  %17 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 0
  %18 = load i32, i32 addrspace(2)* %17, align 4, !tbaa !45, !alias.scope !50
  %19 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 2
  %20 = load float, float addrspace(2)* %19, align 4, !tbaa !53, !alias.scope !50
  %21 = fptrunc float %20 to half
  switch i32 %18, label %31 [
    i32 0, label %22
    i32 2, label %25
    i32 3, label %29
    i32 1, label %29
  ]

22:                                               ; preds = %11
  %23 = fcmp fast olt half %15, 0xH1C04
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  br label %31

25:                                               ; preds = %11
  %26 = fcmp fast olt half %15, 0xH1C04
  %27 = select i1 %26, i8 0, i8 %16
  %28 = tail call fast half @air.fmax.f16(half 0xH211F, half %21) #5
  br label %31

29:                                               ; preds = %11, %11
  %30 = tail call fast half @air.fmax.f16(half 0xH211F, half %21) #5
  br label %31

31:                                               ; preds = %29, %25, %24, %22, %11
  %32 = phi half [ %15, %11 ], [ %30, %29 ], [ %28, %25 ], [ %15, %24 ], [ %15, %22 ]
  %33 = phi i8 [ %16, %11 ], [ %16, %29 ], [ %27, %25 ], [ 0, %24 ], [ %16, %22 ]
  %34 = and i8 %33, 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %31
  tail call void @air.discard_fragment() #7
  br label %37

37:                                               ; preds = %36, %31
  %38 = insertelement <4 x half> %4, half 0xH3C00, i64 3
  %39 = insertelement <4 x half> poison, half %32, i64 0
  %40 = shufflevector <4 x half> %39, <4 x half> poison, <4 x i32> zeroinitializer
  %41 = fmul fast <4 x half> %40, %38
  %42 = fpext half %32 to float
  %43 = fmul fast float %12, %42
  %44 = load i8, i8 addrspace(2)* @_ZL15kUseBackToFront, align 1, !tbaa !40, !range !44
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %53, label %46

46:                                               ; preds = %37
  %47 = extractelement <4 x half> %41, i64 3
  %48 = fsub fast half 0xH3C00, %47
  %49 = insertelement <4 x half> poison, half %48, i64 0
  %50 = shufflevector <4 x half> %49, <4 x half> poison, <4 x i32> zeroinitializer
  %51 = fmul fast <4 x half> %50, %1
  %52 = fadd fast <4 x half> %51, %41
  br label %60

53:                                               ; preds = %37
  %54 = extractelement <4 x half> %1, i64 3
  %55 = fsub fast half 0xH3C00, %54
  %56 = insertelement <4 x half> poison, half %55, i64 0
  %57 = shufflevector <4 x half> %56, <4 x half> poison, <4 x i32> zeroinitializer
  %58 = fmul fast <4 x half> %41, %57
  %59 = fadd fast <4 x half> %58, %1
  br label %60

60:                                               ; preds = %53, %46
  %61 = phi <4 x half> [ %52, %46 ], [ %59, %53 ]
  %62 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 1
  %63 = load i32, i32 addrspace(2)* %62, align 4, !tbaa !54, !alias.scope !50
  switch i32 %63, label %80 [
    i32 0, label %64
    i32 1, label %75
    i32 2, label %79
  ]

64:                                               ; preds = %60
  br i1 %45, label %69, label %65

65:                                               ; preds = %64
  %66 = fsub fast float 1.000000e+00, %42
  %67 = fmul fast float %66, %2
  %68 = fadd fast float %67, %43
  br label %80

69:                                               ; preds = %64
  %70 = extractelement <4 x half> %1, i64 3
  %71 = fpext half %70 to float
  %72 = fsub fast float 1.000000e+00, %71
  %73 = fmul fast float %43, %72
  %74 = fadd fast float %73, %2
  br label %80

75:                                               ; preds = %60
  %76 = extractelement <4 x half> %61, i64 3
  %77 = fcmp fast ole half %76, 0xH3800
  %78 = select reassoc nsz arcp contract afn i1 %77, float %12, float %2
  br label %80

79:                                               ; preds = %60
  br label %80

80:                                               ; preds = %79, %75, %69, %65, %60
  %81 = phi float [ %43, %60 ], [ %12, %79 ], [ %78, %75 ], [ %68, %65 ], [ %74, %69 ]
  %82 = load i8, i8 addrspace(2)* @_ZL18kEnableDepthWrites, align 1, !tbaa !40, !range !44
  %83 = icmp eq i8 %82, 0
  %84 = extractelement <4 x half> %61, i64 3
  %85 = fcmp fast ogt half %84, 0xH3BF8
  %86 = select reassoc nsz arcp contract afn i1 %85, float %12, float 0.000000e+00
  %87 = select i1 %83, float undef, float %86
  %88 = insertvalue <{ <4 x half>, float, float }> undef, <4 x half> %61, 0
  %89 = insertvalue <{ <4 x half>, float, float }> %88, float %81, 1
  %90 = insertvalue <{ <4 x half>, float, float }> %89, float %87, 2
  ret <{ <4 x half>, float, float }> %90
}

; Function Attrs: mustprogress nounwind willreturn
declare void @air.discard_fragment() local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare half @air.fmax.f16(half, half) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readonly willreturn
define internal fastcc %struct.AlphaResult @_Z16GetFragmentAlphaRU11MTLconstantKN9apple3dgs19SplattingUniformsFSE17VertexOutTriangleDh(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(16) %0, <4 x float> %1, <4 x half> %2, <2 x float> %3, <3 x float> %4, <2 x float> %5, <2 x float> %6, i32 %7, i32 %8, [8 x i8] %9, half noundef %10) unnamed_addr #4 {
  %12 = load i8, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !40, !range !44
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %44, label %14

14:                                               ; preds = %11
  %15 = tail call fast float @air.dot.v2f32(<2 x float> %6, <2 x float> %6) #5
  %16 = tail call fast float @air.fast_sqrt.f32(float %15) #5
  %17 = fcmp fast ule float %16, 1.000000e+00
  %18 = zext i1 %17 to i8
  %19 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> %5, <2 x float> <float 0x3EB0C6F7A0000000, float 0x3EB0C6F7A0000000>) #5
  %20 = fdiv fast <2 x float> <float 5.000000e-01, float 5.000000e-01>, %19
  %21 = fmul fast <2 x float> %6, <float 3.000000e+00, float 3.000000e+00>
  %22 = fsub fast <2 x float> %21, %20
  %23 = fadd fast <2 x float> %20, %21
  %24 = fmul fast <2 x float> %22, %22
  %25 = fmul fast <2 x float> %24, <float 0x3FB1EB8520000000, float 0x3FB1EB8520000000>
  %26 = fsub fast <2 x float> <float 0xBFF99999A0000000, float 0xBFF99999A0000000>, %25
  %27 = fmul fast <2 x float> %26, %22
  %28 = tail call fast <2 x float> @air.fast_exp.v2f32(<2 x float> %27) #5
  %29 = fadd fast <2 x float> %28, <float 1.000000e+00, float 1.000000e+00>
  %30 = fdiv fast <2 x float> <float 1.000000e+00, float 1.000000e+00>, %29
  %31 = fmul fast <2 x float> %23, %23
  %32 = fmul fast <2 x float> %31, <float 0x3FB1EB8520000000, float 0x3FB1EB8520000000>
  %33 = fsub fast <2 x float> <float 0xBFF99999A0000000, float 0xBFF99999A0000000>, %32
  %34 = fmul fast <2 x float> %33, %23
  %35 = tail call fast <2 x float> @air.fast_exp.v2f32(<2 x float> %34) #5
  %36 = fadd fast <2 x float> %35, <float 1.000000e+00, float 1.000000e+00>
  %37 = fdiv fast <2 x float> <float 1.000000e+00, float 1.000000e+00>, %36
  %38 = fsub fast <2 x float> %37, %30
  %39 = fmul fast <2 x float> %38, %5
  %40 = extractelement <2 x float> %39, i64 0
  %41 = fmul fast float %40, 0x401921FB60000000
  %42 = extractelement <2 x float> %39, i64 1
  %43 = fmul fast float %41, %42
  br label %65

44:                                               ; preds = %11
  %45 = shufflevector <3 x float> %4, <3 x float> poison, <2 x i32> <i32 0, i32 2>
  %46 = fmul fast <2 x float> %3, %3
  %47 = tail call fast float @air.dot.v2f32(<2 x float> %45, <2 x float> %46) #5
  %48 = fmul fast float %47, -5.000000e-01
  %49 = extractelement <3 x float> %4, i64 1
  %50 = extractelement <2 x float> %3, i64 0
  %51 = extractelement <2 x float> %3, i64 1
  %52 = fmul fast float %51, %50
  %53 = fmul fast float %52, %49
  %54 = fsub fast float %48, %53
  %55 = fcmp fast ogt float %54, 0.000000e+00
  br i1 %55, label %61, label %56

56:                                               ; preds = %44
  %57 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 3
  %58 = load float, float addrspace(2)* %57, align 4, !tbaa !55
  %59 = tail call fast float @air.fast_clamp.f32(float %58, float -1.000000e+07, float 0x3F847AE140000000) #5
  %60 = fcmp fast olt float %54, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %56, %44
  br label %62

62:                                               ; preds = %61, %56
  %63 = phi i8 [ 0, %61 ], [ 1, %56 ]
  %64 = tail call fast float @air.fast_exp.f32(float %54) #5
  br label %65

65:                                               ; preds = %62, %14
  %66 = phi i8 [ %63, %62 ], [ %18, %14 ]
  %67 = phi float [ %64, %62 ], [ %43, %14 ]
  %68 = fptrunc float %67 to half
  %69 = fmul fast half %68, %10
  %70 = insertvalue %struct.AlphaResult poison, half %69, 0
  %71 = insertvalue %struct.AlphaResult %70, i8 %66, 1
  ret %struct.AlphaResult %71
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_exp.f32(float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_clamp.f32(float, float, float) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.dot.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.fast_exp.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.fast_fmax.v2f32(<2 x float>, <2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.fast_sqrt.f32(float) local_unnamed_addr #1

attributes #0 = { mustprogress nofree nosync nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #3 = { mustprogress nounwind willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #5 = { nounwind readnone willreturn }
attributes #6 = { nobuiltin "no-builtins" }
attributes #7 = { nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.function_constants = !{!37, !38, !39}

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
!15 = !{<{ <4 x half>, float, float }> (%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)*, <4 x half>, float, <4 x float>, <4 x half>, <2 x float>, <3 x float>, <2 x float>, <2 x float>, i32, i32)* @AlphaBlendFS, !16, !21}
!16 = !{!17, !18, !19}
!17 = !{!"air.render_target", i32 0, i32 0, !"air.raster_order_group", i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"rgba"}
!18 = !{!"air.render_target", i32 1, i32 0, !"air.raster_order_group", i32 0, !"air.arg_type_name", !"float", !"air.arg_name", !"depth"}
!19 = !{!"air.function_constant", !20, !"air.depth", !"air.depth_qualifier", !"air.less", !"air.arg_type_name", !"float", !"air.arg_name", !"zbuffer"}
!20 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_3, !"bool", !"kEnableDepthWrites"}
!21 = !{!22, !24, !25, !26, !27, !28, !30, !31, !33, !34, !36}
!22 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 16, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !23, !"air.arg_type_size", i32 16, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"apple3dgs::SplattingUniformsFS", !"air.arg_name", !"uniforms"}
!23 = !{i32 0, i32 4, i32 0, !"int", !"alpha_mode", i32 4, i32 4, i32 0, !"int", !"depth_mode", i32 8, i32 4, i32 0, !"float", !"alpha_constant", i32 12, i32 4, i32 0, !"float", !"power_threshold"}
!24 = !{i32 1, !"air.render_target", i32 0, !"air.raster_order_group", i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"rgba"}
!25 = !{i32 2, !"air.render_target", i32 1, !"air.raster_order_group", i32 0, !"air.arg_type_name", !"float", !"air.arg_name", !"depth"}
!26 = !{i32 3, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"pos"}
!27 = !{i32 4, !"air.fragment_input", !"generated(5colorDv4_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half4", !"air.arg_name", !"color"}
!28 = !{i32 5, !"air.function_constant", !29, !"air.fragment_input", !"generated(5deltaDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"delta"}
!29 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_0, !"bool", !"kUseConic"}
!30 = !{i32 6, !"air.function_constant", !29, !"air.fragment_input", !"generated(5conicDv3_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float3", !"air.arg_name", !"conic"}
!31 = !{i32 7, !"air.function_constant", !32, !"air.fragment_input", !"generated(5sigmaDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"sigma"}
!32 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_1, !"bool", !"kUseAntiAliasing"}
!33 = !{i32 8, !"air.function_constant", !32, !"air.fragment_input", !"generated(11splat_coordDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"splat_coord"}
!34 = !{i32 9, !"air.function_constant", !35, !"air.render_target_array_index", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer", !"air.arg_unused"}
!35 = !{i8 addrspace(2)* @__metal_implicit_fc_pred_2, !"bool", !"kLayeredRendering"}
!36 = !{i32 10, !"air.viewport_array_index", !"air.arg_type_name", !"uint", !"air.arg_name", !"viewport", !"air.arg_unused"}
!37 = !{i8 addrspace(2)* @_Z17kLayeredRendering.MTL_FC_INIT_1_b, !"bool", !"kLayeredRendering", i32 1, i1 true}
!38 = !{i8 addrspace(2)* @_Z16kUseAntiAliasing.MTL_FC_INIT_3_b, !"bool", !"kUseAntiAliasing", i32 3, i1 true}
!39 = !{i8 addrspace(2)* @_Z15kUseBackToFront.MTL_FC_INIT_4_b, !"bool", !"kUseBackToFront", i32 4, i1 true}
!40 = !{!41, !41, i64 0}
!41 = !{!"bool", !42, i64 0}
!42 = !{!"omnipotent char", !43, i64 0}
!43 = !{!"Simple C++ TBAA"}
!44 = !{i8 0, i8 2}
!45 = !{!46, !47, i64 0}
!46 = !{!"_ZTSN9apple3dgs19SplattingUniformsFSE", !47, i64 0, !48, i64 4, !49, i64 8, !49, i64 12}
!47 = !{!"_ZTSN9apple3dgs9AlphaModeE", !42, i64 0}
!48 = !{!"_ZTSN9apple3dgs9DepthModeE", !42, i64 0}
!49 = !{!"float", !42, i64 0}
!50 = !{!51}
!51 = distinct !{!51, !52, !"air-alias-scope-arg(0)"}
!52 = distinct !{!52, !"air-alias-scopes(AlphaBlendFS)"}
!53 = !{!46, !49, i64 8}
!54 = !{!46, !48, i64 4}
!55 = !{!46, !49, i64 12}

0x0000000002f490 -- PostAlphaBlendFS:
source_filename = "PostAlphaBlendFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.apple3dgs::DeferredUniformsFS" = type { i32, i32 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: argmemonly mustprogress nofree nosync nounwind readonly willreturn
define <{ <4 x half>, float }> @PostAlphaBlendFS(%"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(8) "air-buffer-no-alias" %0, <4 x half> noundef %1, float noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %0, i64 0, i32 0
  %5 = load i32, i32 addrspace(2)* %4, align 4, !tbaa !24, !alias.scope !30
  %6 = shufflevector <4 x half> %1, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %7 = icmp eq i32 %5, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %3
  %9 = fcmp fast ole <3 x half> %6, <half 0xH292D, half 0xH292D, half 0xH292D>
  %10 = fmul fast <3 x half> %6, <half 0xH2CF4, half 0xH2CF4, half 0xH2CF4>
  %11 = fadd fast <3 x half> %6, <half 0xH2B0A, half 0xH2B0A, half 0xH2B0A>
  %12 = fmul fast <3 x half> %11, <half 0xH3B96, half 0xH3B96, half 0xH3B96>
  %13 = tail call fast <3 x half> @air.powr.v3f16(<3 x half> %12, <3 x half> <half 0xH40CD, half 0xH40CD, half 0xH40CD>) #2
  %14 = select fast <3 x i1> %9, <3 x half> %10, <3 x half> %13
  br label %15

15:                                               ; preds = %8, %3
  %16 = phi fast <3 x half> [ %14, %8 ], [ %6, %3 ]
  %17 = shufflevector <3 x half> %16, <3 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %18 = shufflevector <4 x half> %17, <4 x half> %1, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %19 = extractelement <4 x half> %1, i64 3
  %20 = fpext half %19 to float
  %21 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %0, i64 0, i32 1
  %22 = load i32, i32 addrspace(2)* %21, align 4, !tbaa !33, !alias.scope !30
  %23 = fdiv fast float %2, %20
  %24 = icmp eq i32 %22, 0
  %25 = fcmp fast ogt half %19, 0xH0000
  %26 = select i1 %24, i1 %25, i1 false
  %27 = select reassoc nsz arcp contract afn i1 %26, float %23, float %2
  %28 = insertvalue <{ <4 x half>, float }> undef, <4 x half> %18, 0
  %29 = insertvalue <{ <4 x half>, float }> %28, float %27, 1
  ret <{ <4 x half>, float }> %29
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x half> @air.powr.v3f16(<3 x half>, <3 x half>) local_unnamed_addr #1

attributes #0 = { argmemonly mustprogress nofree nosync nounwind readonly willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="64" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}

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
!15 = !{<{ <4 x half>, float }> (%"struct.apple3dgs::DeferredUniformsFS" addrspace(2)*, <4 x half>, float)* @PostAlphaBlendFS, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.render_target", i32 2, i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"color"}
!18 = !{!"air.depth", !"air.depth_qualifier", !"air.any", !"air.arg_type_name", !"float", !"air.arg_name", !"depth"}
!19 = !{!20, !22, !23}
!20 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !21, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"apple3dgs::DeferredUniformsFS", !"air.arg_name", !"uniforms"}
!21 = !{i32 0, i32 4, i32 0, !"int", !"transfer_function", i32 4, i32 4, i32 0, !"int", !"depth_mode"}
!22 = !{i32 1, !"air.render_target", i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"color"}
!23 = !{i32 2, !"air.render_target", i32 1, !"air.arg_type_name", !"float", !"air.arg_name", !"depth"}
!24 = !{!25, !26, i64 0}
!25 = !{!"_ZTSN9apple3dgs18DeferredUniformsFSE", !26, i64 0, !29, i64 4}
!26 = !{!"_ZTSN9apple3dgs16TransferFunctionE", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !{!"_ZTSN9apple3dgs9DepthModeE", !27, i64 0}
!30 = !{!31}
!31 = distinct !{!31, !32, !"air-alias-scope-arg(0)"}
!32 = distinct !{!32, !"air-alias-scopes(PostAlphaBlendFS)"}
!33 = !{!25, !29, i64 4}

0x000000000304a0 -- MPIDeferredRefineFS:
source_filename = "MPIDeferredRefineFS"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "air64_v27-apple-macosx15.0.0"

%"struct.apple3dgs::DeferredUniformsFS" = type { i32, i32 }
%"struct.metal::matrix.38" = type { [3 x <3 x float>] }
%struct._texture_2d_t = type opaque
%struct._sampler_t = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@__air_sampler_state = internal addrspace(2) constant [2 x i64] [i64 34901797601028681, i64 0], align 8

; Function Attrs: convergent mustprogress nounwind
define <{ <4 x half>, float }> @MPIDeferredRefineFS(<4 x float> %0, i32 %1, <4 x float> noundef %2, float noundef %3, %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(8) "air-buffer-no-alias" %4, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, %struct._texture_2d_t addrspace(1)* %8, %struct._texture_2d_t addrspace(1)* %9) local_unnamed_addr #0 {
  %11 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %4, i64 0, i32 1
  %12 = load i32, i32 addrspace(2)* %11, align 4, !tbaa !32, !alias.scope !38, !noalias !41
  %13 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %4, i64 0, i32 0
  %14 = load i32, i32 addrspace(2)* %13, align 4, !tbaa !44, !alias.scope !38, !noalias !41
  %15 = shufflevector <4 x float> %2, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %10
  %18 = fcmp fast ole <3 x float> %15, <float 0x3FA4B5DCC0000000, float 0x3FA4B5DCC0000000, float 0x3FA4B5DCC0000000>
  %19 = fmul fast <3 x float> %15, <float 0x3FB3D07220000000, float 0x3FB3D07220000000, float 0x3FB3D07220000000>
  %20 = fadd fast <3 x float> %15, <float 0x3FAC28F5C0000000, float 0x3FAC28F5C0000000, float 0x3FAC28F5C0000000>
  %21 = fmul fast <3 x float> %20, <float 0x3FEE54EDE0000000, float 0x3FEE54EDE0000000, float 0x3FEE54EDE0000000>
  %22 = tail call fast <3 x float> @air.fast_powr.v3f32(<3 x float> %21, <3 x float> <float 0x4003333340000000, float 0x4003333340000000, float 0x4003333340000000>) #6
  %23 = select reassoc nsz arcp contract afn <3 x i1> %18, <3 x float> %19, <3 x float> %22
  br label %24

24:                                               ; preds = %17, %10
  %25 = phi fast <3 x float> [ %23, %17 ], [ %15, %10 ]
  %26 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %8, i32 0) #7, !alias.scope !45, !noalias !46
  %27 = tail call fast float @air.convert.f.f32.u.i32(i32 %26) #6
  %28 = insertelement <2 x float> undef, float %27, i64 0
  %29 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %8, i32 0) #7, !alias.scope !45, !noalias !46
  %30 = tail call fast float @air.convert.f.f32.u.i32(i32 %29) #6
  %31 = insertelement <2 x float> %28, float %30, i64 1
  %32 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 0
  %33 = load <3 x float>, <3 x float> addrspace(2)* %32, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %34 = shufflevector <4 x float> %0, <4 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %35 = fmul fast <3 x float> %33, %34
  %36 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 1
  %37 = load <3 x float>, <3 x float> addrspace(2)* %36, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %38 = shufflevector <4 x float> %0, <4 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %39 = fmul fast <3 x float> %37, %38
  %40 = fadd fast <3 x float> %39, %35
  %41 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 2
  %42 = load <3 x float>, <3 x float> addrspace(2)* %41, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %43 = fadd fast <3 x float> %40, %42
  %44 = shufflevector <3 x float> %43, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %45 = fcmp fast olt <2 x float> %44, zeroinitializer
  %46 = tail call i1 @air.any.v2i1(<2 x i1> %45) #6
  br i1 %46, label %50, label %47

47:                                               ; preds = %24
  %48 = fcmp fast oge <2 x float> %44, %31
  %49 = tail call i1 @air.any.v2i1(<2 x i1> %48) #6
  br label %50

50:                                               ; preds = %47, %24
  %51 = phi i1 [ true, %24 ], [ %49, %47 ]
  %52 = shufflevector <3 x float> %25, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %53 = shufflevector <4 x float> %52, <4 x float> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %54 = icmp eq i32 %12, 0
  %55 = extractelement <4 x float> %2, i64 3
  %56 = fcmp fast ogt float %55, 0.000000e+00
  %57 = select i1 %54, i1 %56, i1 false
  %58 = fdiv fast float %3, %55
  %59 = select reassoc nsz arcp contract afn i1 %57, float %58, float %3
  %60 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %61 = fdiv fast <2 x float> %44, %31
  %62 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %60) #6
  %63 = tail call fast fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %62, <2 x float> noundef %61, <4 x float> noundef %53, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, %struct._texture_2d_t addrspace(1)* %8, %struct._texture_2d_t addrspace(1)* %9) #8
  %64 = tail call fast <4 x half> @air.convert.f.v4f16.f.v4f32(<4 x float> %63) #6
  %65 = tail call fast <4 x half> @air.convert.f.v4f16.f.v4f32(<4 x float> %53) #6
  %66 = insertelement <4 x i1> poison, i1 %51, i64 0
  %67 = shufflevector <4 x i1> %66, <4 x i1> poison, <4 x i32> zeroinitializer
  %68 = select fast <4 x i1> %67, <4 x half> %65, <4 x half> %64
  %69 = insertvalue <{ <4 x half>, float }> undef, <4 x half> %68, 0
  %70 = insertvalue <{ <4 x half>, float }> %69, float %59, 1
  ret <{ <4 x half>, float }> %70
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <4 x half> @air.convert.f.v4f16.f.v4f32(<4 x float>) local_unnamed_addr #1

; Function Attrs: convergent mustprogress nounwind willreturn
define internal fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %0, <2 x float> noundef %1, <4 x float> noundef %2, %struct._texture_2d_t addrspace(1)* %3, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6) unnamed_addr #2 {
  %8 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #7
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #6
  %10 = insertelement <2 x float> undef, float %9, i64 0
  %11 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #7
  %12 = tail call fast float @air.convert.f.f32.u.i32(i32 %11) #6
  %13 = insertelement <2 x float> %10, float %12, i64 1
  %14 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %0) #6
  %15 = fadd fast <2 x float> %14, <float 5.000000e-01, float 5.000000e-01>
  %16 = fdiv fast <2 x float> %15, %13
  %17 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %5, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %18 = extractvalue { <4 x float>, i8 } %17, 0
  %19 = shufflevector <4 x float> %18, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %20 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %21 = extractvalue { <4 x float>, i8 } %20, 0
  %22 = shufflevector <4 x float> %21, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %23 = tail call fast <3 x float> @air.fast_fmax.v3f32(<3 x float> %22, <3 x float> <float 0x3F70101020000000, float 0x3F70101020000000, float 0x3F70101020000000>) #6
  %24 = fdiv fast <3 x float> %19, %23
  %25 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #9
  %26 = extractvalue { <4 x float>, i8 } %25, 0
  %27 = extractelement <4 x float> %26, i64 0
  %28 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %4, <2 x i32> %0, i32 0, i32 3) #7
  %29 = extractvalue { <4 x float>, i8 } %28, 0
  %30 = extractelement <4 x float> %29, i64 0
  %31 = extractelement <4 x float> %2, i64 3
  %32 = fsub fast float 1.000000e+00, %31
  %33 = fmul fast float %30, %32
  %34 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %33, i64 0
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %4, <2 x i32> %0, <4 x float> %34, i32 0, i32 3) #10
  %35 = fmul fast float %27, %31
  %36 = fmul fast float %35, %30
  %37 = shufflevector <3 x float> %24, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %38 = insertelement <4 x float> %37, float 1.000000e+00, i64 3
  %39 = fmul fast <4 x float> %38, %2
  %40 = shufflevector <4 x float> %2, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %41 = shufflevector <4 x float> %39, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %42 = insertelement <3 x float> poison, float %36, i64 0
  %43 = shufflevector <3 x float> %42, <3 x float> poison, <3 x i32> zeroinitializer
  %44 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %40, <3 x float> %41, <3 x float> %43) #6
  %45 = shufflevector <3 x float> %44, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %46 = shufflevector <4 x float> %45, <4 x float> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %47 = tail call fast <4 x float> @air.fast_saturate.v4f32(<4 x float> %46) #6
  ret <4 x float> %47
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <4 x float> @air.fast_saturate.v4f32(<4 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.mix.v3f32(<3 x float>, <3 x float>, <3 x float>) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture, <2 x i32>, <4 x float>, i32, i32) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, <2 x i32>, i32, i32) local_unnamed_addr #4

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
declare { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly, %struct._sampler_t addrspace(2)* nocapture readonly, <2 x float>, i1, <2 x i32>, i1, float, float, i32) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.fast_fmax.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare float @air.convert.f.f32.u.i32(i32) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind readonly willreturn
declare i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly, i32) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i1 @air.any.v2i1(<2 x i1>) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare <3 x float> @air.fast_powr.v3f32(<3 x float>, <3 x float>) local_unnamed_addr #1

attributes #0 = { convergent mustprogress nounwind "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn "approx-func-fp-math"="true" "frame-pointer"="all" "min-legal-vector-width"="128" "no-builtins" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" }
attributes #3 = { argmemonly mustprogress nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind readonly willreturn }
attributes #5 = { argmemonly convergent mustprogress nofree nounwind readonly willreturn }
attributes #6 = { nounwind readnone willreturn }
attributes #7 = { argmemonly nounwind readonly willreturn }
attributes #8 = { convergent nobuiltin nounwind "no-builtins" }
attributes #9 = { argmemonly convergent nounwind readonly willreturn }
attributes #10 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}
!air.version = !{!10}
!air.language_version = !{!11}
!air.compile_options = !{!12, !13, !14}
!air.fragment = !{!15}
!air.sampler_states = !{!31}

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
!15 = !{<{ <4 x half>, float }> (<4 x float>, i32, <4 x float>, float, %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)*, %"struct.metal::matrix.38" addrspace(2)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*, %struct._texture_2d_t addrspace(1)*)* @MPIDeferredRefineFS, !16, !19}
!16 = !{!17, !18}
!17 = !{!"air.render_target", i32 2, i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"color"}
!18 = !{!"air.depth", !"air.depth_qualifier", !"air.any", !"air.arg_type_name", !"float", !"air.arg_name", !"depth"}
!19 = !{!20, !21, !22, !23, !24, !26, !27, !28, !29, !30}
!20 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"position"}
!21 = !{i32 1, !"air.render_target_array_index", !"air.arg_type_name", !"uint", !"air.arg_name", !"layer", !"air.arg_unused"}
!22 = !{i32 2, !"air.render_target", i32 0, !"air.arg_type_name", !"float4", !"air.arg_name", !"color_in"}
!23 = !{i32 3, !"air.render_target", i32 1, !"air.arg_type_name", !"float", !"air.arg_name", !"depth_in"}
!24 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 0, i32 1, !"air.read", !"air.address_space", i32 2, !"air.struct_type_info", !25, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"apple3dgs::DeferredUniformsFS", !"air.arg_name", !"uniforms"}
!25 = !{i32 0, i32 4, i32 0, !"int", !"transfer_function", i32 4, i32 4, i32 0, !"int", !"depth_mode"}
!26 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 48, !"air.location_index", i32 1, i32 1, !"air.read", !"air.address_space", i32 2, !"air.arg_type_size", i32 48, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"float3x3", !"air.arg_name", !"transform_mpi_to_image"}
!27 = !{i32 6, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"refinement_weight_map"}
!28 = !{i32 7, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.read_write", !"air.arg_type_name", !"texture2d<float, read_write>", !"air.arg_name", !"trans"}
!29 = !{i32 8, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"gt_image"}
!30 = !{i32 9, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"mpi_rendered_image"}
!31 = !{!"air.sampler_state", [2 x i64] addrspace(2)* @__air_sampler_state}
!32 = !{!33, !37, i64 4}
!33 = !{!"_ZTSN9apple3dgs18DeferredUniformsFSE", !34, i64 0, !37, i64 4}
!34 = !{!"_ZTSN9apple3dgs16TransferFunctionE", !35, i64 0}
!35 = !{!"omnipotent char", !36, i64 0}
!36 = !{!"Simple C++ TBAA"}
!37 = !{!"_ZTSN9apple3dgs9DepthModeE", !35, i64 0}
!38 = !{!39}
!39 = distinct !{!39, !40, !"air-alias-scope-arg(4)"}
!40 = distinct !{!40, !"air-alias-scopes(MPIDeferredRefineFS)"}
!41 = !{!42, !43}
!42 = distinct !{!42, !40, !"air-alias-scope-arg(5)"}
!43 = distinct !{!43, !40, !"air-alias-scope-textures"}
!44 = !{!33, !34, i64 0}
!45 = !{!43}
!46 = !{!39, !42}
!47 = !{!35, !35, i64 0}
!48 = !{!42}
!49 = !{!39, !43}
