define <{ <4 x half>, float }> @PostAlphaBlendFS(%"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* nocapture noundef readonly align 4 dereferenceable(8) "air-buffer-no-alias" %0, <4 x half> noundef %1, float noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %0, i64 0, i32 0
  %5 = load i32, i32 addrspace(2)* %4, align 4, !tbaa !24, !alias.scope !30
  %6 = shufflevector <4 x half> %1, <4 x half> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %7 = icmp eq i32 %5, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %3
  %9 = fcmp fast ole <3 x half> %6, <half 0xH292D, half 0xH292D, half 0xH292D>
  %10 = fmul fast <3 x half> %6, <half 0xH2CF4, half 0xH2CF4, half 0xH2CF4>
  %11 = fadd fast <3 x half> %6, <half 0xH2B0A, half 0xH2B0A, half 0xH2B0A>
  %12 = fmul fast <3 x half> %11, <half 0xH3B96, half 0xH3B96, half 0xH3B96>
  %13 = tail call fast <3 x half> @air.powr.v3f16(<3 x half> %12, <3 x half> <half 0xH40CD, half 0xH40CD, half 0xH40CD>) #2
  %14 = select fast <3 x i1> %9, <3 x half> %10, <3 x half> %13
  br label %15

15:                                               ; preds = %8, %3
  %16 = phi fast <3 x half> [ %14, %8 ], [ %6, %3 ]
  %17 = shufflevector <3 x half> %16, <3 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %18 = shufflevector <4 x half> %17, <4 x half> %1, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %19 = extractelement <4 x half> %1, i64 3
  %20 = fpext half %19 to float
  %21 = getelementptr inbounds %"struct.apple3dgs::DeferredUniformsFS", %"struct.apple3dgs::DeferredUniformsFS" addrspace(2)* %0, i64 0, i32 1
  %22 = load i32, i32 addrspace(2)* %21, align 4, !tbaa !33, !alias.scope !30
  %23 = fdiv fast float %2, %20
  %24 = icmp eq i32 %22, 0
  %25 = fcmp fast ogt half %19, 0xH0000
  %26 = select i1 %24, i1 %25, i1 false
  %27 = select reassoc nsz arcp contract afn i1 %26, float %23, float %2
  %28 = insertvalue <{ <4 x half>, float }> undef, <4 x half> %18, 0
  %29 = insertvalue <{ <4 x half>, float }> %28, float %27, 1
  ret <{ <4 x half>, float }> %29
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
