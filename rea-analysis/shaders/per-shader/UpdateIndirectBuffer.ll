define void @UpdateIndirectBuffer(i32 addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %0, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %1, i32 addrspace(2)* nocapture noundef readonly align 4 dereferenceable(4) "air-buffer-no-alias" %2, %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* nocapture noundef writeonly align 4 dereferenceable(16) "air-buffer-no-alias" %3) local_unnamed_addr #0 {
  %5 = load i32, i32 addrspace(2)* %1, align 4, !tbaa !23, !alias.scope !27, !noalias !30
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 0
  store i32 %5, i32 addrspace(1)* %8, align 4, !tbaa !34, !alias.scope !36, !noalias !37
  br label %9

9:                                                ; preds = %7, %4
  %10 = load i32, i32 addrspace(2)* %2, align 4, !tbaa !23, !alias.scope !38, !noalias !39
  %11 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 2
  store i32 %10, i32 addrspace(1)* %11, align 4, !tbaa !40, !alias.scope !36, !noalias !37
  %12 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !23, !alias.scope !41, !noalias !42
  %13 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 3
  store i32 %12, i32 addrspace(1)* %13, align 4, !tbaa !43, !alias.scope !36, !noalias !37
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 1
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !23, !alias.scope !41, !noalias !42
  %16 = sub i32 1, %12
  %17 = add i32 %16, %15
  %18 = tail call i32 @air.abs.u.i32(i32 %17) #2
  %19 = getelementptr inbounds %"struct.metal::MTLDrawPrimitivesIndirectArguments", %"struct.metal::MTLDrawPrimitivesIndirectArguments" addrspace(1)* %3, i64 0, i32 1
  store i32 %18, i32 addrspace(1)* %19, align 4, !tbaa !44, !alias.scope !36, !noalias !37
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
