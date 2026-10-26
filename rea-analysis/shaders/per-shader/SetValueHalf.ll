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
