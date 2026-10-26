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
