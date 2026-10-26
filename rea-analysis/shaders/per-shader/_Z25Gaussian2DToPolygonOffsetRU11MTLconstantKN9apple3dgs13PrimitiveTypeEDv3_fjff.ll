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
