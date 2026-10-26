define <4 x half> @MPIFS(<4 x float> %0, <2 x float> %1, i32 %2, %struct._texture_2d_array_t addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call { <4 x half>, i8 } @air.sample_texture_2d_array.v4f16(%struct._texture_2d_array_t addrspace(1)* nocapture readonly %3, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.1 to %struct._sampler_t addrspace(2)*), <2 x float> %1, i32 %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #2
  %6 = extractvalue { <4 x half>, i8 } %5, 0
  ret <4 x half> %6
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
