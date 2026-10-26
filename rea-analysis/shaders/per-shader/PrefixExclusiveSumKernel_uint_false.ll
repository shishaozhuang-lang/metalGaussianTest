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
