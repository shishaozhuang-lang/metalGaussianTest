define void @UpscaleTexture(<2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %0, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %1, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %2, <2 x i32> addrspace(2)* nocapture noundef readonly align 8 dereferenceable(8) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %5, %struct._texture_2d_t addrspace(1)* %6, %struct._texture_2d_t addrspace(1)* %7, <2 x i32> noundef %8) local_unnamed_addr #0 {
  %10 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #5, !alias.scope !28, !noalias !31
  %11 = insertelement <2 x i32> undef, i32 %10, i64 0
  %12 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, i32 0) #5, !alias.scope !28, !noalias !31
  %13 = insertelement <2 x i32> %11, i32 %12, i64 1
  %14 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #5, !alias.scope !28, !noalias !31
  %15 = extractelement <2 x i32> %8, i64 0
  %16 = icmp ult i32 %15, %14
  br i1 %16, label %17, label %61

17:                                               ; preds = %9
  %18 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %7, i32 0) #5, !alias.scope !28, !noalias !31
  %19 = extractelement <2 x i32> %8, i64 1
  %20 = icmp ult i32 %19, %18
  br i1 %20, label %21, label %61

21:                                               ; preds = %17
  %22 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !alias.scope !38, !noalias !39
  %23 = extractelement <2 x i32> %22, i64 0
  %24 = icmp ult i32 %15, %23
  br i1 %24, label %35, label %25

25:                                               ; preds = %21
  %26 = load <2 x i32>, <2 x i32> addrspace(2)* %3, align 8, !alias.scope !40, !noalias !41
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = icmp ult i32 %15, %27
  %29 = extractelement <2 x i32> %22, i64 1
  %30 = icmp uge i32 %19, %29
  %31 = select i1 %28, i1 %30, i1 false
  %32 = extractelement <2 x i32> %26, i64 1
  %33 = icmp ult i32 %19, %32
  %34 = select i1 %31, i1 %33, i1 false
  br i1 %34, label %39, label %35

35:                                               ; preds = %25, %21
  %36 = load float, float addrspace(2)* %4, align 4, !tbaa !42, !alias.scope !46, !noalias !47
  %37 = insertelement <4 x float> poison, float %36, i64 0
  %38 = shufflevector <4 x float> %37, <4 x float> poison, <4 x i32> zeroinitializer
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %7, <2 x i32> %8, <4 x float> %38, i32 0, i32 2) #6, !alias.scope !28, !noalias !31
  br label %61

39:                                               ; preds = %25
  %40 = sub <2 x i32> %8, %22
  %41 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %40) #7
  %42 = fadd fast <2 x float> %41, <float 5.000000e-01, float 5.000000e-01>
  %43 = sub <2 x i32> %26, %22
  %44 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %43) #7
  %45 = load <2 x i32>, <2 x i32> addrspace(2)* %1, align 8, !tbaa !48, !alias.scope !49, !noalias !50
  %46 = load <2 x i32>, <2 x i32> addrspace(2)* %0, align 8, !tbaa !48, !alias.scope !51, !noalias !52
  %47 = sub <2 x i32> %45, %46
  %48 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %47) #7
  %49 = fmul fast <2 x float> %48, %42
  %50 = fdiv fast <2 x float> %49, %44
  %51 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %46) #7
  %52 = fadd fast <2 x float> %50, %51
  %53 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %13) #7
  %54 = fdiv fast <2 x float> %52, %53
  %55 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %6, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state to %struct._sampler_t addrspace(2)*), <2 x float> %54, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #8
  %56 = extractvalue { <4 x float>, i8 } %55, 0
  %57 = load float, float addrspace(2)* %5, align 4, !tbaa !42, !alias.scope !53, !noalias !54
  %58 = insertelement <4 x float> poison, float %57, i64 0
  %59 = shufflevector <4 x float> %58, <4 x float> poison, <4 x i32> zeroinitializer
  %60 = fmul fast <4 x float> %59, %56
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %7, <2 x i32> %8, <4 x float> %60, i32 0, i32 2) #6, !alias.scope !28, !noalias !31
  br label %61

61:                                               ; preds = %39, %35, %17, %9
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
