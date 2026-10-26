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
