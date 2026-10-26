define void @ComputeRefinementWeight(%struct._depth_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %2, <2 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = alloca %"struct.metal::array.4", align 8
  %6 = tail call i32 @air.get_width_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 0) #6, !alias.scope !23, !noalias !26
  %7 = tail call i32 @air.get_height_depth_2d(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 0) #6, !alias.scope !23, !noalias !26
  %8 = tail call i32 @air.max.u.i32(i32 %6, i32 %7) #7
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #7
  %10 = fmul fast float %9, 0x3F589374C0000000
  %11 = tail call i32 @air.convert.u.i32.f.f32(float %10) #7
  %12 = tail call i32 @air.max.u.i32(i32 1, i32 %11) #7
  %13 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %3) #7
  %14 = fadd fast <2 x float> %13, <float 5.000000e-01, float 5.000000e-01>
  %15 = tail call { float, i8 } @air.sample_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.2 to %struct._sampler_t addrspace(2)*), i32 1, <2 x float> %14, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %16 = extractvalue { float, i8 } %15, 0
  %17 = bitcast %"struct.metal::array.4"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %17) #9
  %18 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 0
  store <2 x i32> <i32 0, i32 1>, <2 x i32>* %18, align 8
  %19 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 1
  store <2 x i32> <i32 0, i32 -1>, <2 x i32>* %19, align 8
  %20 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 2
  store <2 x i32> <i32 1, i32 0>, <2 x i32>* %20, align 8
  %21 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 3
  store <2 x i32> <i32 -1, i32 0>, <2 x i32>* %21, align 8
  %22 = icmp eq i32 %12, 0
  br label %23

23:                                               ; preds = %64, %4
  %24 = phi float [ 0.000000e+00, %4 ], [ %65, %64 ]
  %25 = phi i32 [ 0, %4 ], [ %66, %64 ]
  br i1 %22, label %64, label %26

26:                                               ; preds = %23
  %27 = zext i32 %25 to i64
  %28 = getelementptr inbounds %"struct.metal::array.4", %"struct.metal::array.4"* %5, i64 0, i32 0, i64 %27
  %29 = load <2 x i32>, <2 x i32>* %28, align 8, !tbaa !28
  br label %68

30:                                               ; preds = %64
  %31 = tail call fast float @air.fast_fmax.f32(float %65, float 0.000000e+00) #7
  %32 = fmul fast float %31, 2.000000e+01
  %33 = tail call fast float @air.fast_clamp.f32(float %32, float -2.000000e+01, float 2.000000e+01) #7
  %34 = tail call fast float @air.fast_tanh.f32(float %33) #7
  %35 = fsub fast float 5.000000e-01, %34
  %36 = fmul fast float %35, 2.000000e+01
  %37 = tail call fast float @air.fast_exp.f32(float %36) #7
  %38 = fadd fast float %37, 1.000000e+00
  %39 = fdiv fast float 1.000000e+00, %38
  %40 = bitcast float %39 to i32
  %41 = and i32 %40, 2147483647
  %42 = icmp ugt i32 %41, 2139095040
  %43 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #6, !alias.scope !23, !noalias !26
  %44 = tail call fast float @air.convert.f.f32.u.i32(i32 %43) #7
  %45 = insertelement <2 x float> undef, float %44, i64 0
  %46 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #6, !alias.scope !23, !noalias !26
  %47 = tail call fast float @air.convert.f.f32.u.i32(i32 %46) #7
  %48 = insertelement <2 x float> %45, float %47, i64 1
  %49 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 0
  %50 = load <3 x float>, <3 x float> addrspace(2)* %49, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %51 = shufflevector <2 x float> %13, <2 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %52 = fmul fast <3 x float> %50, %51
  %53 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 1
  %54 = load <3 x float>, <3 x float> addrspace(2)* %53, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %55 = shufflevector <2 x float> %13, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %56 = fmul fast <3 x float> %54, %55
  %57 = fadd fast <3 x float> %56, %52
  %58 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %2, i64 0, i32 0, i64 2
  %59 = load <3 x float>, <3 x float> addrspace(2)* %58, align 16, !tbaa !28, !alias.scope !26, !noalias !23
  %60 = fadd fast <3 x float> %57, %59
  %61 = shufflevector <3 x float> %60, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %62 = fcmp fast olt <2 x float> %61, zeroinitializer
  %63 = tail call i1 @air.any.v2i1(<2 x i1> %62) #7
  br i1 %63, label %83, label %80

64:                                               ; preds = %68, %23
  %65 = phi float [ %24, %23 ], [ %78, %68 ]
  %66 = add nuw nsw i32 %25, 1
  %67 = icmp eq i32 %66, 4
  br i1 %67, label %30, label %23, !llvm.loop !31

68:                                               ; preds = %68, %26
  %69 = phi float [ %24, %26 ], [ %78, %68 ]
  %70 = phi i32 [ 0, %26 ], [ %71, %68 ]
  %71 = add nuw i32 %70, 1
  %72 = insertelement <2 x i32> poison, i32 %71, i64 0
  %73 = shufflevector <2 x i32> %72, <2 x i32> poison, <2 x i32> zeroinitializer
  %74 = mul <2 x i32> %73, %29
  %75 = tail call { float, i8 } @air.sample_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.2 to %struct._sampler_t addrspace(2)*), i32 1, <2 x float> %14, i1 true, <2 x i32> %74, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %76 = extractvalue { float, i8 } %75, 0
  %77 = fsub fast float %76, %16
  %78 = tail call fast float @air.fast_fmax.f32(float %69, float %77) #7
  %79 = icmp eq i32 %71, %12
  br i1 %79, label %64, label %68, !llvm.loop !33

80:                                               ; preds = %30
  %81 = fcmp fast oge <2 x float> %61, %48
  %82 = tail call i1 @air.any.v2i1(<2 x i1> %81) #7
  br i1 %82, label %83, label %84

83:                                               ; preds = %80, %30
  tail call void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x half> <half 0xH0000, half 0xH0000, half 0xH0000, half 0xH3C00>, i32 0, i32 2) #10, !alias.scope !23, !noalias !26
  br label %100

84:                                               ; preds = %80
  %85 = fsub fast <2 x float> %48, %61
  %86 = extractelement <2 x float> %85, i64 0
  %87 = extractelement <2 x float> %85, i64 1
  %88 = extractelement <3 x float> %60, i64 0
  %89 = tail call fast float @air.fast_fmin3.f32(float %86, float %87, float %88) #7
  %90 = extractelement <3 x float> %60, i64 1
  %91 = tail call fast float @air.fast_fmin.f32(float %89, float %90) #7
  %92 = fmul fast float %91, 0x3FA99999A0000000
  %93 = tail call fast float @air.fast_clamp.f32(float %92, float -2.000000e+01, float 2.000000e+01) #7
  %94 = tail call fast float @air.fast_tanh.f32(float %93) #7
  %95 = fsub fast float 1.000000e+00, %39
  %96 = select i1 %42, float 1.000000e+00, float %95
  %97 = fmul fast float %94, %96
  %98 = fptrunc float %97 to half
  %99 = insertelement <4 x half> <half poison, half 0xH0000, half 0xH0000, half 0xH3C00>, half %98, i64 0
  tail call void @air.write_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x half> %99, i32 0, i32 2) #10, !alias.scope !23, !noalias !26
  br label %100

100:                                              ; preds = %84, %83
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %17) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
