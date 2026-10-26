define void @PrecomputeDistanceAndColor(half %0, <3 x half> %1, <3 x half> %2, <3 x half> %3, <3 x half> %4, <3 x half> %5, <3 x half> %6, <3 x half> %7, <3 x half> %8, <3 x half> %9, <3 x half> %10, <3 x half> %11, <3 x half> %12, <3 x half> %13, <3 x half> %14, <3 x half> %15, <3 x half> %16, [3 x float] addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %17, float addrspace(1)* nocapture noundef readonly "air-buffer-no-alias" %18, %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* nocapture noundef readonly align 16 dereferenceable(260) "air-buffer-no-alias" %19, float addrspace(1)* nocapture noundef "air-buffer-no-alias" %20, %struct._texture_buffer_1d_t addrspace(1)* %21, i32 noundef %22) local_unnamed_addr #1 {
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 0
  %26 = load float, float addrspace(1)* %25, align 4, !alias.scope !50, !noalias !53
  %27 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 1
  %28 = load float, float addrspace(1)* %27, align 4, !alias.scope !50, !noalias !53
  %29 = getelementptr inbounds [3 x float], [3 x float] addrspace(1)* %17, i64 %24, i64 2
  %30 = load float, float addrspace(1)* %29, align 4, !alias.scope !50, !noalias !53
  %31 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 0
  %32 = load <4 x float>, <4 x float> addrspace(2)* %31, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %33 = insertelement <4 x float> poison, float %26, i64 0
  %34 = shufflevector <4 x float> %33, <4 x float> poison, <4 x i32> zeroinitializer
  %35 = fmul fast <4 x float> %32, %34
  %36 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 1
  %37 = load <4 x float>, <4 x float> addrspace(2)* %36, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %38 = insertelement <4 x float> poison, float %28, i64 0
  %39 = shufflevector <4 x float> %38, <4 x float> poison, <4 x i32> zeroinitializer
  %40 = fmul fast <4 x float> %37, %39
  %41 = fadd fast <4 x float> %40, %35
  %42 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 2
  %43 = load <4 x float>, <4 x float> addrspace(2)* %42, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %44 = insertelement <4 x float> poison, float %30, i64 0
  %45 = shufflevector <4 x float> %44, <4 x float> poison, <4 x i32> zeroinitializer
  %46 = fmul fast <4 x float> %43, %45
  %47 = fadd fast <4 x float> %41, %46
  %48 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 0, i32 0, i64 3
  %49 = load <4 x float>, <4 x float> addrspace(2)* %48, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %50 = fadd fast <4 x float> %47, %49
  %51 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 5
  %52 = load i32, i32 addrspace(2)* %51, align 4, !tbaa !61, !alias.scope !59, !noalias !60
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %70, label %54

54:                                               ; preds = %23
  %55 = getelementptr inbounds float, float addrspace(1)* %18, i64 %24
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !69, !alias.scope !71, !noalias !72
  br label %60

57:                                               ; preds = %60
  %58 = add nuw nsw i32 %61, 1
  %59 = icmp eq i32 %58, 5
  br i1 %59, label %70, label %60, !llvm.loop !73

60:                                               ; preds = %57, %54
  %61 = phi i32 [ 0, %54 ], [ %58, %57 ]
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 2, i32 0, i64 %62
  %64 = load <4 x float>, <4 x float> addrspace(2)* %63, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %65 = tail call fast float @air.dot.v4f32(<4 x float> %50, <4 x float> %64) #5
  %66 = fadd fast float %65, %56
  %67 = fcmp fast olt float %66, 0.000000e+00
  br i1 %67, label %68, label %57

68:                                               ; preds = %60
  %69 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float 0x7FF8000000000000, float addrspace(1)* %69, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %125

70:                                               ; preds = %57, %23
  %71 = insertelement <3 x float> undef, float %26, i64 0
  %72 = insertelement <3 x float> %71, float %28, i64 1
  %73 = insertelement <3 x float> %72, float %30, i64 2
  %74 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 3
  %75 = load <3 x float>, <3 x float> addrspace(2)* %74, align 16, !tbaa !58, !alias.scope !59, !noalias !60
  %76 = insertvalue %struct.Coeff1Attribute poison, <3 x half> %2, 0
  %77 = insertvalue %struct.Coeff1Attribute %76, <3 x half> %3, 1
  %78 = insertvalue %struct.Coeff1Attribute %77, <3 x half> %4, 2
  %79 = insertvalue %struct.Coeff2Attribute poison, <3 x half> %5, 0
  %80 = insertvalue %struct.Coeff2Attribute %79, <3 x half> %6, 1
  %81 = insertvalue %struct.Coeff2Attribute %80, <3 x half> %7, 2
  %82 = insertvalue %struct.Coeff2Attribute %81, <3 x half> %8, 3
  %83 = insertvalue %struct.Coeff2Attribute %82, <3 x half> %9, 4
  %84 = insertvalue %struct.Coeff3Attribute poison, <3 x half> %10, 0
  %85 = insertvalue %struct.Coeff3Attribute %84, <3 x half> %11, 1
  %86 = insertvalue %struct.Coeff3Attribute %85, <3 x half> %12, 2
  %87 = insertvalue %struct.Coeff3Attribute %86, <3 x half> %13, 3
  %88 = insertvalue %struct.Coeff3Attribute %87, <3 x half> %14, 4
  %89 = insertvalue %struct.Coeff3Attribute %88, <3 x half> %15, 5
  %90 = insertvalue %struct.Coeff3Attribute %89, <3 x half> %16, 6
  %91 = tail call fast fastcc <3 x half> @_Z18ComputeColorFromSHIDhEDv3_T_31PrecomputeDistanceAndColorInputDv3_fS3_(half %0, <3 x half> %1, %struct.Coeff1Attribute %78, %struct.Coeff2Attribute %83, %struct.Coeff3Attribute %90, <3 x float> noundef %73, <3 x float> noundef %75) #6
  %92 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 4
  %93 = load i32, i32 addrspace(2)* %92, align 16, !tbaa !77, !alias.scope !59, !noalias !60
  switch i32 %93, label %103 [
    i32 0, label %94
    i32 1, label %98
  ]

94:                                               ; preds = %70
  %95 = extractelement <4 x float> %50, i64 2
  %96 = tail call fast float @air.fast_fabs.f32(float %95) #5
  %97 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float %96, float addrspace(1)* %97, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %103

98:                                               ; preds = %70
  %99 = shufflevector <4 x float> %50, <4 x float> poison, <3 x i32> <i32 0, i32 1, i32 2>
  %100 = tail call fast float @air.dot.v3f32(<3 x float> %99, <3 x float> %99) #5
  %101 = tail call fast float @air.fast_sqrt.f32(float %100) #5
  %102 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float %101, float addrspace(1)* %102, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %103

103:                                              ; preds = %98, %94, %70
  %104 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 8
  %105 = load i32, i32 addrspace(2)* %104, align 16, !tbaa !78, !alias.scope !59, !noalias !60
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %111

107:                                              ; preds = %103
  %108 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  %110 = fdiv fast float 1.000000e+00, %109
  store float %110, float addrspace(1)* %108, align 4, !tbaa !69, !alias.scope !75, !noalias !76
  br label %111

111:                                              ; preds = %107, %103
  %112 = getelementptr inbounds %"struct.apple3dgs::PreComputeDistanceUniforms", %"struct.apple3dgs::PreComputeDistanceUniforms" addrspace(2)* %19, i64 0, i32 7
  %113 = load i32, i32 addrspace(2)* %112, align 4, !tbaa !79, !alias.scope !59, !noalias !60
  switch i32 %113, label %121 [
    i32 2, label %116
    i32 1, label %114
  ]

114:                                              ; preds = %111
  %115 = tail call fast half @air.exp.f16(half %0) #5
  br label %121

116:                                              ; preds = %111
  %117 = fneg fast half %0
  %118 = tail call fast half @air.exp.f16(half %117) #5
  %119 = fadd fast half %118, 0xH3C00
  %120 = fdiv fast half 0xH3C00, %119
  br label %121

121:                                              ; preds = %116, %114, %111
  %122 = phi half [ %120, %116 ], [ %115, %114 ], [ %0, %111 ]
  %123 = shufflevector <3 x half> %91, <3 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %124 = insertelement <4 x half> %123, half %122, i64 3
  tail call void @air.write_texture_buffer_1d.v4f16(%struct._texture_buffer_1d_t addrspace(1)* nocapture %21, i32 %22, <4 x half> %124, i32 2) #7, !alias.scope !80, !noalias !81
  br label %125

125:                                              ; preds = %121, %68
  ret void
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
