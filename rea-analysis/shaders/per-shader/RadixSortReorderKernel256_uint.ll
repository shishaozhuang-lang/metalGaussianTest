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
