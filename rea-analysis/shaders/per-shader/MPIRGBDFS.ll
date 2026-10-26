define <{ <4 x half>, <4 x half> }> @MPIRGBDFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* %3, %struct._texture_2d_array_t addrspace(1)* %4, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %5) local_unnamed_addr #0 {
  %7 = tail call i32 @air.get_width_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, i32 0) #4, !alias.scope !27, !noalias !30
  %8 = tail call i32 @air.get_height_texture_2d_array(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, i32 0) #4, !alias.scope !27, !noalias !30
  %9 = icmp eq i32 %7, %8
  %10 = load float, float addrspace(2)* %5, align 4, !tbaa !32
  br i1 %9, label %11, label %24

11:                                               ; preds = %6
  %12 = fcmp fast ogt float %10, 1.000000e+00
  %13 = tail call fast float @air.convert.f.f32.u.i32(i32 %7) #5
  br i1 %12, label %14, label %19

14:                                               ; preds = %11
  %15 = fdiv fast float %13, %10
  %16 = fsub fast float %13, %15
  %17 = fmul fast float %16, 5.000000e-01
  %18 = fdiv fast float %17, %13
  br label %24

19:                                               ; preds = %11
  %20 = fmul fast float %13, %10
  %21 = fsub fast float %13, %20
  %22 = fmul fast float %21, 5.000000e-01
  %23 = fdiv fast float %22, %13
  br label %24

24:                                               ; preds = %19, %14, %6
  %25 = phi float [ %18, %14 ], [ %23, %19 ], [ 0.000000e+00, %6 ]
  %26 = fmul fast float %25, 2.000000e+00
  %27 = fsub fast float 1.000000e+00, %26
  %28 = fcmp fast ogt float %10, 1.000000e+00
  br i1 %28, label %29, label %34

29:                                               ; preds = %24
  %30 = extractelement <2 x float> %1, i64 1
  %31 = fmul fast float %27, %30
  %32 = fadd fast float %31, %25
  %33 = insertelement <2 x float> %1, float %32, i64 1
  br label %39

34:                                               ; preds = %24
  %35 = extractelement <2 x float> %1, i64 0
  %36 = fmul fast float %27, %35
  %37 = fadd fast float %36, %25
  %38 = insertelement <2 x float> %1, float %37, i64 0
  br label %39

39:                                               ; preds = %34, %29
  %40 = phi <2 x float> [ %33, %29 ], [ %38, %34 ]
  %41 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %40, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %42 = extractvalue { <4 x half>, i8 } %41, 0
  %43 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %4, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %40, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %44 = extractvalue { <4 x half>, i8 } %43, 0
  %45 = shufflevector <4 x half> %44, <4 x half> <half poison, half 0xH0000, half 0xH0000, half poison>, <4 x i32> <i32 0, i32 5, i32 6, i32 undef>
  %46 = shufflevector <4 x half> %45, <4 x half> %42, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %47 = insertvalue <{ <4 x half>, <4 x half> }> undef, <4 x half> %42, 0
  %48 = insertvalue <{ <4 x half>, <4 x half> }> %47, <4 x half> %46, 1
  ret <{ <4 x half>, <4 x half> }> %48
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
