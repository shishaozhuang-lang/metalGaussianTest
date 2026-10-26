define void @MPIRefineFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* %3, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %8, %"struct.metal::matrix.38" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(48) "air-buffer-no-alias" %9) local_unnamed_addr #0 {
  %11 = load i32, i32 addrspace(2)* %8, align 4, !tbaa !29, !alias.scope !33, !noalias !36
  %12 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #6, !alias.scope !39, !noalias !40
  %13 = tail call fast float @air.convert.f.f32.u.i32(i32 %12) #7
  %14 = insertelement <2 x float> undef, float %13, i64 0
  %15 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #6, !alias.scope !39, !noalias !40
  %16 = tail call fast float @air.convert.f.f32.u.i32(i32 %15) #7
  %17 = insertelement <2 x float> %14, float %16, i64 1
  %18 = fmul fast <2 x float> %17, %1
  %19 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6, !alias.scope !39, !noalias !40
  %20 = tail call fast float @air.convert.f.f32.u.i32(i32 %19) #7
  %21 = insertelement <2 x float> undef, float %20, i64 0
  %22 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #6, !alias.scope !39, !noalias !40
  %23 = tail call fast float @air.convert.f.f32.u.i32(i32 %22) #7
  %24 = insertelement <2 x float> %21, float %23, i64 1
  %25 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 0
  %26 = load <3 x float>, <3 x float> addrspace(2)* %25, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %27 = shufflevector <2 x float> %18, <2 x float> undef, <3 x i32> <i32 0, i32 0, i32 undef>
  %28 = fmul fast <3 x float> %26, %27
  %29 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 1
  %30 = load <3 x float>, <3 x float> addrspace(2)* %29, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %31 = shufflevector <2 x float> %18, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 undef>
  %32 = fmul fast <3 x float> %30, %31
  %33 = fadd fast <3 x float> %32, %28
  %34 = getelementptr inbounds %"struct.metal::matrix.38", %"struct.metal::matrix.38" addrspace(2)* %9, i64 0, i32 0, i64 2
  %35 = load <3 x float>, <3 x float> addrspace(2)* %34, align 16, !tbaa !41, !alias.scope !42, !noalias !43
  %36 = fadd fast <3 x float> %33, %35
  %37 = shufflevector <3 x float> %36, <3 x float> poison, <2 x i32> <i32 0, i32 1>
  %38 = fcmp fast olt <2 x float> %37, zeroinitializer
  %39 = tail call i1 @air.any.v2i1(<2 x i1> %38) #7
  br i1 %39, label %43, label %40

40:                                               ; preds = %10
  %41 = fcmp fast oge <2 x float> %37, %24
  %42 = tail call i1 @air.any.v2i1(<2 x i1> %41) #7
  br label %43

43:                                               ; preds = %40, %10
  %44 = phi i1 [ true, %10 ], [ %42, %40 ]
  %45 = xor i32 %2, -1
  %46 = add i32 %11, %45
  %47 = fdiv fast <2 x float> %37, %24
  %48 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %18) #7
  %49 = tail call { <4 x float>, i8 } @air.read_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, <2 x i32> %48, i32 %46, i32 0, i32 3) #6, !alias.scope !39, !noalias !40
  %50 = extractvalue { <4 x float>, i8 } %49, 0
  %51 = tail call fast fastcc <4 x float> @_Z9RefineMPIDv2_jDv2_fDv4_fN5metal9texture2dIfLNS2_6accessE0ELNS2_16memory_coherenceE0EvEENS3_IfLS4_3ELS5_0EvEES6_S6_(<2 x i32> noundef %48, <2 x float> noundef %47, <4 x float> noundef %50, %struct._texture_2d_t addrspace(1)* %4, %struct._texture_2d_t addrspace(1)* %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7) #8
  %52 = insertelement <4 x i1> poison, i1 %44, i64 0
  %53 = shufflevector <4 x i1> %52, <4 x i1> poison, <4 x i32> zeroinitializer
  %54 = select reassoc nsz arcp contract afn <4 x i1> %53, <4 x float> %50, <4 x float> %51
  tail call void @air.write_texture_2d_array.v4f32(%struct._texture_2d_array_t addrspace(1)* nocapture %3, <2 x i32> %48, i32 %46, <4 x float> %54, i32 0, i32 3) #9, !alias.scope !39, !noalias !40
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
