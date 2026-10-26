define internal fastcc %struct.AlphaResult @_Z16GetFragmentAlphaRU11MTLconstantKN9apple3dgs19SplattingUniformsFSE17VertexOutTriangleDh(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(16) %0, <4 x float> %1, <4 x half> %2, <2 x float> %3, <3 x float> %4, <2 x float> %5, <2 x float> %6, i32 %7, i32 %8, [8 x i8] %9, half noundef %10) unnamed_addr #4 {
  %12 = load i8, i8 addrspace(2)* @_ZL16kUseAntiAliasing, align 1, !tbaa !40, !range !44
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %44, label %14

14:                                               ; preds = %11
  %15 = tail call fast float @air.dot.v2f32(<2 x float> %6, <2 x float> %6) #5
  %16 = tail call fast float @air.fast_sqrt.f32(float %15) #5
  %17 = fcmp fast ule float %16, 1.000000e+00
  %18 = zext i1 %17 to i8
  %19 = tail call fast <2 x float> @air.fast_fmax.v2f32(<2 x float> %5, <2 x float> <float 0x3EB0C6F7A0000000, float 0x3EB0C6F7A0000000>) #5
  %20 = fdiv fast <2 x float> <float 5.000000e-01, float 5.000000e-01>, %19
  %21 = fmul fast <2 x float> %6, <float 3.000000e+00, float 3.000000e+00>
  %22 = fsub fast <2 x float> %21, %20
  %23 = fadd fast <2 x float> %20, %21
  %24 = fmul fast <2 x float> %22, %22
  %25 = fmul fast <2 x float> %24, <float 0x3FB1EB8520000000, float 0x3FB1EB8520000000>
  %26 = fsub fast <2 x float> <float 0xBFF99999A0000000, float 0xBFF99999A0000000>, %25
  %27 = fmul fast <2 x float> %26, %22
  %28 = tail call fast <2 x float> @air.fast_exp.v2f32(<2 x float> %27) #5
  %29 = fadd fast <2 x float> %28, <float 1.000000e+00, float 1.000000e+00>
  %30 = fdiv fast <2 x float> <float 1.000000e+00, float 1.000000e+00>, %29
  %31 = fmul fast <2 x float> %23, %23
  %32 = fmul fast <2 x float> %31, <float 0x3FB1EB8520000000, float 0x3FB1EB8520000000>
  %33 = fsub fast <2 x float> <float 0xBFF99999A0000000, float 0xBFF99999A0000000>, %32
  %34 = fmul fast <2 x float> %33, %23
  %35 = tail call fast <2 x float> @air.fast_exp.v2f32(<2 x float> %34) #5
  %36 = fadd fast <2 x float> %35, <float 1.000000e+00, float 1.000000e+00>
  %37 = fdiv fast <2 x float> <float 1.000000e+00, float 1.000000e+00>, %36
  %38 = fsub fast <2 x float> %37, %30
  %39 = fmul fast <2 x float> %38, %5
  %40 = extractelement <2 x float> %39, i64 0
  %41 = fmul fast float %40, 0x401921FB60000000
  %42 = extractelement <2 x float> %39, i64 1
  %43 = fmul fast float %41, %42
  br label %65

44:                                               ; preds = %11
  %45 = shufflevector <3 x float> %4, <3 x float> poison, <2 x i32> <i32 0, i32 2>
  %46 = fmul fast <2 x float> %3, %3
  %47 = tail call fast float @air.dot.v2f32(<2 x float> %45, <2 x float> %46) #5
  %48 = fmul fast float %47, -5.000000e-01
  %49 = extractelement <3 x float> %4, i64 1
  %50 = extractelement <2 x float> %3, i64 0
  %51 = extractelement <2 x float> %3, i64 1
  %52 = fmul fast float %51, %50
  %53 = fmul fast float %52, %49
  %54 = fsub fast float %48, %53
  %55 = fcmp fast ogt float %54, 0.000000e+00
  br i1 %55, label %61, label %56

56:                                               ; preds = %44
  %57 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 3
  %58 = load float, float addrspace(2)* %57, align 4, !tbaa !55
  %59 = tail call fast float @air.fast_clamp.f32(float %58, float -1.000000e+07, float 0x3F847AE140000000) #5
  %60 = fcmp fast olt float %54, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %56, %44
  br label %62

62:                                               ; preds = %61, %56
  %63 = phi i8 [ 0, %61 ], [ 1, %56 ]
  %64 = tail call fast float @air.fast_exp.f32(float %54) #5
  br label %65

65:                                               ; preds = %62, %14
  %66 = phi i8 [ %63, %62 ], [ %18, %14 ]
  %67 = phi float [ %64, %62 ], [ %43, %14 ]
  %68 = fptrunc float %67 to half
  %69 = fmul fast half %68, %10
  %70 = insertvalue %struct.AlphaResult poison, half %69, 0
  %71 = insertvalue %struct.AlphaResult %70, i8 %66, 1
  ret %struct.AlphaResult %71
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
