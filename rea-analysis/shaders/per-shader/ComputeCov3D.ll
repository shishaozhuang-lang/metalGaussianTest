define void @ComputeCov3D(<3 x float> %0, <4 x float> %1, float addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %3, float addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %4, float addrspace(1)* nocapture noundef writeonly "air-buffer-no-alias" %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = mul i32 %6, 6
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %4, i64 %9
  %11 = load i32, i32 addrspace(2)* %3, align 4, !tbaa !25, !alias.scope !29, !noalias !32
  %12 = load float, float addrspace(2)* %2, align 4, !tbaa !36, !alias.scope !38, !noalias !39
  %13 = zext i32 %6 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  tail call fastcc void @_Z12ComputeCov3DDv3_fN9apple3dgs14ActivationTypeEfDv4_fPU9MTLdevicefS4_(<3 x float> noundef %0, i32 noundef %11, float noundef %12, <4 x float> noundef %1, float addrspace(1)* noundef %10, float addrspace(1)* noundef %14) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
