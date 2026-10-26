define <{ <4 x half>, float, float }> @AlphaBlendFS(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(16) "air-buffer-no-alias" %0, <4 x half> %1, float %2, <4 x float> %3, <4 x half> %4, <2 x float> %5, <3 x float> %6, <2 x float> %7, <2 x float> %8, i32 %9, i32 %10) local_unnamed_addr #2 {
  %12 = extractelement <4 x float> %3, i64 2
  %13 = extractelement <4 x half> %4, i64 3
  %14 = tail call fastcc %struct.AlphaResult @_Z16GetFragmentAlphaRU11MTLconstantKN9apple3dgs19SplattingUniformsFSE17VertexOutTriangleDh(%"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* noundef align 4 dereferenceable(16) %0, <4 x float> undef, <4 x half> undef, <2 x float> %5, <3 x float> %6, <2 x float> %7, <2 x float> %8, i32 undef, i32 undef, [8 x i8] undef, half noundef %13) #6
  %15 = extractvalue %struct.AlphaResult %14, 0
  %16 = extractvalue %struct.AlphaResult %14, 1
  %17 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 0
  %18 = load i32, i32 addrspace(2)* %17, align 4, !tbaa !45, !alias.scope !50
  %19 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 2
  %20 = load float, float addrspace(2)* %19, align 4, !tbaa !53, !alias.scope !50
  %21 = fptrunc float %20 to half
  switch i32 %18, label %31 [
    i32 0, label %22
    i32 2, label %25
    i32 3, label %29
    i32 1, label %29
  ]

22:                                               ; preds = %11
  %23 = fcmp fast olt half %15, 0xH1C04
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  br label %31

25:                                               ; preds = %11
  %26 = fcmp fast olt half %15, 0xH1C04
  %27 = select i1 %26, i8 0, i8 %16
  %28 = tail call fast half @air.fmax.f16(half 0xH211F, half %21) #5
  br label %31

29:                                               ; preds = %11, %11
  %30 = tail call fast half @air.fmax.f16(half 0xH211F, half %21) #5
  br label %31

31:                                               ; preds = %29, %25, %24, %22, %11
  %32 = phi half [ %15, %11 ], [ %30, %29 ], [ %28, %25 ], [ %15, %24 ], [ %15, %22 ]
  %33 = phi i8 [ %16, %11 ], [ %16, %29 ], [ %27, %25 ], [ 0, %24 ], [ %16, %22 ]
  %34 = and i8 %33, 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %31
  tail call void @air.discard_fragment() #7
  br label %37

37:                                               ; preds = %36, %31
  %38 = insertelement <4 x half> %4, half 0xH3C00, i64 3
  %39 = insertelement <4 x half> poison, half %32, i64 0
  %40 = shufflevector <4 x half> %39, <4 x half> poison, <4 x i32> zeroinitializer
  %41 = fmul fast <4 x half> %40, %38
  %42 = fpext half %32 to float
  %43 = fmul fast float %12, %42
  %44 = load i8, i8 addrspace(2)* @_ZL15kUseBackToFront, align 1, !tbaa !40, !range !44
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %53, label %46

46:                                               ; preds = %37
  %47 = extractelement <4 x half> %41, i64 3
  %48 = fsub fast half 0xH3C00, %47
  %49 = insertelement <4 x half> poison, half %48, i64 0
  %50 = shufflevector <4 x half> %49, <4 x half> poison, <4 x i32> zeroinitializer
  %51 = fmul fast <4 x half> %50, %1
  %52 = fadd fast <4 x half> %51, %41
  br label %60

53:                                               ; preds = %37
  %54 = extractelement <4 x half> %1, i64 3
  %55 = fsub fast half 0xH3C00, %54
  %56 = insertelement <4 x half> poison, half %55, i64 0
  %57 = shufflevector <4 x half> %56, <4 x half> poison, <4 x i32> zeroinitializer
  %58 = fmul fast <4 x half> %41, %57
  %59 = fadd fast <4 x half> %58, %1
  br label %60

60:                                               ; preds = %53, %46
  %61 = phi <4 x half> [ %52, %46 ], [ %59, %53 ]
  %62 = getelementptr inbounds %"struct.apple3dgs::SplattingUniformsFS", %"struct.apple3dgs::SplattingUniformsFS" addrspace(2)* %0, i64 0, i32 1
  %63 = load i32, i32 addrspace(2)* %62, align 4, !tbaa !54, !alias.scope !50
  switch i32 %63, label %80 [
    i32 0, label %64
    i32 1, label %75
    i32 2, label %79
  ]

64:                                               ; preds = %60
  br i1 %45, label %69, label %65

65:                                               ; preds = %64
  %66 = fsub fast float 1.000000e+00, %42
  %67 = fmul fast float %66, %2
  %68 = fadd fast float %67, %43
  br label %80

69:                                               ; preds = %64
  %70 = extractelement <4 x half> %1, i64 3
  %71 = fpext half %70 to float
  %72 = fsub fast float 1.000000e+00, %71
  %73 = fmul fast float %43, %72
  %74 = fadd fast float %73, %2
  br label %80

75:                                               ; preds = %60
  %76 = extractelement <4 x half> %61, i64 3
  %77 = fcmp fast ole half %76, 0xH3800
  %78 = select reassoc nsz arcp contract afn i1 %77, float %12, float %2
  br label %80

79:                                               ; preds = %60
  br label %80

80:                                               ; preds = %79, %75, %69, %65, %60
  %81 = phi float [ %43, %60 ], [ %12, %79 ], [ %78, %75 ], [ %68, %65 ], [ %74, %69 ]
  %82 = load i8, i8 addrspace(2)* @_ZL18kEnableDepthWrites, align 1, !tbaa !40, !range !44
  %83 = icmp eq i8 %82, 0
  %84 = extractelement <4 x half> %61, i64 3
  %85 = fcmp fast ogt half %84, 0xH3BF8
  %86 = select reassoc nsz arcp contract afn i1 %85, float %12, float 0.000000e+00
  %87 = select i1 %83, float undef, float %86
  %88 = insertvalue <{ <4 x half>, float, float }> undef, <4 x half> %61, 0
  %89 = insertvalue <{ <4 x half>, float, float }> %88, float %81, 1
  %90 = insertvalue <{ <4 x half>, float, float }> %89, float %87, 2
  ret <{ <4 x half>, float, float }> %90
}

; Function Attrs: mustprogress nounwind willreturn
