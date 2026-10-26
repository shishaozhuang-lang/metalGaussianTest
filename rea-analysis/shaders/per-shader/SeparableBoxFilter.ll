define void @SeparableBoxFilter(%struct._texture_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, <2 x i32> noundef %5) local_unnamed_addr #0 {
  %7 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %5) #4
  %8 = fadd fast <2 x float> %7, <float 5.000000e-01, float 5.000000e-01>
  %9 = load float, float addrspace(2)* %4, align 4, !tbaa !25, !alias.scope !29, !noalias !32
  %10 = insertelement <4 x float> poison, float %9, i64 0
  %11 = shufflevector <4 x float> %10, <4 x float> poison, <4 x i32> zeroinitializer
  %12 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %6
  %15 = sub nsw i32 0, %12
  %16 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !36, !alias.scope !40, !noalias !41
  br label %25

17:                                               ; preds = %25, %6
  %18 = phi <4 x float> [ %11, %6 ], [ %32, %25 ]
  %19 = shl nsw i32 %12, 1
  %20 = or i32 %19, 1
  %21 = tail call fast float @air.convert.f.f32.s.i32(i32 %20) #4
  %22 = insertelement <4 x float> poison, float %21, i64 0
  %23 = shufflevector <4 x float> %22, <4 x float> poison, <4 x i32> zeroinitializer
  %24 = fdiv fast <4 x float> %18, %23
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %24, i32 0, i32 2) #5, !alias.scope !42, !noalias !43
  ret void

25:                                               ; preds = %25, %14
  %26 = phi <4 x float> [ %11, %14 ], [ %32, %25 ]
  %27 = phi i32 [ %15, %14 ], [ %33, %25 ]
  %28 = phi <2 x i32> [ zeroinitializer, %14 ], [ %29, %25 ]
  %29 = insertelement <2 x i32> %28, i32 %27, i32 %16
  %30 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.10 to %struct._sampler_t addrspace(2)*), <2 x float> %8, i1 true, <2 x i32> %29, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %31 = extractvalue { <4 x float>, i8 } %30, 0
  %32 = fadd fast <4 x float> %31, %26
  %33 = add i32 %27, 1
  %34 = icmp eq i32 %27, %12
  br i1 %34, label %17, label %25, !llvm.loop !44
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
