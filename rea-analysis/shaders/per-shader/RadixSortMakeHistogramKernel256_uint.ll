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
