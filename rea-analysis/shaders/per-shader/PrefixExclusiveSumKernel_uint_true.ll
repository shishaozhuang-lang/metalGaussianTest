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
