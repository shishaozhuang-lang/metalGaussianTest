define <{ <4 x float>, <2 x float>, i32 }> @MPIVS(<2 x float> addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, %"struct.metal::matrix.1" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds <2 x float>, <2 x float> addrspace(1)* %0, i64 %6
  %8 = load <2 x float>, <2 x float> addrspace(1)* %7, align 8, !tbaa !26, !alias.scope !29, !noalias !32
  %9 = fmul fast <2 x float> %8, <float 2.000000e+00, float 2.000000e+00>
  %10 = fadd fast <2 x float> %9, <float -1.000000e+00, float -1.000000e+00>
  %11 = tail call fast float @air.convert.f.f32.u.i32(i32 %3) #2
  %12 = fadd fast float %11, 5.000000e-01
  %13 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !35, !alias.scope !37, !noalias !38
  %14 = tail call fast float @air.convert.f.f32.u.i32(i32 %13) #2
  %15 = fdiv fast float %12, %14
  %16 = extractelement <2 x float> %10, i64 0
  %17 = fadd fast float %16, 1.000000e+00
  %18 = fmul fast float %17, 5.000000e-01
  %19 = insertelement <2 x float> undef, float %18, i64 0
  %20 = extractelement <2 x float> %10, i64 1
  %21 = fsub fast float 1.000000e+00, %20
  %22 = fmul fast float %21, 5.000000e-01
  %23 = insertelement <2 x float> %19, float %22, i64 1
  %24 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 0
  %25 = load <4 x float>, <4 x float> addrspace(2)* %24, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %26 = shufflevector <2 x float> %10, <2 x float> undef, <4 x i32> zeroinitializer
  %27 = fmul fast <4 x float> %25, %26
  %28 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 1
  %29 = load <4 x float>, <4 x float> addrspace(2)* %28, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %30 = shufflevector <2 x float> %10, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %31 = fmul fast <4 x float> %29, %30
  %32 = fadd fast <4 x float> %31, %27
  %33 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 2
  %34 = load <4 x float>, <4 x float> addrspace(2)* %33, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %35 = insertelement <4 x float> poison, float %15, i64 0
  %36 = shufflevector <4 x float> %35, <4 x float> poison, <4 x i32> zeroinitializer
  %37 = fmul fast <4 x float> %34, %36
  %38 = fadd fast <4 x float> %32, %37
  %39 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %1, i64 0, i32 0, i64 3
  %40 = load <4 x float>, <4 x float> addrspace(2)* %39, align 16, !tbaa !26, !alias.scope !39, !noalias !40
  %41 = fadd fast <4 x float> %38, %40
  %42 = insertvalue <{ <4 x float>, <2 x float>, i32 }> undef, <4 x float> %41, 0
  %43 = insertvalue <{ <4 x float>, <2 x float>, i32 }> %42, <2 x float> %23, 1
  %44 = insertvalue <{ <4 x float>, <2 x float>, i32 }> %43, i32 %3, 2
  ret <{ <4 x float>, <2 x float>, i32 }> %44
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
