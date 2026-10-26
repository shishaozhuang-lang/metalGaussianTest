define internal void @_GLOBAL__sub_I_GSRenderer.metal() #0 section "air.static_init" {
  %1 = load i32, i32 addrspace(2)* @_Z18kSplattingShDegree.MTL_FC_INIT_5_j, align 4, !tbaa !44
  %2 = icmp ne i32 %1, 0
  %3 = zext i1 %2 to i8
  store i8 %3, i8 addrspace(2)* @_ZL6kUseC1, align 1, !tbaa !48
  %4 = icmp ugt i32 %1, 1
  %5 = zext i1 %4 to i8
  store i8 %5, i8 addrspace(2)* @_ZL6kUseC2, align 1, !tbaa !48
  %6 = icmp ugt i32 %1, 2
  %7 = zext i1 %6 to i8
  store i8 %7, i8 addrspace(2)* @_ZL6kUseC3, align 1, !tbaa !48
  ret void
}

; Function Attrs: convergent mustprogress nounwind
