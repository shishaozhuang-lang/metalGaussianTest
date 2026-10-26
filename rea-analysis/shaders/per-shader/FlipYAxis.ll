define void @FlipYAxis(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, %struct._texture_2d_t addrspace(1)* %1, <2 x i32> noundef %2) local_unnamed_addr #0 {
  %4 = tail call { <4 x float>, i8 } @air.read_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, <2 x i32> %2, i32 0, i32 1) #3, !alias.scope !21
  %5 = extractvalue { <4 x float>, i8 } %4, 0
  %6 = tail call i32 @air.get_height_texture_2d(%struct._texture_2d_t addrspace(1)* nocapture readonly %0, i32 0) #3, !alias.scope !21
  %7 = extractelement <2 x i32> %2, i64 1
  %8 = xor i32 %7, -1
  %9 = add i32 %6, %8
  %10 = insertelement <2 x i32> %2, i32 %9, i64 1
  tail call void @air.write_texture_2d.v4f32(%struct._texture_2d_t addrspace(1)* nocapture %1, <2 x i32> %10, <4 x float> %5, i32 0, i32 2) #4, !alias.scope !21
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
