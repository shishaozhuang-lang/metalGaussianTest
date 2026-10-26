
void __ZN9apple3dgs8Renderer18UpdateViewMatricesERKNSt3__15arrayIN4simd8float4x4ELm2EEE
               (long param_1,undefined8 *param_2)

{
  undefined8 *puVar1;
  undefined8 uVar2;
  undefined1 auVar3 [16];
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  
  puVar1 = (undefined8 *)func_0x000260026340(*(undefined8 *)(param_1 + 0x78));
  uVar2 = param_2[4];
  uVar5 = param_2[7];
  uVar4 = param_2[6];
  uVar9 = param_2[1];
  uVar8 = *param_2;
  uVar7 = param_2[3];
  uVar6 = param_2[2];
  puVar1[5] = param_2[5];
  puVar1[4] = uVar2;
  puVar1[7] = uVar5;
  puVar1[6] = uVar4;
  puVar1[1] = uVar9;
  *puVar1 = uVar8;
  puVar1[3] = uVar7;
  puVar1[2] = uVar6;
  uVar6 = param_2[5];
  uVar5 = param_2[4];
  uVar8 = param_2[7];
  uVar7 = param_2[6];
  uVar4 = param_2[3];
  uVar2 = param_2[2];
  auVar3 = func_0x0002600ddd80(*param_2);
  *(undefined1 (*) [16])(puVar1 + 8) = auVar3;
  puVar1[0xb] = uVar4;
  puVar1[10] = uVar2;
  puVar1[0xd] = uVar6;
  puVar1[0xc] = uVar5;
  puVar1[0xf] = uVar8;
  puVar1[0xe] = uVar7;
  uVar2 = param_2[0xc];
  uVar5 = param_2[0xf];
  uVar4 = param_2[0xe];
  uVar9 = param_2[9];
  uVar8 = param_2[8];
  uVar7 = param_2[0xb];
  uVar6 = param_2[10];
  puVar1[0x15] = param_2[0xd];
  puVar1[0x14] = uVar2;
  puVar1[0x17] = uVar5;
  puVar1[0x16] = uVar4;
  puVar1[0x11] = uVar9;
  puVar1[0x10] = uVar8;
  puVar1[0x13] = uVar7;
  puVar1[0x12] = uVar6;
  uVar4 = param_2[0xb];
  uVar2 = param_2[10];
  uVar6 = param_2[0xd];
  uVar5 = param_2[0xc];
  uVar8 = param_2[0xf];
  uVar7 = param_2[0xe];
  auVar3 = func_0x0002600ddd80(param_2[8]);
  *(undefined1 (*) [16])(puVar1 + 0x18) = auVar3;
  puVar1[0x1b] = uVar4;
  puVar1[0x1a] = uVar2;
  puVar1[0x1d] = uVar6;
  puVar1[0x1c] = uVar5;
  puVar1[0x1f] = uVar8;
  puVar1[0x1e] = uVar7;
  return;
}

