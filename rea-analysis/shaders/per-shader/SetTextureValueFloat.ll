define weak_odr void @SetTextureValueFloat(%struct._texture_2d_t addrspace(1)* %0, <4 x float> addrspace(2)* noundef align 16 dereferenceable(16) "air-buffer-no-alias" %1, <2 x i32> noundef %2) local_unnamed_addr #0 {
  %4 = load <4 x float>, <4 x float> addrspace(2)* %1, align 16, !tbaa !21, !alias.scope !24, !noalias !27
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %0, <2 x i32> %2, <4 x float> %4, i32 0, i32 2) #2, !alias.scope !27, !noalias !24
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
