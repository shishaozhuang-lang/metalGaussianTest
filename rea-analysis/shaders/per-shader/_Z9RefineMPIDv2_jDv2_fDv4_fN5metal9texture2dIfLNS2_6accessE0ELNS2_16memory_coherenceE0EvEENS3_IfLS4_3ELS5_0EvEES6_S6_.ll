define internal fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %0, <2 x float> noundef %1, <4 x float> noundef %2, %struct._texture_2d_t addrspace(1)* %3, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6) unnamed_addr #2 {
  %8 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6
  %9 = tail call fast float @air.convert.f.f32.u.i32(i32 %8) #7
  %10 = insertelement <2 x float> undef, float %9, i64 0
  %11 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6
  %12 = tail call fast float @air.convert.f.f32.u.i32(i32 %11) #7
  %13 = insertelement <2 x float> %10, float %12, i64 1
  %14 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %0) #7
  %15 = fadd fast <2 x float> %14, <float 5.000000e-01, float 5.000000e-01>
  %16 = fdiv fast <2 x float> %15, %13
  %17 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %5, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %18 = extractvalue { <4 x float>, i8 } %17, 0
  %19 = shufflevector <4 x float> %18, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %20 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %21 = extractvalue { <4 x float>, i8 } %20, 0
  %22 = shufflevector <4 x float> %21, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %23 = tail call fast <3 x float> @air.fast_fmax.v3f32(<3 x float> %22, <3 x float> <float 0x3F70101020000000, float 0x3F70101020000000, float 0x3F70101020000000>) #7
  %24 = fdiv fast <3 x float> %19, %23
  %25 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %16, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #10
  %26 = extractvalue { <4 x float>, i8 } %25, 0
  %27 = extractelement <4 x float> %26, i64 0
  %28 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %4, <2 x i32> %0, i32 0, i32 3) #6
  %29 = extractvalue { <4 x float>, i8 } %28, 0
  %30 = extractelement <4 x float> %29, i64 0
  %31 = extractelement <4 x float> %2, i64 3
  %32 = fsub fast float 1.000000e+00, %31
  %33 = fmul fast float %30, %32
  %34 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %33, i64 0
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %4, <2 x i32> %0, <4 x float> %34, i32 0, i32 3) #9
  %35 = fmul fast float %27, %31
  %36 = fmul fast float %35, %30
  %37 = shufflevector <3 x float> %24, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %38 = insertelement <4 x float> %37, float 1.000000e+00, i64 3
  %39 = fmul fast <4 x float> %38, %2
  %40 = shufflevector <4 x float> %2, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %41 = shufflevector <4 x float> %39, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %42 = insertelement <3 x float> poison, float %36, i64 0
  %43 = shufflevector <3 x float> %42, <3 x float> poison, <3 x i32> zeroinitializer
  %44 = tail call fast <3 x float> @air.mix.v3f32(<3 x float> %40, <3 x float> %41, <3 x float> %43) #7
  %45 = shufflevector <3 x float> %44, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %46 = shufflevector <4 x float> %45, <4 x float> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %47 = tail call fast <4 x float> @air.fast_saturate.v4f32(<4 x float> %46) #7
  ret <4 x float> %47
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
