define internal fastcc void @_Z12ComputeCov3DDv3_fN9apple3dgs14ActivationTypeEfDv4_fPU9MTLdevicefS4_(<3 x float> noundef %0, i32 noundef %1, float noundef %2, <4 x float> noundef %3, float addrspace(1)* nocapture noundef writeonly %4, float addrspace(1)* nocapture noundef writeonly %5) unnamed_addr #1 {
  switch i32 %1, label %14 [
    i32 2, label %9
    i32 1, label %7
  ]

7:                                                ; preds = %6
  %8 = tail call fast <3 x float> @air.fast_exp.v3f32(<3 x float> %0) #4
  br label %14

9:                                                ; preds = %6
  %10 = fneg fast <3 x float> %0
  %11 = tail call fast <3 x float> @air.fast_exp.v3f32(<3 x float> %10) #4
  %12 = fadd fast <3 x float> %11, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  %13 = fdiv fast <3 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %12
  br label %14

14:                                               ; preds = %9, %7, %6
  %15 = phi <3 x float> [ %13, %9 ], [ %8, %7 ], [ %0, %6 ]
  %16 = extractelement <3 x float> %15, i64 0
  %17 = fmul fast float %16, %2
  %18 = insertelement <3 x float> <float poison, float 0.000000e+00, float 0.000000e+00>, float %17, i64 0
  %19 = extractelement <3 x float> %15, i64 1
  %20 = fmul fast float %19, %2
  %21 = insertelement <3 x float> <float 0.000000e+00, float poison, float 0.000000e+00>, float %20, i64 1
  %22 = extractelement <3 x float> %15, i64 2
  %23 = fmul fast float %22, %2
  %24 = insertelement <3 x float> <float 0.000000e+00, float 0.000000e+00, float poison>, float %23, i64 2
  %25 = tail call fast float @air.dot.v4f32(<4 x float> %3, <4 x float> %3) #4
  %26 = tail call fast float @air.fast_rsqrt.f32(float %25) #4
  %27 = insertelement <4 x float> poison, float %26, i64 0
  %28 = shufflevector <4 x float> %27, <4 x float> poison, <4 x i32> zeroinitializer
  %29 = fmul fast <4 x float> %28, %3
  %30 = bitcast <4 x float> %29 to <4 x i32>
  %31 = and <4 x i32> %30, <i32 2147483647, i32 2147483647, i32 2147483647, i32 2147483647>
  %32 = icmp ugt <4 x i32> %31, <i32 2139095040, i32 2139095040, i32 2139095040, i32 2139095040>
  %33 = select reassoc nsz arcp contract afn <4 x i1> %32, <4 x float> zeroinitializer, <4 x float> %29
  %34 = extractelement <4 x float> %33, i64 2
  %35 = fmul fast float %34, %34
  %36 = extractelement <4 x float> %33, i64 3
  %37 = fmul fast float %36, %36
  %38 = fadd fast float %35, %37
  %39 = fmul fast float %38, 2.000000e+00
  %40 = fsub fast float 1.000000e+00, %39
  %41 = insertelement <3 x float> undef, float %40, i64 0
  %42 = extractelement <4 x float> %33, i64 1
  %43 = fmul fast float %42, %34
  %44 = extractelement <4 x float> %33, i64 0
  %45 = fmul fast float %44, %36
  %46 = fsub fast float %43, %45
  %47 = fmul fast float %46, 2.000000e+00
  %48 = fmul fast float %42, %36
  %49 = fmul fast float %44, %34
  %50 = fadd fast float %48, %49
  %51 = fmul fast float %50, 2.000000e+00
  %52 = fadd fast float %43, %45
  %53 = fmul fast float %52, 2.000000e+00
  %54 = insertelement <3 x float> undef, float %53, i64 0
  %55 = fmul fast float %42, %42
  %56 = fadd fast float %55, %37
  %57 = fmul fast float %56, 2.000000e+00
  %58 = fsub fast float 1.000000e+00, %57
  %59 = fmul fast float %34, %36
  %60 = fmul fast float %44, %42
  %61 = fsub fast float %59, %60
  %62 = fmul fast float %61, 2.000000e+00
  %63 = fsub fast float %48, %49
  %64 = fmul fast float %63, 2.000000e+00
  %65 = insertelement <3 x float> undef, float %64, i64 0
  %66 = fadd fast float %59, %60
  %67 = fmul fast float %66, 2.000000e+00
  %68 = fadd fast float %55, %35
  %69 = fmul fast float %68, 2.000000e+00
  %70 = fsub fast float 1.000000e+00, %69
  %71 = shufflevector <3 x float> %41, <3 x float> poison, <3 x i32> zeroinitializer
  %72 = fmul fast <3 x float> %71, %18
  %73 = insertelement <3 x float> undef, float %47, i64 0
  %74 = shufflevector <3 x float> %73, <3 x float> poison, <3 x i32> zeroinitializer
  %75 = fmul fast <3 x float> %74, %21
  %76 = insertelement <3 x float> undef, float %51, i64 0
  %77 = shufflevector <3 x float> %76, <3 x float> poison, <3 x i32> zeroinitializer
  %78 = fmul fast <3 x float> %77, %24
  %79 = fadd fast <3 x float> %78, %75
  %80 = fadd fast <3 x float> %79, %72
  %81 = shufflevector <3 x float> %54, <3 x float> poison, <3 x i32> zeroinitializer
  %82 = fmul fast <3 x float> %81, %18
  %83 = insertelement <3 x float> undef, float %58, i64 0
  %84 = shufflevector <3 x float> %83, <3 x float> poison, <3 x i32> zeroinitializer
  %85 = fmul fast <3 x float> %84, %21
  %86 = insertelement <3 x float> undef, float %62, i64 0
  %87 = shufflevector <3 x float> %86, <3 x float> poison, <3 x i32> zeroinitializer
  %88 = fmul fast <3 x float> %87, %24
  %89 = fadd fast <3 x float> %88, %82
  %90 = fadd fast <3 x float> %89, %85
  %91 = shufflevector <3 x float> %65, <3 x float> poison, <3 x i32> zeroinitializer
  %92 = fmul fast <3 x float> %91, %18
  %93 = insertelement <3 x float> undef, float %67, i64 0
  %94 = shufflevector <3 x float> %93, <3 x float> poison, <3 x i32> zeroinitializer
  %95 = fmul fast <3 x float> %94, %21
  %96 = fadd fast <3 x float> %92, %95
  %97 = insertelement <3 x float> undef, float %70, i64 0
  %98 = shufflevector <3 x float> %97, <3 x float> poison, <3 x i32> zeroinitializer
  %99 = fmul fast <3 x float> %98, %24
  %100 = fadd fast <3 x float> %96, %99
  %101 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 0, i32 3, i32 undef>
  %102 = shufflevector <3 x float> %101, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 3>
  %103 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 1, i32 4, i32 undef>
  %104 = shufflevector <3 x float> %103, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 4>
  %105 = shufflevector <3 x float> %80, <3 x float> %90, <3 x i32> <i32 2, i32 5, i32 undef>
  %106 = shufflevector <3 x float> %105, <3 x float> %100, <3 x i32> <i32 0, i32 1, i32 5>
  %107 = shufflevector <3 x float> %80, <3 x float> poison, <3 x i32> zeroinitializer
  %108 = fmul fast <3 x float> %102, %107
  %109 = shufflevector <3 x float> %80, <3 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %110 = fmul fast <3 x float> %104, %109
  %111 = fadd fast <3 x float> %108, %110
  %112 = shufflevector <3 x float> %80, <3 x float> undef, <3 x i32> <i32 2, i32 2, i32 2>
  %113 = fmul fast <3 x float> %106, %112
  %114 = fadd fast <3 x float> %111, %113
  %115 = shufflevector <3 x float> %90, <3 x float> poison, <3 x i32> <i32 undef, i32 0, i32 0>
  %116 = fmul fast <3 x float> %102, %115
  %117 = shufflevector <3 x float> %90, <3 x float> undef, <3 x i32> <i32 undef, i32 1, i32 1>
  %118 = fmul fast <3 x float> %104, %117
  %119 = fadd fast <3 x float> %116, %118
  %120 = shufflevector <3 x float> %90, <3 x float> undef, <3 x i32> <i32 undef, i32 2, i32 2>
  %121 = fmul fast <3 x float> %106, %120
  %122 = fadd fast <3 x float> %119, %121
  %123 = shufflevector <3 x float> %100, <3 x float> poison, <3 x i32> <i32 undef, i32 undef, i32 0>
  %124 = fmul fast <3 x float> %102, %123
  %125 = shufflevector <3 x float> %100, <3 x float> undef, <3 x i32> <i32 undef, i32 undef, i32 1>
  %126 = fmul fast <3 x float> %104, %125
  %127 = fadd fast <3 x float> %124, %126
  %128 = fmul fast <3 x float> %106, %100
  %129 = fadd fast <3 x float> %127, %128
  %130 = extractelement <3 x float> %114, i64 0
  store float %130, float addrspace(1)* %4, align 4, !tbaa !36
  %131 = extractelement <3 x float> %114, i64 1
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 1
  store float %131, float addrspace(1)* %132, align 4, !tbaa !36
  %133 = extractelement <3 x float> %114, i64 2
  %134 = getelementptr inbounds float, float addrspace(1)* %4, i64 2
  store float %133, float addrspace(1)* %134, align 4, !tbaa !36
  %135 = extractelement <3 x float> %122, i64 1
  %136 = getelementptr inbounds float, float addrspace(1)* %4, i64 3
  store float %135, float addrspace(1)* %136, align 4, !tbaa !36
  %137 = extractelement <3 x float> %122, i64 2
  %138 = getelementptr inbounds float, float addrspace(1)* %4, i64 4
  store float %137, float addrspace(1)* %138, align 4, !tbaa !36
  %139 = extractelement <3 x float> %129, i64 2
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 5
  store float %139, float addrspace(1)* %140, align 4, !tbaa !36
  %141 = fmul fast float %2, 3.000000e+00
  %142 = tail call fast float @air.fast_fmax.f32(float %16, float %19) #4
  %143 = tail call fast float @air.fast_fmax.f32(float %142, float %22) #4
  %144 = fmul fast float %141, %143
  store float %144, float addrspace(1)* %5, align 4, !tbaa !36
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
