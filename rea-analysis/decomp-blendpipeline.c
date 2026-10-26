
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong __ZN9apple3dgs8Renderer21BuildBlendingPipelineEPU21objcproto10MTLLibrary11objc_objectPU27objcproto16MTLBinaryArchive11objc_objectRKNSt3__16vectorINS_15BlendingVariantENS5_9allocatorIS7_EEEE14MTLPixelFormatSD_PU15__autoreleasingP7NSErrorm
                (long param_1,undefined8 param_2,undefined8 param_3,long *param_4,long param_5,
                long param_6,long *param_7,undefined8 param_8)

{
  long lVar1;
  long lVar2;
  int iVar3;
  undefined8 uVar4;
  long lVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  long *plVar9;
  long lVar10;
  undefined8 extraout_x1;
  undefined8 extraout_x1_00;
  undefined8 extraout_x1_01;
  undefined8 extraout_x1_02;
  undefined8 extraout_x1_03;
  undefined8 extraout_x1_04;
  undefined8 extraout_x1_05;
  undefined8 extraout_x1_06;
  undefined8 extraout_x1_07;
  undefined8 extraout_x1_08;
  undefined8 extraout_x1_09;
  undefined8 extraout_x1_10;
  undefined8 extraout_x1_11;
  undefined8 extraout_x1_12;
  undefined8 extraout_x1_13;
  undefined8 extraout_x1_14;
  undefined8 extraout_x1_15;
  undefined8 extraout_x1_16;
  undefined8 extraout_x1_17;
  undefined8 extraout_x1_18;
  undefined8 extraout_x1_19;
  undefined8 extraout_x1_20;
  undefined8 extraout_x1_21;
  undefined8 extraout_x1_22;
  undefined8 extraout_x1_23;
  undefined8 extraout_x1_24;
  undefined8 extraout_x1_25;
  undefined8 extraout_x1_26;
  undefined8 extraout_x1_27;
  undefined8 extraout_x1_28;
  undefined8 extraout_x1_29;
  undefined8 extraout_x1_30;
  undefined8 extraout_x1_31;
  undefined8 extraout_x1_32;
  undefined8 extraout_x1_33;
  undefined8 extraout_x1_34;
  undefined8 extraout_x1_35;
  undefined8 extraout_x1_36;
  undefined8 extraout_x1_37;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  long lVar14;
  ulong uVar15;
  long lVar16;
  undefined4 uVar17;
  undefined1 auVar18 [16];
  undefined4 local_90;
  long local_8c;
  long local_80;
  long local_78;
  long local_70;
  long local_68;
  
  local_68 = *_DAT_2681a4a70;
  uVar4 = func_0x0002600c4f90();
  lVar5 = func_0x0002600c4fc0();
  func_0x00026000e2b0(uVar4);
  uVar6 = func_0x0002600c4d40();
  lVar16 = *param_4;
  lVar2 = param_4[1];
  if (lVar16 == lVar2) {
    uVar15 = 1;
  }
  else {
    lVar1 = param_6;
    if (param_6 != 0x104) {
      lVar1 = 0;
    }
    do {
      auVar18 = func_0x0002600c4cf0(_DAT_2680dbeb0);
      uVar13 = auVar18._0_8_;
      func_0x000260007850(uVar13,auVar18._8_8_,&cfstringStruct_276632980);
      __ZNK9apple3dgs15BlendingVariant20GetFunctionConstantsEv(lVar16);
      auVar18 = func_0x0002600c4d40();
      func_0x00026003d4e0(uVar13,auVar18._8_8_,auVar18._0_8_);
      func_0x0002600c4e70();
      uVar7 = extraout_x1;
      if (lVar5 != 0) {
        local_70 = lVar5;
        func_0x0002600033a0(_DAT_2680c2e78,extraout_x1,&local_70,1);
        auVar18 = func_0x0002600c4d40();
        func_0x00026004a040(uVar13,auVar18._8_8_,auVar18._0_8_);
        func_0x0002600c4e70();
        uVar7 = extraout_x1_00;
      }
      if (((uint)param_8 >> 2 & 1) != 0) {
        auVar18 = func_0x00026001bf50(uVar13);
        func_0x00026002ba60(uVar13,auVar18._8_8_,auVar18._0_8_ | 4);
        uVar7 = extraout_x1_01;
      }
      auVar18 = func_0x00026003d460(uVar4,uVar7,uVar13,param_7);
      lVar14 = auVar18._0_8_;
      uVar17 = 0x8400102;
      if (lVar14 == 0) {
        if (param_7 != (long *)0x0) {
          __gs_log();
          uVar7 = func_0x0002600c4d40();
          iVar3 = func_0x0002600c5140(uVar7,0x10);
          if (iVar3 != 0) {
            local_8c = *param_7;
            local_90 = uVar17;
            func_0x0002600c4b00(&MACH_HEADER,uVar7,0x10,
                                "[A3DGSR /Renderer.mm:256] Failed to build blending pipeline %@",
                                &local_90,0xc);
          }
          goto LAB_25d0fe400;
        }
LAB_25d0fe404:
        func_0x0002600c4eb0();
        uVar15 = 0;
        break;
      }
      func_0x000260015f60(lVar14,auVar18._8_8_,&cfstringStruct_2766329a0);
      auVar18 = func_0x0002600c4cf0(_DAT_2680dbeb0);
      uVar13 = auVar18._0_8_;
      func_0x000260007850(uVar13,auVar18._8_8_,&cfstringStruct_2766329c0);
      __ZNK9apple3dgs15BlendingVariant20GetFunctionConstantsEv(lVar16);
      auVar18 = func_0x0002600c4d40();
      func_0x00026003d4e0(uVar13,auVar18._8_8_,auVar18._0_8_);
      func_0x0002600c4e70();
      uVar7 = extraout_x1_02;
      if (lVar5 != 0) {
        local_78 = lVar5;
        func_0x0002600033a0(_DAT_2680c2e78,extraout_x1_02,&local_78,1);
        auVar18 = func_0x0002600c4d40();
        func_0x00026004a040(uVar13,auVar18._8_8_,auVar18._0_8_);
        func_0x0002600c4e70();
        uVar7 = extraout_x1_03;
      }
      if (((uint)param_8 >> 2 & 1) != 0) {
        auVar18 = func_0x00026001bf50(uVar13);
        func_0x00026002ba60(uVar13,auVar18._8_8_,auVar18._0_8_ | 4);
        uVar7 = extraout_x1_04;
      }
      auVar18 = func_0x00026003d460(uVar4,uVar7,uVar13,param_7);
      lVar10 = auVar18._0_8_;
      if (lVar10 == 0) {
        if (param_7 != (long *)0x0) {
          __gs_log();
          uVar7 = func_0x0002600c4d40();
          iVar3 = func_0x0002600c5140(uVar7,0x10);
          if (iVar3 != 0) {
            local_8c = *param_7;
            local_90 = uVar17;
            func_0x0002600c4b00(&MACH_HEADER,uVar7,0x10,
                                "[A3DGSR /Renderer.mm:279] Failed to build blending pipeline %@",
                                &local_90,0xc);
          }
          func_0x0002600c4ea0();
        }
        func_0x0002600c4ed0();
LAB_25d0fe400:
        func_0x0002600c4e70();
        goto LAB_25d0fe404;
      }
      func_0x000260015f60(lVar10,auVar18._8_8_,&cfstringStruct_2766329e0);
      auVar18 = func_0x0002600c4cf0(_DAT_2680dc070);
      uVar13 = auVar18._0_8_;
      func_0x00026003ac60(uVar13,auVar18._8_8_,lVar14);
      func_0x00026003a670(uVar13,extraout_x1_05,lVar10);
      func_0x00026003a9e0(uVar13,extraout_x1_06,*(undefined8 *)(param_1 + 0x58));
      uVar7 = extraout_x1_07;
      if (lVar5 != 0) {
        local_80 = lVar5;
        func_0x0002600033a0(_DAT_2680c2e78,extraout_x1_07,&local_80,1);
        auVar18 = func_0x0002600c4d40();
        func_0x00026004a040(uVar13,auVar18._8_8_,auVar18._0_8_);
        func_0x0002600c4ea0();
        uVar7 = extraout_x1_08;
      }
      func_0x000260015f60(uVar13,uVar7,&cfstringStruct_276632a00);
      func_0x000260038930(uVar13);
      auVar18 = func_0x0002600c4d40();
      func_0x000260005e90(auVar18._0_8_,auVar18._8_8_,0);
      uVar7 = func_0x0002600c4d40();
      func_0x0002600c4ea0();
      func_0x000260026480(uVar7,extraout_x1_09,0x73);
      if (*(int *)(lVar16 + 0xc) == 0) {
        func_0x00026003a350(uVar7,extraout_x1_10,1);
        if (*(int *)(lVar16 + 8) == 0) {
          func_0x00026003aa10(uVar7,extraout_x1_11,0);
          func_0x00026003aad0(uVar7,extraout_x1_17,1);
          func_0x00026003a520(uVar7,extraout_x1_18,5);
          func_0x00026003a310(uVar7,extraout_x1_19,0);
          func_0x00026003aac0(uVar7,extraout_x1_20,1);
          uVar11 = 5;
          uVar12 = extraout_x1_21;
        }
        else {
          func_0x00026003aa10(uVar7,extraout_x1_11,0);
          func_0x00026003aad0(uVar7,extraout_x1_12,9);
          func_0x00026003a520(uVar7,extraout_x1_13,1);
          func_0x00026003a310(uVar7,extraout_x1_14,0);
          func_0x00026003aac0(uVar7,extraout_x1_15,9);
          uVar11 = 1;
          uVar12 = extraout_x1_16;
        }
        func_0x00026003a510(uVar7,uVar12,uVar11);
      }
      func_0x0002600c4ef0();
      func_0x000260038930(uVar13);
      auVar18 = func_0x0002600c4d40();
      func_0x000260005e90(auVar18._0_8_,auVar18._8_8_,1);
      uVar7 = func_0x0002600c4d40();
      func_0x0002600c4ef0();
      func_0x000260026480(uVar7,extraout_x1_22,0x37);
      func_0x0002600c4ea0();
      uVar7 = extraout_x1_23;
      if (param_5 != 0) {
        func_0x000260038930(uVar13);
        auVar18 = func_0x0002600c4d40();
        func_0x000260005e90(auVar18._0_8_,auVar18._8_8_,2);
        uVar7 = func_0x0002600c4d40();
        func_0x0002600c4ef0();
        func_0x000260026480(uVar7,extraout_x1_24,param_5);
        func_0x00026003d570(uVar7,extraout_x1_25,0);
        func_0x0002600c4ea0();
        uVar7 = extraout_x1_26;
      }
      if (*(int *)(lVar16 + 0x14) != 0) {
        func_0x000260038930(uVar13);
        auVar18 = func_0x0002600c4d40();
        func_0x000260005e90(auVar18._0_8_,auVar18._8_8_,4);
        uVar7 = func_0x0002600c4d40();
        func_0x0002600c4ef0();
        func_0x000260026480(uVar7,extraout_x1_27,10);
        func_0x0002600c4ea0();
        uVar7 = extraout_x1_28;
      }
      if (*(int *)(lVar16 + 0x10) == 1) {
        func_0x000260038930(uVar13);
        auVar18 = func_0x0002600c4d40();
        func_0x000260005e90(auVar18._0_8_,auVar18._8_8_,3);
        uVar7 = func_0x0002600c4d40();
        func_0x0002600c4ef0();
        func_0x000260026480(uVar7,extraout_x1_29,0x73);
        func_0x0002600c4ea0();
        uVar7 = extraout_x1_30;
      }
      func_0x00026004a100(uVar13,uVar7,3);
      func_0x00026003a4d0(uVar13,extraout_x1_31,param_6);
      func_0x00026003ab40(uVar13,extraout_x1_32,lVar1);
      func_0x00026004a100(uVar13,extraout_x1_33,3);
      uVar7 = func_0x00026003d4a0(uVar6,extraout_x1_34,uVar13,param_8,0,param_7);
      puVar8 = (undefined8 *)
               __ZNSt3__13mapIN9apple3dgs15BlendingVariantENS1_14RenderPipelineENS_4lessIS2_EENS_9allocatorINS_4pairIKS2_S3_EEEEEixERS8_
                         (param_1,lVar16);
      uVar13 = *puVar8;
      *puVar8 = uVar7;
      func_0x0002600c4f20(uVar13);
      plVar9 = (long *)__ZNSt3__13mapIN9apple3dgs15BlendingVariantENS1_14RenderPipelineENS_4lessIS2_EENS_9allocatorINS_4pairIKS2_S3_EEEEEixERS8_
                                 (param_1,lVar16);
      lVar14 = *plVar9;
      uVar15 = (ulong)(lVar14 != 0);
      if (lVar14 == 0) {
        if ((param_7 != (long *)0x0) && (*param_7 != 0)) {
          __gs_log();
          uVar7 = func_0x0002600c4d40();
          iVar3 = func_0x0002600c5140(uVar7,0x10);
          if (iVar3 != 0) {
            local_8c = *param_7;
            local_90 = uVar17;
            func_0x0002600c4b00(&MACH_HEADER,uVar7,0x10,
                                "[A3DGSR /Renderer.mm:357] Failed to build blending pipeline %@",
                                &local_90,0xc);
          }
          goto LAB_25d0fe300;
        }
      }
      else if (*(char *)(lVar16 + 5) == '\x01') {
        auVar18 = func_0x0002600c4cf0(_DAT_2680dbe80);
        uVar7 = auVar18._0_8_;
        if (*(int *)(lVar16 + 0x10) == 1) {
          func_0x00026003a500(uVar7,auVar18._8_8_,1);
          uVar12 = 7;
          uVar13 = extraout_x1_35;
        }
        else {
          func_0x00026003a500(uVar7,auVar18._8_8_,*(int *)(lVar16 + 8) == 1);
          uVar12 = 6;
          uVar13 = extraout_x1_36;
        }
        func_0x00026003a4e0(uVar7,uVar13,uVar12);
        uVar7 = func_0x000260039d30(uVar6,extraout_x1_37,uVar7);
        lVar10 = __ZNSt3__13mapIN9apple3dgs15BlendingVariantENS1_14RenderPipelineENS_4lessIS2_EENS_9allocatorINS_4pairIKS2_S3_EEEEEixERS8_
                           (param_1,lVar16);
        uVar13 = *(undefined8 *)(lVar10 + 8);
        *(undefined8 *)(lVar10 + 8) = uVar7;
        func_0x0002600c4f20(uVar13);
LAB_25d0fe300:
        func_0x0002600c4ea0();
      }
      func_0x0002600c4f10();
      func_0x0002600c4e70();
      func_0x0002600c4ed0();
      func_0x0002600c4ec0();
      func_0x0002600c4eb0();
      lVar16 = lVar16 + 0x34;
    } while (lVar16 != lVar2 && lVar14 != 0);
  }
  func_0x0002600c4f20(uVar6);
  func_0x0002600c4f20(lVar5);
  func_0x0002600c4f20(uVar4);
  if (*_DAT_2681a4a70 == local_68) {
    return uVar15;
  }
  uVar15 = func_0x0002600c4ac0();
  return uVar15;
}

