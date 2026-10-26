define <4 x half> @RasterPanoFS(<4 x float> %0, <2 x float> %1, %struct._texture_2d_t addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call { <4 x half>, i8 } @air.sample_texture_2d.v4f16(%struct._texture_2d_t addrspace(1)* nocapture readonly %2, %struct._sampler_t addrspace(2)* nocapture readonly bitcast ([2 x i64] addrspace(2)* @__air_sampler_state.3 to %struct._sampler_t addrspace(2)*), <2 x float> %1, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00, float 0.000000e+00, i32 0) #2
  %5 = extractvalue { <4 x half>, i8 } %4, 0
  ret <4 x half> %5
}

; Function Attrs: argmemonly convergent mustprogress nofree nounwind readonly willreturn
