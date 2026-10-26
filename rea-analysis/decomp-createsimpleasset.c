
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __ZN9apple3dgs17CreateSimpleAssetEPU26objcproto15MTLCommandQueue11objc_objectRKNS_5Asset19AttributeDescriptorEjb
               (long param_1,undefined8 param_2,undefined8 param_3,uint param_4,undefined8 param_5)

{
  undefined8 *puVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  code *pcVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  int iVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long lVar11;
  int iVar12;
  long lVar13;
  ulong uVar14;
  undefined8 *puVar15;
  ulong uVar16;
  long lVar17;
  float2 fVar18;
  float fVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  ulong local_218 [4];
  ulong uStack_1f8;
  undefined8 local_1f0;
  ulong uStack_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8 [20];
  undefined8 local_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined8 uStack_110;
  undefined8 uStack_108;
  undefined8 local_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  
  uVar6 = func_0x0002600c4f40();
  func_0x00026000e2b0();
  uVar7 = func_0x0002600c4d40();
  __ZN9apple3dgs5AssetC2EPU19objcproto9MTLDevice11objc_objectb(param_1,uVar7,param_5);
  *(uint *)(param_1 + 0x290) = param_4;
  *(undefined8 *)(param_1 + 0x294) = 0x300000001;
  *(undefined8 *)(param_1 + 0x2a4) = 1;
  __ZN9apple3dgs5Asset10AttributesC2EPU19objcproto9MTLDevice11objc_objectRKNS0_19AttributeDescriptorEmm
            (&local_1f0,uVar7,param_3,1);
  uVar10 = local_1f0;
  puVar15 = (undefined8 *)(param_1 + 0x80);
  uVar9 = *puVar15;
  local_1f0 = 0;
  *puVar15 = uVar10;
  func_0x0002600c4f20(uVar9);
  lVar13 = 0;
  *(undefined8 *)(param_1 + 0x90) = uStack_1e0;
  *(ulong *)(param_1 + 0x88) = uStack_1e8;
  *(undefined8 *)(param_1 + 0xa0) = uStack_1d0;
  *(undefined8 *)(param_1 + 0x98) = local_1d8;
  lVar17 = 4;
  do {
    puVar1 = (undefined8 *)(param_1 + 0xa8 + lVar13 * 0x28);
    uVar10 = local_1c8[lVar13 * 5];
    local_1c8[lVar13 * 5] = 0;
    *puVar1 = uVar10;
    func_0x0002600c4f30();
    uVar10 = local_128;
    uVar9 = local_1c8[lVar13 * 5 + 1];
    puVar1[2] = local_1c8[lVar13 * 5 + 2];
    puVar1[1] = uVar9;
    uVar9 = local_1c8[lVar13 * 5 + 3];
    puVar1[4] = local_1c8[lVar13 * 5 + 4];
    puVar1[3] = uVar9;
    lVar13 = lVar13 + 1;
    lVar17 = lVar17 + -1;
  } while (lVar17 != 0);
  local_128 = 0;
  *(undefined8 *)(param_1 + 0x148) = uVar10;
  func_0x0002600c4f30();
  uVar10 = local_100;
  *(undefined8 *)(param_1 + 0x158) = uStack_118;
  *(undefined8 *)(param_1 + 0x150) = local_120;
  *(undefined8 *)(param_1 + 0x168) = uStack_108;
  *(undefined8 *)(param_1 + 0x160) = uStack_110;
  local_100 = 0;
  *(undefined8 *)(param_1 + 0x170) = uVar10;
  func_0x0002600c4f30();
  uVar10 = local_d8;
  *(undefined8 *)(param_1 + 0x180) = uStack_f0;
  *(undefined8 *)(param_1 + 0x178) = local_f8;
  *(undefined8 *)(param_1 + 400) = uStack_e0;
  *(undefined8 *)(param_1 + 0x188) = local_e8;
  local_d8 = 0;
  *(undefined8 *)(param_1 + 0x198) = uVar10;
  func_0x0002600c4f30();
  *(undefined8 *)(param_1 + 0x1a8) = uStack_c8;
  *(undefined8 *)(param_1 + 0x1a0) = local_d0;
  *(undefined8 *)(param_1 + 0x1b8) = uStack_b8;
  *(undefined8 *)(param_1 + 0x1b0) = uStack_c0;
  func_0x0002600c4f20(local_d8);
  func_0x0002600c4f20(local_100);
  func_0x0002600c4f20(local_128);
  lVar13 = -0xa0;
  lVar17 = 200;
  do {
    func_0x0002600c4f20(*(undefined8 *)((long)local_218 + lVar17));
    lVar13 = lVar13 + 0x28;
    lVar17 = lVar17 + -0x28;
  } while (lVar13 != 0);
  func_0x0002600c4f20(local_1f0);
  if (param_4 != 0) {
    uVar16 = 0;
    uVar14 = 0x2a;
    uVar10 = NEON_fmov(0xbf800000,4);
    do {
      iVar8 = (int)(uVar14 / 0xadc8);
      uVar3 = ((int)uVar14 + iVar8 * -0xadc8) * 0xbc8f;
      iVar12 = 0x7fffffff;
      iVar2 = iVar12;
      if ((uint)(iVar8 * 0xd47) <= uVar3) {
        iVar2 = 0;
      }
      uVar3 = iVar2 + uVar3 + iVar8 * -0xd47;
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar12 = 0;
      }
      uVar4 = iVar12 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      uVar9 = NEON_ucvtf(CONCAT44(uVar4 - 1,uVar3 - 1),4);
      local_1f0 = CONCAT44((float)((ulong)uVar10 >> 0x20) +
                           (float)((ulong)uVar9 >> 0x20) * 4.656613e-10 * 2.0,
                           (float)uVar10 + (float)uVar9 * 4.656613e-10 * 2.0);
      uVar3 = (uVar4 % 0xadc8) * 0xbc8f;
      iVar12 = 0x7fffffff;
      iVar2 = iVar12;
      if ((uVar4 / 0xadc8) * 0xd47 <= uVar3) {
        iVar2 = 0;
      }
      uVar3 = iVar2 + uVar3 + (uVar4 / 0xadc8) * -0xd47;
      uStack_1e8 = (ulong)(uint)(((float)(uVar3 - 1) / 2.1474836e+09) * 9.9 + 0.1);
      __ZN9apple3dgs9Attribute8TryStoreIDv3_fEEbRKT_mm(puVar15,&local_1f0,uVar16,0);
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      iVar2 = iVar12;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar2 = 0;
      }
      uVar3 = iVar2 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      iVar2 = iVar12;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar2 = 0;
      }
      uVar4 = iVar2 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      uVar9 = NEON_ucvtf(CONCAT44(uVar4 - 1,uVar3 - 1),4);
      local_218[3] = CONCAT44((float)((ulong)uVar9 >> 0x20) * 4.656613e-10 + -0.5,
                              (float)uVar9 * 4.656613e-10 + -0.5);
      uVar3 = (uVar4 % 0xadc8) * 0xbc8f;
      if ((uVar4 / 0xadc8) * 0xd47 <= uVar3) {
        iVar12 = 0;
      }
      uVar3 = iVar12 + uVar3 + (uVar4 / 0xadc8) * -0xd47;
      uStack_1f8 = (ulong)(uint)((float)(uVar3 - 1) / 2.1474836e+09 + -0.5);
      __ZN9apple3dgs9Attribute8TryStoreIDv3_fEEbRKT_mm(param_1 + 0xa8,local_218 + 3,uVar16,0);
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      iVar12 = 0x7fffffff;
      iVar2 = iVar12;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar2 = 0;
      }
      uVar3 = iVar2 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      fVar19 = (float)(uVar3 - 1) / 2.1474836e+09 + 0.0;
      lVar13 = *(long *)(param_1 + 0x150) + *(long *)(param_1 + 0x160) * uVar16;
      lVar17 = *(long *)(param_1 + 0x168);
      lVar11 = *(long *)(param_1 + 0x158);
      if (lVar11 < 0x1f) {
        if (lVar11 == 0x1b) {
          fVar18 = (float2)fVar19;
          *(ulong *)(lVar13 + lVar17) = CONCAT26(fVar18,CONCAT24(fVar18,CONCAT22(fVar18,fVar18)));
        }
        else if (lVar11 == 0x1c) {
          *(float *)(lVar13 + lVar17) = fVar19;
        }
      }
      else if (lVar11 == 0x1f) {
        ((undefined8 *)(lVar13 + lVar17))[1] = CONCAT44(fVar19,fVar19);
        *(undefined8 *)(lVar13 + lVar17) = CONCAT44(fVar19,fVar19);
      }
      else if (lVar11 == 0x35) {
        *(float2 *)(lVar13 + lVar17) = (float2)fVar19;
      }
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      iVar2 = iVar12;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar2 = 0;
      }
      uVar3 = iVar2 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      uVar4 = (uVar3 % 0xadc8) * 0xbc8f;
      iVar2 = iVar12;
      if ((uVar3 / 0xadc8) * 0xd47 <= uVar4) {
        iVar2 = 0;
      }
      uVar4 = iVar2 + uVar4 + (uVar3 / 0xadc8) * -0xd47;
      uVar9 = NEON_ucvtf(CONCAT44(uVar4 - 1,uVar3 - 1),4);
      local_218[1] = CONCAT44((float)((ulong)uVar9 >> 0x20) * 4.656613e-10 * 0.009999 + 1e-06,
                              (float)uVar9 * 4.656613e-10 * 0.009999 + 1e-06);
      uVar3 = (uVar4 % 0xadc8) * 0xbc8f;
      if ((uVar4 / 0xadc8) * 0xd47 <= uVar3) {
        iVar12 = 0;
      }
      uVar3 = iVar12 + uVar3 + (uVar4 / 0xadc8) * -0xd47;
      uVar14 = (ulong)uVar3;
      local_218[2] = (ulong)(uint)(((float)(uVar3 - 1) / 2.1474836e+09) * 0.009999 + 1e-06);
      __ZN9apple3dgs9Attribute8TryStoreIDv3_fEEbRKT_mm(param_1 + 0x170,local_218 + 1,uVar16,0);
      lVar13 = *(long *)(param_1 + 0x1a0) + *(long *)(param_1 + 0x1b0) * uVar16;
      if (*(long *)(param_1 + 0x1a8) == 0x1f) {
        puVar1 = (undefined8 *)(lVar13 + *(long *)(param_1 + 0x1b8));
        puVar1[1] = 0;
        *puVar1 = 0x3f800000;
      }
      else if (*(long *)(param_1 + 0x1a8) == 0x1b) {
        *(undefined8 *)(lVar13 + *(long *)(param_1 + 0x1b8)) = 0x3c00;
      }
      uVar16 = uVar16 + 1;
    } while (param_4 != uVar16);
  }
  puVar15 = _DAT_2681a4dd8;
  *(undefined8 *)(param_1 + 0x270) = 0x2d000000500;
  uVar10 = *puVar15;
  uVar20 = puVar15[3];
  uVar9 = puVar15[2];
  uVar22 = puVar15[5];
  uVar21 = puVar15[4];
  *(undefined8 *)(param_1 + 0x248) = puVar15[1];
  *(ulong *)(param_1 + 0x240) = CONCAT44((int)((ulong)uVar10 >> 0x20),0x3f4ccccd);
  *(undefined8 *)(param_1 + 600) = uVar20;
  *(ulong *)(param_1 + 0x250) = CONCAT44(0x3fb60b61,(int)uVar9);
  *(undefined8 *)(param_1 + 0x268) = uVar22;
  *(undefined8 *)(param_1 + 0x260) = 0x3f0000003f000000;
  *(undefined8 *)(param_1 + 0x1c8) = 0;
  *(undefined8 *)(param_1 + 0x1c0) = 0x3f800000;
  *(undefined8 *)(param_1 + 0x1d8) = 0;
  *(undefined8 *)(param_1 + 0x1d0) = 0x3f80000000000000;
  *(undefined8 *)(param_1 + 0x1e8) = 0x3f800000;
  *(undefined8 *)(param_1 + 0x1e0) = 0;
  *(undefined8 *)(param_1 + 0x1f8) = 0x3f80000000000000;
  *(undefined8 *)(param_1 + 0x1f0) = 0;
  uVar10 = __ZN9apple3dgs47CGColorSpaceCreateSRGBGamutWithTransferFunctionENS_16TransferFunctionE
                     (0,0,uVar21,*(undefined4 *)(param_1 + 0x2a0));
  *(undefined8 *)(param_1 + 0x378) = uVar10;
  func_0x000260026330(uVar6);
  uVar10 = func_0x0002600c4d40();
  local_218[0] = 0;
  __ZN9apple3dgs5Asset7PrepareEPU27objcproto16MTLCommandBuffer11objc_objectPU15__autoreleasingP7NSError
            (param_1,uVar10,local_218);
  lVar13 = func_0x0002600c5080(local_218[0]);
  func_0x000260003960(uVar10);
  uVar16 = __ZL14GSWaitAndCheckPU27objcproto16MTLCommandBuffer11objc_object(uVar10);
  if ((uVar16 & 1) == 0) {
    uVar10 = func_0x0002600cbdc0(0x10);
    func_0x0002600cbd20(uVar10,"CreateSimpleAsset failed");
  }
  else {
    if (lVar13 == 0) {
      func_0x0002600c4eb0();
      func_0x0002600c4f20(uVar7);
      func_0x0002600c4e70();
      return;
    }
    uVar10 = func_0x0002600cbdc0(0x10);
    func_0x0002600cbd20(uVar10,"CreateSimpleAsset failed");
  }
  func_0x0002600cbe30(uVar10,_DAT_2681a1550,_DAT_2681a13f8);
                    /* WARNING: Does not return */
  pcVar5 = (code *)SoftwareBreakpoint(1,0x25d0d6920);
  (*pcVar5)();
}

