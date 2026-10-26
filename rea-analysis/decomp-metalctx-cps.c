
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __ZN12MetalContext20computePipelineStateERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEENS0_8optionalIU8__strongP29MTLStageInputOutputDescriptorEENS9_IU8__strongP25MTLFunctionConstantValuesEE
               (undefined8 *param_1,undefined8 *param_2,undefined8 *param_3,undefined8 *param_4)

{
  ulong uVar1;
  undefined8 *puVar2;
  code *pcVar3;
  int iVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  undefined8 extraout_x1;
  undefined8 extraout_x1_00;
  undefined8 extraout_x1_01;
  undefined8 extraout_x1_02;
  undefined8 extraout_x1_03;
  undefined8 extraout_x1_04;
  undefined8 extraout_x1_05;
  undefined8 extraout_x1_06;
  undefined8 extraout_x1_07;
  ulong unaff_x30;
  undefined1 auVar10 [16];
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  byte local_a9;
  undefined8 local_a0;
  undefined8 uStack_98;
  long local_90;
  undefined1 uStack_81;
  undefined8 *local_80;
  long local_78;
  long local_70;
  long local_68;
  
  local_68 = *_DAT_2681a4a70;
  uVar5 = func_0x0002600c4d10();
  if (*(char *)((long)param_2 + 0x17) < '\0') {
    __ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE25__init_copy_ctor_externalEPKcm
              (&local_a0,*param_2,param_2[1]);
  }
  else {
    uStack_98 = param_2[1];
    local_a0 = *param_2;
    local_90 = param_2[2];
  }
  uVar6 = _DAT_2680cf788;
  if (*(char *)(param_3 + 1) == '\x01') {
    func_0x000260004a30(*param_3);
    func_0x000260008d50(uVar6,extraout_x1,&cfstringStruct_276632740);
    uVar6 = func_0x0002600c4d40();
    func_0x0002600c4f50();
    uVar6 = func_0x000260001250(uVar6);
    lVar7 = func_0x0002600cbb40();
    lVar8 = __ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE22__init_internal_bufferB9fqe220106Em
                      (&local_c0,lVar7);
    func_0x0002600c6340(lVar8,uVar6,lVar7);
    *(undefined1 *)(lVar8 + lVar7) = 0;
    uVar1 = CONCAT44(uStack_b4,uStack_b8);
    puVar2 = (undefined8 *)CONCAT44(local_c0._4_4_,(undefined4)local_c0);
    if (-1 < (char)local_a9) {
      uVar1 = (ulong)local_a9;
      puVar2 = &local_c0;
    }
    func_0x0002600d2520(&local_a0,puVar2,uVar1);
    if ((char)local_a9 < '\0') {
      func_0x0002600e3cc0(CONCAT44(local_c0._4_4_,(undefined4)local_c0));
    }
    func_0x0002600c4ea0();
  }
  uVar6 = _DAT_2680cf788;
  if (*(char *)(param_4 + 1) == '\x01') {
    func_0x000260004a30(*param_4);
    func_0x000260008d50(uVar6,extraout_x1_00,&cfstringStruct_276632740);
    uVar6 = func_0x0002600c4d40();
    func_0x0002600c4f50();
    uVar6 = func_0x000260001250(uVar6);
    lVar7 = func_0x0002600cbb40();
    lVar8 = __ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE22__init_internal_bufferB9fqe220106Em
                      (&local_c0,lVar7);
    func_0x0002600c6340(lVar8,uVar6,lVar7);
    *(undefined1 *)(lVar8 + lVar7) = 0;
    uVar1 = CONCAT44(uStack_b4,uStack_b8);
    puVar2 = (undefined8 *)CONCAT44(local_c0._4_4_,(undefined4)local_c0);
    if (-1 < (char)local_a9) {
      uVar1 = (ulong)local_a9;
      puVar2 = &local_c0;
    }
    func_0x0002600d2520(&local_a0,puVar2,uVar1);
    if ((char)local_a9 < '\0') {
      func_0x0002600e3cc0(CONCAT44(local_c0._4_4_,(undefined4)local_c0));
    }
    func_0x0002600c4ea0();
  }
  auVar10 = __ZNSt3__112__hash_tableINS_17__hash_value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_5tupleIJU8__strongPU33objcproto22MTLRenderPipelineState11objc_objectU8__strongPU31objcproto20MTLDepthStencilState11objc_objectEEEEENS_22__unordered_map_hasherIS7_NS_4pairIKS7_SF_EENS_4hashIS7_EENS_8equal_toIS7_EEEENS_21__unordered_map_equalIS7_SK_SO_SM_EENS5_ISK_EEE4findIS7_EENS_15__hash_iteratorIPNS_11__hash_nodeISG_PvEEEERKT_
                      (param_1 + 4,&local_a0);
  if (auVar10._0_8_ == 0) {
    puVar2 = (undefined8 *)*param_2;
    if (-1 < *(char *)((long)param_2 + 0x17)) {
      puVar2 = param_2;
    }
    func_0x000260008d60(_DAT_2680cf788,auVar10._8_8_,puVar2);
    uVar6 = func_0x0002600c4d40();
    auVar10 = func_0x0002600c4cf0(_DAT_2680dbeb0);
    uVar9 = auVar10._0_8_;
    func_0x000260007850(uVar9,auVar10._8_8_,uVar6);
    uVar6 = extraout_x1_01;
    if (*(char *)(param_4 + 1) == '\x01') {
      func_0x00026003d4e0(uVar9,extraout_x1_01,*param_4);
      uVar6 = extraout_x1_02;
    }
    if (param_1[2] != 0) {
      local_70 = param_1[2];
      func_0x0002600033a0(_DAT_2680c2e78,uVar6,&local_70,1);
      auVar10 = func_0x0002600c4d40();
      func_0x00026004a040(uVar9,auVar10._8_8_,auVar10._0_8_);
      func_0x0002600c4ed0();
      uVar6 = extraout_x1_03;
    }
    if (*(char *)(param_1 + 0xe) == '\x01') {
      auVar10 = func_0x00026001bf50(uVar9);
      func_0x00026002ba60(uVar9,auVar10._8_8_,auVar10._0_8_ | 4);
      uVar6 = extraout_x1_04;
    }
    local_c8 = 0;
    uVar6 = func_0x00026003d460(param_1[1],uVar6,uVar9,&local_c8);
    lVar7 = func_0x0002600c5080(local_c8);
    if (lVar7 == 0) {
      auVar10 = func_0x0002600c4cf0(_DAT_2680dbe40);
      uVar9 = auVar10._0_8_;
      func_0x00026003a450(uVar9,auVar10._8_8_,uVar6);
      uVar6 = extraout_x1_05;
      if (*(char *)(param_3 + 1) == '\x01') {
        func_0x00026004a240(uVar9,extraout_x1_05,*param_3);
        uVar6 = extraout_x1_06;
      }
      if (param_1[2] != 0) {
        local_78 = param_1[2];
        func_0x0002600033a0(_DAT_2680c2e78,uVar6,&local_78,1);
        auVar10 = func_0x0002600c4d40();
        func_0x00026004a040(uVar9,auVar10._8_8_,auVar10._0_8_);
        func_0x0002600c4ec0();
        uVar6 = extraout_x1_07;
      }
      local_d0 = 0;
      uVar6 = func_0x000260039d10(*param_1,uVar6,uVar9,(ulong)*(byte *)(param_1 + 0xe) << 2,0,
                                  &local_d0);
      lVar7 = func_0x0002600c5080(local_d0);
      if (lVar7 == 0) {
        local_80 = &local_a0;
        local_c0 = param_1 + 4;
        lVar7 = __ZZNSt3__112__hash_tableINS_17__hash_value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEU8__strongPU34objcproto23MTLComputePipelineState11objc_objectEENS_22__unordered_map_hasherIS7_NS_4pairIKS7_SA_EENS_4hashIS7_EENS_8equal_toIS7_EEEENS_21__unordered_map_equalIS7_SF_SJ_SH_EENS5_ISF_EEE16__emplace_uniqueB9fqe220106IJRKNS_21piecewise_construct_tENS_5tupleIJRSE_EEENST_IJEEEEEENSD_INS_15__hash_iteratorIPNS_11__hash_nodeISB_PvEEEEbEEDpOT_ENKUlSU_SS_OSV_OSW_E_clESU_SS_S17_S18_
                          (&local_c0,&local_a0,PTR_DAT_269653328,&local_80,&uStack_81);
        func_0x0002600c50d0(lVar7 + 0x28,uVar6);
        func_0x0002600c4fe0();
      }
      else {
        __gs_log();
        uVar6 = func_0x0002600c4d40();
        iVar4 = func_0x0002600c5140(uVar6,0x10);
        if (iVar4 != 0) {
          local_c0._0_4_ = 0x8400102;
          local_c0._4_4_ = (undefined4)lVar7;
          uStack_b8 = (undefined4)((ulong)lVar7 >> 0x20);
          func_0x0002600c4b00(&MACH_HEADER,uVar6,0x10,
                              "[A3DGSR /MetalContext.mm:201] Failed to create state: %@",&local_c0,
                              0xc);
        }
        func_0x0002600c4ec0();
      }
      func_0x0002600c4eb0();
    }
    else {
      __gs_log();
      uVar6 = func_0x0002600c4d40();
      iVar4 = func_0x0002600c5140(uVar6,0x10);
      if (iVar4 != 0) {
        local_c0._0_4_ = 0x8400102;
        local_c0._4_4_ = (undefined4)lVar7;
        uStack_b8 = (undefined4)((ulong)lVar7 >> 0x20);
        func_0x0002600c4b00(&MACH_HEADER,uVar6,0x10,
                            "[A3DGSR /MetalContext.mm:174] Failed to create function: %@",&local_c0,
                            0xc);
      }
    }
    func_0x0002600c4ee0();
    func_0x0002600c4ed0();
    func_0x0002600c4ea0();
    func_0x0002600c4e90();
    func_0x0002600c4f00();
  }
  else {
    func_0x0002600c5080(*(undefined8 *)(auVar10._0_8_ + 0x28));
  }
  if (local_90 < 0) {
    func_0x0002600e3cc0(local_a0);
  }
  func_0x0002600c4d00(uVar5);
  if (*_DAT_2681a4a70 != local_68) {
    func_0x0002600c4ac0();
    return;
  }
  if (((unaff_x30 ^ unaff_x30 << 1) >> 0x3e & 1) == 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
                    /* WARNING: Does not return */
  pcVar3 = (code *)SoftwareBreakpoint(0xc471,0x25d0dd084);
  (*pcVar3)();
}

