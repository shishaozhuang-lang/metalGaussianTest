define <{ <4 x half>, float }> @MPIDeferredRefineFS(<4 x float> %0, i32 %1, <4 x float> noundef %2, float noundef %3, %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(8) "air-buffer-no-alias" %4, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, %struct._texture_2d_t addrspace(1)* %8, %struct._texture_2d_t addrspace(1)* %9) local_unnamed_addr #0 {
  %11 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %4, i64 0, i32 1
  %12 = load i32, i32 addrspace(2)* %11, align 4, !tbaa !32, !alias.scope !38, !noalias !41
  %13 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %4, i64 0, i32 0
  %14 = load i32, i32 addrspace(2)* %13, align 4, !tbaa !44, !alias.scope !38, !noalias !41
  %15 = shufflevector <4 x float> %2, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %10
  %18 = fcmp fast ole <3 x float> %15, <float 0x3FA4B5DCC0000000, float 0x3FA4B5DCC0000000, float 0x3FA4B5DCC0000000>
  %19 = fmul fast <3 x float> %15, <float 0x3FB3D07220000000, float 0x3FB3D07220000000, float 0x3FB3D07220000000>
  %20 = fadd fast <3 x float> %15, <float 0x3FAC28F5C0000000, float 0x3FAC28F5C0000000, float 0x3FAC28F5C0000000>
  %21 = fmul fast <3 x float> %20, <float 0x3FEE54EDE0000000, float 0x3FEE54EDE0000000, float 0x3FEE54EDE0000000>
  %22 = tail call fast <3 x float> @air.fast_powr.v3f32(<3 x float> %21, <3 x float> <float 0x4003333340000000, float 0x4003333340000000, float 0x4003333340000000>) #6
  %23 = select reassoc nsz arcp contract afn <3 x i1> %18, <3 x float> %19, <3 x float> %22
  br label %24

24:                                               ; preds = %17, %10
  %25 = phi fast <3 x float> [ %23, %17 ], [ %15, %10 ]
  %26 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %8, i32 0) #7, !alias.scope !45, !noalias !46
  %27 = tail call fast float @air.convert.f.f32.u.i32(i32 %26) #6
  %28 = insertelement <2 x float> undef, float %27, i64 0
  %29 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %8, i32 0) #7, !alias.scope !45, !noalias !46
  %30 = tail call fast float @air.convert.f.f32.u.i32(i32 %29) #6
  %31 = insertelement <2 x float> %28, float %30, i64 1
  %32 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 0
  %33 = load <3 x float>, <3 x float> addrspace(2)* %32, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %34 = shufflevector <4 x float> %0, <4 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %35 = fmul fast <3 x float> %33, %34
  %36 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 1
  %37 = load <3 x float>, <3 x float> addrspace(2)* %36, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %38 = shufflevector <4 x float> %0, <4 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %39 = fmul fast <3 x float> %37, %38
  %40 = fadd fast <3 x float> %39, %35
  %41 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %5, i64 0, i32 0, i64 2
  %42 = load <3 x float>, <3 x float> addrspace(2)* %41, align 16, !tbaa !47, !alias.scope !48, !noalias !49
  %43 = fadd fast <3 x float> %40, %42
  %44 = shufflevector <3 x float> %43, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %45 = fcmp fast olt <2 x float> %44, zeroinitializer
  %46 = tail call i1 @air.any.v2i1(<2 x i1> %45) #6
  br i1 %46, label %50, label %47

47:                                               ; preds = %24
  %48 = fcmp fast oge <2 x float> %44, %31
  %49 = tail call i1 @air.any.v2i1(<2 x i1> %48) #6
  br label %50

50:                                               ; preds = %47, %24
  %51 = phi i1 [ true, %24 ], [ %49, %47 ]
  %52 = shufflevector <3 x float> %25, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %53 = shufflevector <4 x float> %52, <4 x float> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %54 = icmp eq i32 %12, 0
  %55 = extractelement <4 x float> %2, i64 3
  %56 = fcmp fast ogt float %55, 0.000000e+00
  %57 = select i1 %54, i1 %56, i1 false
  %58 = fdiv fast float %3, %55
  %59 = select reassoc nsz arcp contract afn i1 %57, float %58, float %3
  %60 = shufflevector <4 x float> %0, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %61 = fdiv fast <2 x float> %44, %31
  %62 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %60) #6
  %63 = tail call fast fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %62, <2 x float> noundef %61, <4 x float> noundef %53, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, %struct._texture_2d_t addrspace(1)* %8, %struct._texture_2d_t addrspace(1)* %9) #8
  %64 = tail call fast <4 x half> @air.convert.f.v4f16.f.v4f32(<4 x float> %63) #6
  %65 = tail call fast <4 x half> @air.convert.f.v4f16.f.v4f32(<4 x float> %53) #6
  %66 = insertelement <4 x i1> poison, i1 %51, i64 0
  %67 = shufflevector <4 x i1> %66, <4 x i1> poison, <4 x i32> zeroinitializer
  %68 = select fast <4 x i1> %67, <4 x half> %65, <4 x half> %64
  %69 = insertvalue <{ <4 x half>, float }> undef, <4 x half> %68, 0
  %70 = insertvalue <{ <4 x half>, float }> %69, float %59, 1
  ret <{ <4 x half>, float }> %70
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
