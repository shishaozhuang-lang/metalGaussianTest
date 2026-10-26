define void @SeparableMinFilter(%struct._texture_2d_t addrspace(1)* %0, %struct._texture_2d_t addrspace(1)* %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %4, <2 x i32> noundef %5) local_unnamed_addr #0 {
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
  br label %19

17:                                               ; preds = %19, %6
  %18 = phi <4 x float> [ %11, %6 ], [ %26, %19 ]
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %18, i32 0, i32 2) #5, !alias.scope !42, !noalias !43
  ret void

19:                                               ; preds = %19, %14
  %20 = phi <4 x float> [ %11, %14 ], [ %26, %19 ]
  %21 = phi i32 [ %15, %14 ], [ %27, %19 ]
  %22 = phi <2 x i32> [ zeroinitializer, %14 ], [ %23, %19 ]
  %23 = insertelement <2 x i32> %22, i32 %21, i32 %16
  %24 = tail call { <4 x float>, i8 } @air.sample_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.10 to %struct._sampler_t addrspace(2)*), <2 x float> %8, i1 true, <2 x i32> %23, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #6
  %25 = extractvalue { <4 x float>, i8 } %24, 0
  %26 = tail call fast <4 x float> @air.fast_fmin.v4f32(<4 x float> %20, <4 x float> %25) #4
  %27 = add i32 %21, 1
  %28 = icmp eq i32 %21, %12
  br i1 %28, label %17, label %19, !llvm.loop !44
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
