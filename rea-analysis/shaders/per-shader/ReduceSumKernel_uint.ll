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
