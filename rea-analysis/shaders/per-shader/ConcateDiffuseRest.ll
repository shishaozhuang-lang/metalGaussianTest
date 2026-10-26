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
