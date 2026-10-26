define void @NDCDepthToRealDepth(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, %struct._texture_2d_t addrspace(1)* %1, %"struct.metal::matrix.1" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(64) "air-buffer-no-alias" %2, <3 x i32> noundef %3) local_unnamed_addr #0 {
  %5 = shufflevector <3 x i32> %3, <3 x i32> poison, <2 x i32> <i32 0, i32 1>
  %6 = tail call { float, i8 } @air.read_depth_2d.f32(%struct._depth_2d_t addrspace(1)* nocapture readonly %0, i32 1, <2 x i32> %5, i32 0, i32 1) #3, !alias.scope !22, !noalias !25
  %7 = extractvalue { float, i8 } %6, 0
  %8 = fcmp fast ogt float %7, 0.000000e+00
  br i1 %8, label %9, label %18

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %2, i64 0, i32 0, i64 3
  %11 = load <4 x float>, <4 x float> addrspace(2)* %10, align 16, !tbaa !27, !alias.scope !25, !noalias !22
  %12 = extractelement <4 x float> %11, i64 2
  %13 = getelementptr inbounds %"struct.metal::matrix.1", %"struct.metal::matrix.1" addrspace(2)* %2, i64 0, i32 0, i64 2
  %14 = load <4 x float>, <4 x float> addrspace(2)* %13, align 16, !tbaa !27, !alias.scope !25, !noalias !22
  %15 = extractelement <4 x float> %14, i64 2
  %16 = fsub fast float %7, %15
  %17 = fdiv fast float %12, %16
  br label %18

18:                                               ; preds = %9, %4
  %19 = phi fast float [ %17, %9 ], [ 0.000000e+00, %4 ]
  %20 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 1.000000e+00>, float %19, i64 0
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %5, <4 x float> %20, i32 0, i32 2) #4, !alias.scope !22, !noalias !25
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
