define weak_odr void @UpscaleHalf([3 x half] addrspace(1)* noundef "air-buffer-no-alias" %0, %struct._texture_2d_t addrspace(1)* %1, <2 x i32> addrspace(2)* noundef align 8 dereferenceable(8) "air-buffer-no-alias" %2, <2 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @air.get_width_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %6 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %1, i32 0) #4, !alias.scope !22, !noalias !25
  %7 = extractelement <2 x i32> %3, i64 0
  %8 = icmp ult i32 %7, %5
  %9 = extractelement <2 x i32> %3, i64 1
  %10 = icmp ult i32 %9, %6
  %11 = select i1 %8, i1 %10, i1 false
  br i1 %11, label %12, label %41

12:                                               ; preds = %4
  %13 = insertelement <2 x i32> undef, i32 %5, i64 0
  %14 = insertelement <2 x i32> %13, i32 %6, i64 1
  %15 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %3) #5
  %16 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %14) #5
  %17 = load <2 x i32>, <2 x i32> addrspace(2)* %2, align 8, !tbaa !28, !alias.scope !31, !noalias !32
  %18 = tail call fast <2 x float> @air.convert.f.v2f32.u.v2i32(<2 x i32> %17) #5
  %19 = fmul fast <2 x float> %18, %15
  %20 = fdiv fast <2 x float> %19, %16
  %21 = tail call <2 x i32> @air.convert.u.v2i32.f.v2f32(<2 x float> %20) #5
  %22 = extractelement <2 x i32> %21, i64 1
  %23 = extractelement <2 x i32> %17, i64 0
  %24 = mul i32 %22, %23
  %25 = extractelement <2 x i32> %21, i64 0
  %26 = add i32 %24, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 0
  %29 = load half, half addrspace(1)* %28, align 2, !alias.scope !33, !noalias !34
  %30 = insertelement <3 x half> undef, half %29, i64 0
  %31 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 1
  %32 = load half, half addrspace(1)* %31, align 2, !alias.scope !33, !noalias !34
  %33 = insertelement <3 x half> %30, half %32, i64 1
  %34 = getelementptr inbounds [3 x half], [3 x half] addrspace(1)* %0, i64 %27, i64 2
  %35 = load half, half addrspace(1)* %34, align 2, !alias.scope !33, !noalias !34
  %36 = insertelement <3 x half> %33, half %35, i64 2
  %37 = tail call fast <3 x half> @air.clamp.v3f16(<3 x half> %36, <3 x half> zeroinitializer, <3 x half> <half 0xH3C00, half 0xH3C00, half 0xH3C00>) #5
  %38 = tail call fast <3 x float> @air.convert.f.v3f32.f.v3f16(<3 x half> %37) #5
  %39 = shufflevector <3 x float> %38, <3 x float> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %40 = insertelement <4 x float> %39, float 1.000000e+00, i64 3
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %3, <4 x float> %40, i32 0, i32 2) #6, !alias.scope !22, !noalias !25
  br label %41

41:                                               ; preds = %12, %4
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
