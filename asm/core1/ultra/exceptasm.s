#include <sys/asm.h>
.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.data

EXPORT(__osHwIntTable)
.word 0x0, 0x0, 0x0, 0x0, 0x0

.rdata
#define REDISPATCH 0x00
#define SW1 0x04
#define SW2 0x08
#define RCP 0x0c
#define CART 0x10
#define PRENMI 0x14
#define IP6_HDLR 0x18
#define IP7_HDLR 0x1c
#define COUNTER 0x20
__osIntOffTable:
.byte REDISPATCH
.byte PRENMI 
.byte IP6_HDLR 
.byte IP6_HDLR 
.byte IP7_HDLR 
.byte IP7_HDLR
.byte IP7_HDLR 
.byte IP7_HDLR 
.byte COUNTER 
.byte COUNTER 
.byte IP6_HDLR 
.byte IP6_HDLR 
.byte IP7_HDLR 
.byte IP7_HDLR 
.byte IP7_HDLR 
.byte IP7_HDLR 
.byte REDISPATCH 
.byte SW1 
.byte SW2 
.byte SW2 
.byte RCP 
.byte RCP 
.byte RCP 
.byte RCP 
.byte CART 
.byte CART 
.byte CART 
.byte CART 
.byte CART 
.byte CART 
.byte CART 
.byte CART
__osIntTable:
.word redispatch, sw1, sw2, rcp, cart, prenmi, IP6_Hdlr, IP7_Hdlr, counter

.section .text, "ax"

# Handwritten function
glabel func_8026A2E0
/* F45B10 8026A2E0 3C1A8027 */  lui        $k0, %hi(D_8026A300)
/* F45B14 8026A2E4 275AA300 */  addiu      $k0, $k0, %lo(D_8026A300)
/* F45B18 8026A2E8 03400008 */  jr         $k0
/* F45B1C 8026A2EC 00000000 */   nop
/* F45B20 8026A2F0 3C1A8027 */  lui        $k0, %hi(D_8026A300)
/* F45B24 8026A2F4 275AA300 */  addiu      $k0, $k0, %lo(D_8026A300)
/* F45B28 8026A2F8 03400008 */  jr         $k0
/* F45B2C 8026A2FC 00000000 */   nop
D_8026A300:
/* F45B30 8026A300 3C1A8028 */  lui        $k0, %hi(__osThreadSave)
/* F45B34 8026A304 275A5DE0 */  addiu      $k0, $k0, %lo(__osThreadSave)
/* F45B38 8026A308 FF410020 */  sd         $at, 0x20($k0)
/* F45B3C 8026A30C 401B6000 */  mfc0       $k1, $12
/* F45B40 8026A310 AF5B0118 */  sw         $k1, 0x118($k0)
/* F45B44 8026A314 2401FFFC */  addiu      $at, $zero, -0x4
/* F45B48 8026A318 0361D824 */  and        $k1, $k1, $at
/* F45B4C 8026A31C 409B6000 */  mtc0       $k1, $12
/* F45B50 8026A320 FF480058 */  sd         $t0, 0x58($k0)
/* F45B54 8026A324 FF490060 */  sd         $t1, 0x60($k0)
/* F45B58 8026A328 FF4A0068 */  sd         $t2, 0x68($k0)
/* F45B5C 8026A32C AF400018 */  sw         $zero, 0x18($k0)
/* F45B60 8026A330 40086800 */  mfc0       $t0, $13
/* F45B64 8026A334 03404025 */  or         $t0, $k0, $zero
/* F45B68 8026A338 3C1A8027 */  lui        $k0, %hi(__osRunningThread)
/* F45B6C 8026A33C 8F5A7380 */  lw         $k0, %lo(__osRunningThread)($k0)
/* F45B70 8026A340 DD090020 */  ld         $t1, 0x20($t0)
/* F45B74 8026A344 FF490020 */  sd         $t1, 0x20($k0)
/* F45B78 8026A348 DD090118 */  ld         $t1, 0x118($t0)
/* F45B7C 8026A34C FF490118 */  sd         $t1, 0x118($k0)
/* F45B80 8026A350 DD090058 */  ld         $t1, 0x58($t0)
/* F45B84 8026A354 FF490058 */  sd         $t1, 0x58($k0)
/* F45B88 8026A358 DD090060 */  ld         $t1, 0x60($t0)
/* F45B8C 8026A35C FF490060 */  sd         $t1, 0x60($k0)
/* F45B90 8026A360 DD090068 */  ld         $t1, 0x68($t0)
/* F45B94 8026A364 FF490068 */  sd         $t1, 0x68($k0)
/* F45B98 8026A368 8F5B0118 */  lw         $k1, 0x118($k0)
/* F45B9C 8026A36C 00004012 */  mflo       $t0
/* F45BA0 8026A370 FF480108 */  sd         $t0, 0x108($k0)
/* F45BA4 8026A374 00004010 */  mfhi       $t0
/* F45BA8 8026A378 3369FF00 */  andi       $t1, $k1, 0xFF00
/* F45BAC 8026A37C FF420028 */  sd         $v0, 0x28($k0)
/* F45BB0 8026A380 FF430030 */  sd         $v1, 0x30($k0)
/* F45BB4 8026A384 FF440038 */  sd         $a0, 0x38($k0)
/* F45BB8 8026A388 FF450040 */  sd         $a1, 0x40($k0)
/* F45BBC 8026A38C FF460048 */  sd         $a2, 0x48($k0)
/* F45BC0 8026A390 FF470050 */  sd         $a3, 0x50($k0)
/* F45BC4 8026A394 FF4B0070 */  sd         $t3, 0x70($k0)
/* F45BC8 8026A398 FF4C0078 */  sd         $t4, 0x78($k0)
/* F45BCC 8026A39C FF4D0080 */  sd         $t5, 0x80($k0)
/* F45BD0 8026A3A0 FF4E0088 */  sd         $t6, 0x88($k0)
/* F45BD4 8026A3A4 FF4F0090 */  sd         $t7, 0x90($k0)
/* F45BD8 8026A3A8 FF500098 */  sd         $s0, 0x98($k0)
/* F45BDC 8026A3AC FF5100A0 */  sd         $s1, 0xA0($k0)
/* F45BE0 8026A3B0 FF5200A8 */  sd         $s2, 0xA8($k0)
/* F45BE4 8026A3B4 FF5300B0 */  sd         $s3, 0xB0($k0)
/* F45BE8 8026A3B8 FF5400B8 */  sd         $s4, 0xB8($k0)
/* F45BEC 8026A3BC FF5500C0 */  sd         $s5, 0xC0($k0)
/* F45BF0 8026A3C0 FF5600C8 */  sd         $s6, 0xC8($k0)
/* F45BF4 8026A3C4 FF5700D0 */  sd         $s7, 0xD0($k0)
/* F45BF8 8026A3C8 FF5800D8 */  sd         $t8, 0xD8($k0)
/* F45BFC 8026A3CC FF5900E0 */  sd         $t9, 0xE0($k0)
/* F45C00 8026A3D0 FF5C00E8 */  sd         $gp, 0xE8($k0)
/* F45C04 8026A3D4 FF5D00F0 */  sd         $sp, 0xF0($k0)
/* F45C08 8026A3D8 FF5E00F8 */  sd         $fp, 0xF8($k0)
/* F45C0C 8026A3DC FF5F0100 */  sd         $ra, 0x100($k0)
/* F45C10 8026A3E0 1120000D */  beqz       $t1, .L8026A418
/* F45C14 8026A3E4 FF480110 */   sd        $t0, 0x110($k0)
/* F45C18 8026A3E8 3C088027 */  lui        $t0, %hi(__OSGlobalIntMask)
/* F45C1C 8026A3EC 25087130 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* F45C20 8026A3F0 8D080000 */  lw         $t0, 0x0($t0)
/* F45C24 8026A3F4 2401FFFF */  addiu      $at, $zero, -0x1
/* F45C28 8026A3F8 01014026 */  xor        $t0, $t0, $at
/* F45C2C 8026A3FC 3C01FFFF */  lui        $at, (0xFFFF00FF >> 16)
/* F45C30 8026A400 3108FF00 */  andi       $t0, $t0, 0xFF00
/* F45C34 8026A404 342100FF */  ori        $at, $at, (0xFFFF00FF & 0xFFFF)
/* F45C38 8026A408 01284825 */  or         $t1, $t1, $t0
/* F45C3C 8026A40C 0361D824 */  and        $k1, $k1, $at
/* F45C40 8026A410 0369D825 */  or         $k1, $k1, $t1
/* F45C44 8026A414 AF5B0118 */  sw         $k1, 0x118($k0)
.L8026A418:
/* F45C48 8026A418 3C09A430 */  lui        $t1, %hi(D_A430000C)
/* F45C4C 8026A41C 8D29000C */  lw         $t1, %lo(D_A430000C)($t1)
/* F45C50 8026A420 5120000C */  beql       $t1, $zero, .L8026A454
/* F45C54 8026A424 AF490128 */   sw        $t1, 0x128($k0)
/* F45C58 8026A428 3C088027 */  lui        $t0, %hi(__OSGlobalIntMask)
/* F45C5C 8026A42C 25087130 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* F45C60 8026A430 8D080000 */  lw         $t0, 0x0($t0)
/* F45C64 8026A434 8F4C0128 */  lw         $t4, 0x128($k0)
/* F45C68 8026A438 2401FFFF */  addiu      $at, $zero, -0x1
/* F45C6C 8026A43C 00084402 */  srl        $t0, $t0, 16
/* F45C70 8026A440 01014026 */  xor        $t0, $t0, $at
/* F45C74 8026A444 3108003F */  andi       $t0, $t0, 0x3F
/* F45C78 8026A448 010C4024 */  and        $t0, $t0, $t4
/* F45C7C 8026A44C 01284825 */  or         $t1, $t1, $t0
/* F45C80 8026A450 AF490128 */  sw         $t1, 0x128($k0)
.L8026A454:
/* F45C84 8026A454 40087000 */  mfc0       $t0, $14
/* F45C88 8026A458 AF48011C */  sw         $t0, 0x11C($k0)
/* F45C8C 8026A45C 8F480018 */  lw         $t0, 0x18($k0)
/* F45C90 8026A460 11000014 */  beqz       $t0, .L8026A4B4
/* F45C94 8026A464 00000000 */   nop
/* F45C98 8026A468 4448F800 */  cfc1       $t0, $31
/* F45C9C 8026A46C 00000000 */  nop
/* F45CA0 8026A470 AF48012C */  sw         $t0, 0x12C($k0)
/* F45CA4 8026A474 F7400130 */  sdc1       $f0, 0x130($k0)
/* F45CA8 8026A478 F7420138 */  sdc1       $f2, 0x138($k0)
/* F45CAC 8026A47C F7440140 */  sdc1       $f4, 0x140($k0)
/* F45CB0 8026A480 F7460148 */  sdc1       $f6, 0x148($k0)
/* F45CB4 8026A484 F7480150 */  sdc1       $f8, 0x150($k0)
/* F45CB8 8026A488 F74A0158 */  sdc1       $f10, 0x158($k0)
/* F45CBC 8026A48C F74C0160 */  sdc1       $f12, 0x160($k0)
/* F45CC0 8026A490 F74E0168 */  sdc1       $f14, 0x168($k0)
/* F45CC4 8026A494 F7500170 */  sdc1       $f16, 0x170($k0)
/* F45CC8 8026A498 F7520178 */  sdc1       $f18, 0x178($k0)
/* F45CCC 8026A49C F7540180 */  sdc1       $f20, 0x180($k0)
/* F45CD0 8026A4A0 F7560188 */  sdc1       $f22, 0x188($k0)
/* F45CD4 8026A4A4 F7580190 */  sdc1       $f24, 0x190($k0)
/* F45CD8 8026A4A8 F75A0198 */  sdc1       $f26, 0x198($k0)
/* F45CDC 8026A4AC F75C01A0 */  sdc1       $f28, 0x1A0($k0)
/* F45CE0 8026A4B0 F75E01A8 */  sdc1       $f30, 0x1A8($k0)
.L8026A4B4:
/* F45CE4 8026A4B4 40086800 */  mfc0       $t0, $13
/* F45CE8 8026A4B8 AF480120 */  sw         $t0, 0x120($k0)
/* F45CEC 8026A4BC 24090002 */  addiu      $t1, $zero, 0x2
/* F45CF0 8026A4C0 A7490010 */  sh         $t1, 0x10($k0)
/* F45CF4 8026A4C4 3109007C */  andi       $t1, $t0, 0x7C
/* F45CF8 8026A4C8 240A0024 */  addiu      $t2, $zero, 0x24
/* F45CFC 8026A4CC 512A00B1 */  beql       $t1, $t2, handle_break
/* F45D00 8026A4D0 24090001 */   addiu     $t1, $zero, 0x1
/* F45D04 8026A4D4 240A002C */  addiu      $t2, $zero, 0x2C
/* F45D08 8026A4D8 112A00FF */  beq        $t1, $t2, .L8026A8D8
/* F45D0C 8026A4DC 00000000 */   nop
/* F45D10 8026A4E0 240A0000 */  addiu      $t2, $zero, 0x0
/* F45D14 8026A4E4 152A00C3 */  bne        $t1, $t2, .L8026A7F4
/* F45D18 8026A4E8 00000000 */   nop
/* F45D1C 8026A4EC 03688024 */  and        $s0, $k1, $t0
.L8026A4F0:
/* F45D20 8026A4F0 3209FF00 */  andi       $t1, $s0, 0xFF00
.L8026A4F4:
/* F45D24 8026A4F4 00095302 */  srl        $t2, $t1, 12
/* F45D28 8026A4F8 15400003 */  bnez       $t2, .L8026A508
/* F45D2C 8026A4FC 00000000 */   nop
/* F45D30 8026A500 00095202 */  srl        $t2, $t1, 8
/* F45D34 8026A504 214A0010 */  addi       $t2, $t2, 0x10
.L8026A508:
/* F45D38 8026A508 3C018028 */  lui        $at, %hi(__osIntOffTable)
/* F45D3C 8026A50C 002A0821 */  addu       $at, $at, $t2
/* F45D40 8026A510 902A8D60 */  lbu        $t2, %lo(__osIntOffTable)($at)
/* F45D44 8026A514 3C018028 */  lui        $at, %hi(__osIntTable)
/* F45D48 8026A518 002A0821 */  addu       $at, $at, $t2
/* F45D4C 8026A51C 8C2A8D80 */  lw         $t2, %lo(__osIntTable)($at)
/* F45D50 8026A520 01400008 */  jr         $t2
/* F45D54 8026A524 00000000 */   nop
IP6_Hdlr:
/* F45D58 8026A528 2401DFFF */  addiu      $at, $zero, -0x2001
/* F45D5C 8026A52C 1000FFF0 */  b          .L8026A4F0
/* F45D60 8026A530 02018024 */   and       $s0, $s0, $at
IP7_Hdlr:
/* F45D64 8026A534 2401BFFF */  addiu      $at, $zero, -0x4001
/* F45D68 8026A538 1000FFED */  b          .L8026A4F0
/* F45D6C 8026A53C 02018024 */   and       $s0, $s0, $at
counter:
/* F45D70 8026A540 40095800 */  mfc0       $t1, $11
/* F45D74 8026A544 40895800 */  mtc0       $t1, $11
/* F45D78 8026A548 0C09AA09 */  jal        func_8026A824
/* F45D7C 8026A54C 24040018 */   addiu     $a0, $zero, 0x18
/* F45D80 8026A550 3C01FFFF */  lui        $at, (0xFFFF7FFF >> 16)
/* F45D84 8026A554 34217FFF */  ori        $at, $at, (0xFFFF7FFF & 0xFFFF)
/* F45D88 8026A558 1000FFE5 */  b          .L8026A4F0
/* F45D8C 8026A55C 02018024 */   and       $s0, $s0, $at
cart:
/* F45D90 8026A560 2401F7FF */  addiu      $at, $zero, -0x801
/* F45D94 8026A564 02018024 */  and        $s0, $s0, $at
/* F45D98 8026A568 240A0004 */  addiu      $t2, $zero, 0x4
/* F45D9C 8026A56C 3C018027 */  lui        $at, %hi(__osHwIntTable)
/* F45DA0 8026A570 002A0821 */  addu       $at, $at, $t2
/* F45DA4 8026A574 8C2A7350 */  lw         $t2, %lo(__osHwIntTable)($at)
/* F45DA8 8026A578 3C1D8028 */  lui        $sp, %hi(leoDiskStack)
/* F45DAC 8026A57C 27BD5F90 */  addiu      $sp, $sp, %lo(leoDiskStack)
/* F45DB0 8026A580 24040010 */  addiu      $a0, $zero, 0x10
/* F45DB4 8026A584 11400007 */  beqz       $t2, .L8026A5A4
/* F45DB8 8026A588 27BD0FF0 */   addiu     $sp, $sp, 0xFF0
/* F45DBC 8026A58C 0140F809 */  jalr       $t2
/* F45DC0 8026A590 00000000 */   nop
/* F45DC4 8026A594 10400003 */  beqz       $v0, .L8026A5A4
/* F45DC8 8026A598 00000000 */   nop
/* F45DCC 8026A59C 10000082 */  b          redispatch
/* F45DD0 8026A5A0 00000000 */   nop
.L8026A5A4:
/* F45DD4 8026A5A4 0C09AA09 */  jal        func_8026A824
/* F45DD8 8026A5A8 00000000 */   nop
/* F45DDC 8026A5AC 1000FFD1 */  b          .L8026A4F4
/* F45DE0 8026A5B0 3209FF00 */   andi      $t1, $s0, 0xFF00
rcp:
/* F45DE4 8026A5B4 3C088027 */  lui        $t0, %hi(__OSGlobalIntMask)
/* F45DE8 8026A5B8 25087130 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* F45DEC 8026A5BC 8D080000 */  lw         $t0, 0x0($t0)
/* F45DF0 8026A5C0 3C11A430 */  lui        $s1, %hi(D_A4300008)
/* F45DF4 8026A5C4 8E310008 */  lw         $s1, %lo(D_A4300008)($s1)
/* F45DF8 8026A5C8 00084402 */  srl        $t0, $t0, 16
/* F45DFC 8026A5CC 02288824 */  and        $s1, $s1, $t0
/* F45E00 8026A5D0 32290001 */  andi       $t1, $s1, 0x1
/* F45E04 8026A5D4 51200014 */  beql       $t1, $zero, .L8026A628
/* F45E08 8026A5D8 32290008 */   andi      $t1, $s1, 0x8
/* F45E0C 8026A5DC 3C0CA404 */  lui        $t4, %hi(D_A4040010)
/* F45E10 8026A5E0 8D8C0010 */  lw         $t4, %lo(D_A4040010)($t4)
/* F45E14 8026A5E4 24090008 */  addiu      $t1, $zero, 0x8
/* F45E18 8026A5E8 3C01A404 */  lui        $at, %hi(D_A4040010)
/* F45E1C 8026A5EC 318C0300 */  andi       $t4, $t4, 0x300
/* F45E20 8026A5F0 3231003E */  andi       $s1, $s1, 0x3E
/* F45E24 8026A5F4 11800007 */  beqz       $t4, .L8026A614
/* F45E28 8026A5F8 AC290010 */   sw        $t1, %lo(D_A4040010)($at)
/* F45E2C 8026A5FC 0C09AA09 */  jal        func_8026A824
/* F45E30 8026A600 24040020 */   addiu     $a0, $zero, 0x20
/* F45E34 8026A604 52200039 */  beql       $s1, $zero, .L8026A6EC
/* F45E38 8026A608 2401FBFF */   addiu     $at, $zero, -0x401
/* F45E3C 8026A60C 10000006 */  b          .L8026A628
/* F45E40 8026A610 32290008 */   andi      $t1, $s1, 0x8
.L8026A614:
/* F45E44 8026A614 0C09AA09 */  jal        func_8026A824
/* F45E48 8026A618 24040058 */   addiu     $a0, $zero, 0x58
/* F45E4C 8026A61C 52200033 */  beql       $s1, $zero, .L8026A6EC
/* F45E50 8026A620 2401FBFF */   addiu     $at, $zero, -0x401
/* F45E54 8026A624 32290008 */  andi       $t1, $s1, 0x8
.L8026A628:
/* F45E58 8026A628 11200007 */  beqz       $t1, .L8026A648
/* F45E5C 8026A62C 3C01A440 */   lui       $at, %hi(D_A4400010)
/* F45E60 8026A630 32310037 */  andi       $s1, $s1, 0x37
/* F45E64 8026A634 AC200010 */  sw         $zero, %lo(D_A4400010)($at)
/* F45E68 8026A638 0C09AA09 */  jal        func_8026A824
/* F45E6C 8026A63C 24040038 */   addiu     $a0, $zero, 0x38
/* F45E70 8026A640 5220002A */  beql       $s1, $zero, .L8026A6EC
/* F45E74 8026A644 2401FBFF */   addiu     $at, $zero, -0x401
.L8026A648:
/* F45E78 8026A648 32290004 */  andi       $t1, $s1, 0x4
/* F45E7C 8026A64C 5120000A */  beql       $t1, $zero, .L8026A678
/* F45E80 8026A650 32290002 */   andi      $t1, $s1, 0x2
/* F45E84 8026A654 24090001 */  addiu      $t1, $zero, 0x1
/* F45E88 8026A658 3C01A450 */  lui        $at, %hi(D_A450000C)
/* F45E8C 8026A65C 3231003B */  andi       $s1, $s1, 0x3B
/* F45E90 8026A660 AC29000C */  sw         $t1, %lo(D_A450000C)($at)
/* F45E94 8026A664 0C09AA09 */  jal        func_8026A824
/* F45E98 8026A668 24040030 */   addiu     $a0, $zero, 0x30
/* F45E9C 8026A66C 5220001F */  beql       $s1, $zero, .L8026A6EC
/* F45EA0 8026A670 2401FBFF */   addiu     $at, $zero, -0x401
/* F45EA4 8026A674 32290002 */  andi       $t1, $s1, 0x2
.L8026A678:
/* F45EA8 8026A678 11200007 */  beqz       $t1, .L8026A698
/* F45EAC 8026A67C 3C01A480 */   lui       $at, %hi(D_A4800018)
/* F45EB0 8026A680 3231003D */  andi       $s1, $s1, 0x3D
/* F45EB4 8026A684 AC200018 */  sw         $zero, %lo(D_A4800018)($at)
/* F45EB8 8026A688 0C09AA09 */  jal        func_8026A824
/* F45EBC 8026A68C 24040028 */   addiu     $a0, $zero, 0x28
/* F45EC0 8026A690 52200016 */  beql       $s1, $zero, .L8026A6EC
/* F45EC4 8026A694 2401FBFF */   addiu     $at, $zero, -0x401
.L8026A698:
/* F45EC8 8026A698 32290010 */  andi       $t1, $s1, 0x10
/* F45ECC 8026A69C 5120000A */  beql       $t1, $zero, .L8026A6C8
/* F45ED0 8026A6A0 32290020 */   andi      $t1, $s1, 0x20
/* F45ED4 8026A6A4 24090002 */  addiu      $t1, $zero, 0x2
/* F45ED8 8026A6A8 3C01A460 */  lui        $at, %hi(D_A4600010)
/* F45EDC 8026A6AC 3231002F */  andi       $s1, $s1, 0x2F
/* F45EE0 8026A6B0 AC290010 */  sw         $t1, %lo(D_A4600010)($at)
/* F45EE4 8026A6B4 0C09AA09 */  jal        func_8026A824
/* F45EE8 8026A6B8 24040040 */   addiu     $a0, $zero, 0x40
/* F45EEC 8026A6BC 5220000B */  beql       $s1, $zero, .L8026A6EC
/* F45EF0 8026A6C0 2401FBFF */   addiu     $at, $zero, -0x401
/* F45EF4 8026A6C4 32290020 */  andi       $t1, $s1, 0x20
.L8026A6C8:
/* F45EF8 8026A6C8 51200008 */  beql       $t1, $zero, .L8026A6EC
/* F45EFC 8026A6CC 2401FBFF */   addiu     $at, $zero, -0x401
/* F45F00 8026A6D0 24090800 */  addiu      $t1, $zero, 0x800
/* F45F04 8026A6D4 3C01A430 */  lui        $at, %hi(D_A4300000)
/* F45F08 8026A6D8 3231001F */  andi       $s1, $s1, 0x1F
/* F45F0C 8026A6DC AC290000 */  sw         $t1, %lo(D_A4300000)($at)
/* F45F10 8026A6E0 0C09AA09 */  jal        func_8026A824
/* F45F14 8026A6E4 24040048 */   addiu     $a0, $zero, 0x48
/* F45F18 8026A6E8 2401FBFF */  addiu      $at, $zero, -0x401
.L8026A6EC:
/* F45F1C 8026A6EC 1000FF80 */  b          .L8026A4F0
/* F45F20 8026A6F0 02018024 */   and       $s0, $s0, $at
prenmi:
/* F45F24 8026A6F4 8F5B0118 */  lw         $k1, 0x118($k0)
/* F45F28 8026A6F8 2401EFFF */  addiu      $at, $zero, -0x1001
/* F45F2C 8026A6FC 3C098027 */  lui        $t1, %hi(__osShutdown)
/* F45F30 8026A700 0361D824 */  and        $k1, $k1, $at
/* F45F34 8026A704 AF5B0118 */  sw         $k1, 0x118($k0)
/* F45F38 8026A708 2529712C */  addiu      $t1, $t1, %lo(__osShutdown)
/* F45F3C 8026A70C 8D2A0000 */  lw         $t2, 0x0($t1)
/* F45F40 8026A710 11400003 */  beqz       $t2, firstnmi
/* F45F44 8026A714 2401EFFF */   addiu     $at, $zero, -0x1001
/* F45F48 8026A718 10000023 */  b          redispatch
/* F45F4C 8026A71C 02018024 */   and       $s0, $s0, $at
firstnmi:
/* F45F50 8026A720 240A0001 */  addiu      $t2, $zero, 0x1
/* F45F54 8026A724 AD2A0000 */  sw         $t2, 0x0($t1)
/* F45F58 8026A728 0C09AA09 */  jal        func_8026A824
/* F45F5C 8026A72C 24040070 */   addiu     $a0, $zero, 0x70
/* F45F60 8026A730 3C0A8027 */  lui        $t2, %hi(__osRunQueue)
/* F45F64 8026A734 8D4A7378 */  lw         $t2, %lo(__osRunQueue)($t2)
/* F45F68 8026A738 2401EFFF */  addiu      $at, $zero, -0x1001
/* F45F6C 8026A73C 02018024 */  and        $s0, $s0, $at
/* F45F70 8026A740 8D5B0118 */  lw         $k1, 0x118($t2)
/* F45F74 8026A744 0361D824 */  and        $k1, $k1, $at
/* F45F78 8026A748 10000017 */  b          redispatch
/* F45F7C 8026A74C AD5B0118 */   sw        $k1, 0x118($t2)
sw2:
/* F45F80 8026A750 2401FDFF */  addiu      $at, $zero, -0x201
/* F45F84 8026A754 01014024 */  and        $t0, $t0, $at
/* F45F88 8026A758 40886800 */  mtc0       $t0, $13
/* F45F8C 8026A75C 0C09AA09 */  jal        func_8026A824
/* F45F90 8026A760 24040008 */   addiu     $a0, $zero, 0x8
/* F45F94 8026A764 2401FDFF */  addiu      $at, $zero, -0x201
/* F45F98 8026A768 1000FF61 */  b          .L8026A4F0
/* F45F9C 8026A76C 02018024 */   and       $s0, $s0, $at
sw1:
/* F45FA0 8026A770 2401FEFF */  addiu      $at, $zero, -0x101
/* F45FA4 8026A774 01014024 */  and        $t0, $t0, $at
/* F45FA8 8026A778 40886800 */  mtc0       $t0, $13
/* F45FAC 8026A77C 0C09AA09 */  jal        func_8026A824
/* F45FB0 8026A780 24040000 */   addiu     $a0, $zero, 0x0
/* F45FB4 8026A784 2401FEFF */  addiu      $at, $zero, -0x101
/* F45FB8 8026A788 1000FF59 */  b          .L8026A4F0
/* F45FBC 8026A78C 02018024 */   and       $s0, $s0, $at
/* F45FC0 8026A790 24090001 */  addiu      $t1, $zero, 0x1
handle_break:
/* F45FC4 8026A794 A7490012 */  sh         $t1, 0x12($k0)
/* F45FC8 8026A798 0C09AA09 */  jal        func_8026A824
/* F45FCC 8026A79C 24040050 */   addiu     $a0, $zero, 0x50
/* F45FD0 8026A7A0 10000001 */  b          redispatch
/* F45FD4 8026A7A4 00000000 */   nop
redispatch:
/* F45FD8 8026A7A8 3C0A8027 */  lui        $t2, %hi(__osRunQueue)
/* F45FDC 8026A7AC 8D4A7378 */  lw         $t2, %lo(__osRunQueue)($t2)
/* F45FE0 8026A7B0 8F490004 */  lw         $t1, 0x4($k0)
/* F45FE4 8026A7B4 8D4B0004 */  lw         $t3, 0x4($t2)
/* F45FE8 8026A7B8 012B082A */  slt        $at, $t1, $t3
/* F45FEC 8026A7BC 10200007 */  beqz       $at, enqueueRunning
/* F45FF0 8026A7C0 00000000 */   nop
/* F45FF4 8026A7C4 3C048027 */  lui        $a0, %hi(__osRunQueue)
/* F45FF8 8026A7C8 03402825 */  or         $a1, $k0, $zero
/* F45FFC 8026A7CC 0C09AA83 */  jal        __osEnqueueThread
/* F46000 8026A7D0 24847378 */   addiu     $a0, $a0, %lo(__osRunQueue)
/* F46004 8026A7D4 0809AA99 */  j          __osDispatchThread
/* F46008 8026A7D8 00000000 */   nop
enqueueRunning:
/* F4600C 8026A7DC 3C098027 */  lui        $t1, %hi(__osRunQueue)
/* F46010 8026A7E0 25297378 */  addiu      $t1, $t1, %lo(__osRunQueue)
/* F46014 8026A7E4 8D2A0000 */  lw         $t2, 0x0($t1)
/* F46018 8026A7E8 AF4A0000 */  sw         $t2, 0x0($k0)
/* F4601C 8026A7EC 0809AA99 */  j          __osDispatchThread
/* F46020 8026A7F0 AD3A0000 */   sw        $k0, 0x0($t1)
.L8026A7F4:
/* F46024 8026A7F4 3C018027 */  lui        $at, %hi(__osFaultedThread)
/* F46028 8026A7F8 AC3A7384 */  sw         $k0, %lo(__osFaultedThread)($at)
/* F4602C 8026A7FC 24090001 */  addiu      $t1, $zero, 0x1
/* F46030 8026A800 A7490010 */  sh         $t1, 0x10($k0)
/* F46034 8026A804 24090002 */  addiu      $t1, $zero, 0x2
/* F46038 8026A808 A7490012 */  sh         $t1, 0x12($k0)
/* F4603C 8026A80C 400A4000 */  mfc0       $t2, $8
/* F46040 8026A810 AF4A0124 */  sw         $t2, 0x124($k0)
/* F46044 8026A814 0C09AA09 */  jal        func_8026A824
/* F46048 8026A818 24040060 */   addiu     $a0, $zero, 0x60
/* F4604C 8026A81C 0809AA99 */  j          __osDispatchThread
/* F46050 8026A820 00000000 */   nop
endlabel func_8026A2E0

# Handwritten function
glabel func_8026A824
/* F46054 8026A824 3C0A8028 */  lui        $t2, %hi(__osEventStateTab)
/* F46058 8026A828 254A4660 */  addiu      $t2, $t2, %lo(__osEventStateTab)
/* F4605C 8026A82C 01445021 */  addu       $t2, $t2, $a0
/* F46060 8026A830 8D490000 */  lw         $t1, 0x0($t2)
/* F46064 8026A834 03E09025 */  or         $s2, $ra, $zero
/* F46068 8026A838 11200025 */  beqz       $t1, .L8026A8D0
/* F4606C 8026A83C 00000000 */   nop
/* F46070 8026A840 8D2B0008 */  lw         $t3, 0x8($t1)
/* F46074 8026A844 8D2C0010 */  lw         $t4, 0x10($t1)
/* F46078 8026A848 016C082A */  slt        $at, $t3, $t4
/* F4607C 8026A84C 10200020 */  beqz       $at, .L8026A8D0
/* F46080 8026A850 00000000 */   nop
/* F46084 8026A854 8D2D000C */  lw         $t5, 0xC($t1)
/* F46088 8026A858 01AB6821 */  addu       $t5, $t5, $t3
/* F4608C 8026A85C 01AC001A */  div        $zero, $t5, $t4
/* F46090 8026A860 15800002 */  bnez       $t4, .L8026A86C
/* F46094 8026A864 00000000 */   nop
/* F46098 8026A868 0007000D */  break      7
.L8026A86C:
/* F4609C 8026A86C 2401FFFF */  addiu      $at, $zero, -0x1
/* F460A0 8026A870 15810004 */  bne        $t4, $at, .L8026A884
/* F460A4 8026A874 3C018000 */   lui       $at, (0x80000000 >> 16)
/* F460A8 8026A878 15A10002 */  bne        $t5, $at, .L8026A884
/* F460AC 8026A87C 00000000 */   nop
/* F460B0 8026A880 0006000D */  break      6
.L8026A884:
/* F460B4 8026A884 8D2C0014 */  lw         $t4, 0x14($t1)
/* F460B8 8026A888 00006810 */  mfhi       $t5
/* F460BC 8026A88C 000D6880 */  sll        $t5, $t5, 2
/* F460C0 8026A890 018D6021 */  addu       $t4, $t4, $t5
/* F460C4 8026A894 8D4D0004 */  lw         $t5, 0x4($t2)
/* F460C8 8026A898 256A0001 */  addiu      $t2, $t3, 0x1
/* F460CC 8026A89C AD8D0000 */  sw         $t5, 0x0($t4)
/* F460D0 8026A8A0 AD2A0008 */  sw         $t2, 0x8($t1)
/* F460D4 8026A8A4 8D2A0000 */  lw         $t2, 0x0($t1)
/* F460D8 8026A8A8 8D4B0000 */  lw         $t3, 0x0($t2)
/* F460DC 8026A8AC 11600008 */  beqz       $t3, .L8026A8D0
/* F460E0 8026A8B0 00000000 */   nop
/* F460E4 8026A8B4 0C09AA95 */  jal        __osPopThread
/* F460E8 8026A8B8 01202025 */   or        $a0, $t1, $zero
/* F460EC 8026A8BC 00405025 */  or         $t2, $v0, $zero
/* F460F0 8026A8C0 3C048027 */  lui        $a0, %hi(__osRunQueue)
/* F460F4 8026A8C4 01402825 */  or         $a1, $t2, $zero
/* F460F8 8026A8C8 0C09AA83 */  jal        __osEnqueueThread
/* F460FC 8026A8CC 24847378 */   addiu     $a0, $a0, %lo(__osRunQueue)
.L8026A8D0:
/* F46100 8026A8D0 02400008 */  jr         $s2
/* F46104 8026A8D4 00000000 */   nop
.L8026A8D8:
/* F46108 8026A8D8 3C013000 */  lui        $at, (0x30000000 >> 16)
/* F4610C 8026A8DC 01014824 */  and        $t1, $t0, $at
/* F46110 8026A8E0 00094F02 */  srl        $t1, $t1, 28
/* F46114 8026A8E4 240A0001 */  addiu      $t2, $zero, 0x1
/* F46118 8026A8E8 152AFFC2 */  bne        $t1, $t2, .L8026A7F4
/* F4611C 8026A8EC 00000000 */   nop
/* F46120 8026A8F0 8F5B0118 */  lw         $k1, 0x118($k0)
/* F46124 8026A8F4 3C012000 */  lui        $at, (0x20000000 >> 16)
/* F46128 8026A8F8 24090001 */  addiu      $t1, $zero, 0x1
/* F4612C 8026A8FC 0361D825 */  or         $k1, $k1, $at
/* F46130 8026A900 AF490018 */  sw         $t1, 0x18($k0)
/* F46134 8026A904 1000FFB5 */  b          enqueueRunning
/* F46138 8026A908 AF5B0118 */   sw        $k1, 0x118($k0)
endlabel func_8026A824

# Handwritten function
glabel __osEnqueueAndYield
/* F4613C 8026A90C 3C058027 */  lui        $a1, %hi(__osRunningThread)
/* F46140 8026A910 8CA57380 */  lw         $a1, %lo(__osRunningThread)($a1)
/* F46144 8026A914 40086000 */  mfc0       $t0, $12
/* F46148 8026A918 8CBB0018 */  lw         $k1, 0x18($a1)
/* F4614C 8026A91C 35080002 */  ori        $t0, $t0, 0x2
/* F46150 8026A920 ACA80118 */  sw         $t0, 0x118($a1)
/* F46154 8026A924 FCB00098 */  sd         $s0, 0x98($a1)
/* F46158 8026A928 FCB100A0 */  sd         $s1, 0xA0($a1)
/* F4615C 8026A92C FCB200A8 */  sd         $s2, 0xA8($a1)
/* F46160 8026A930 FCB300B0 */  sd         $s3, 0xB0($a1)
/* F46164 8026A934 FCB400B8 */  sd         $s4, 0xB8($a1)
/* F46168 8026A938 FCB500C0 */  sd         $s5, 0xC0($a1)
/* F4616C 8026A93C FCB600C8 */  sd         $s6, 0xC8($a1)
/* F46170 8026A940 FCB700D0 */  sd         $s7, 0xD0($a1)
/* F46174 8026A944 FCBC00E8 */  sd         $gp, 0xE8($a1)
/* F46178 8026A948 FCBD00F0 */  sd         $sp, 0xF0($a1)
/* F4617C 8026A94C FCBE00F8 */  sd         $fp, 0xF8($a1)
/* F46180 8026A950 FCBF0100 */  sd         $ra, 0x100($a1)
/* F46184 8026A954 13600009 */  beqz       $k1, .L8026A97C
/* F46188 8026A958 ACBF011C */   sw        $ra, 0x11C($a1)
/* F4618C 8026A95C 445BF800 */  cfc1       $k1, $31
/* F46190 8026A960 F4B40180 */  sdc1       $f20, 0x180($a1)
/* F46194 8026A964 F4B60188 */  sdc1       $f22, 0x188($a1)
/* F46198 8026A968 F4B80190 */  sdc1       $f24, 0x190($a1)
/* F4619C 8026A96C F4BA0198 */  sdc1       $f26, 0x198($a1)
/* F461A0 8026A970 F4BC01A0 */  sdc1       $f28, 0x1A0($a1)
/* F461A4 8026A974 F4BE01A8 */  sdc1       $f30, 0x1A8($a1)
/* F461A8 8026A978 ACBB012C */  sw         $k1, 0x12C($a1)
.L8026A97C:
/* F461AC 8026A97C 8CBB0118 */  lw         $k1, 0x118($a1)
/* F461B0 8026A980 3369FF00 */  andi       $t1, $k1, 0xFF00
/* F461B4 8026A984 5120000E */  beql       $t1, $zero, .L8026A9C0
/* F461B8 8026A988 3C1BA430 */   lui       $k1, %hi(D_A430000C)
/* F461BC 8026A98C 3C088027 */  lui        $t0, %hi(__OSGlobalIntMask)
/* F461C0 8026A990 25087130 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* F461C4 8026A994 8D080000 */  lw         $t0, 0x0($t0)
/* F461C8 8026A998 2401FFFF */  addiu      $at, $zero, -0x1
/* F461CC 8026A99C 01014026 */  xor        $t0, $t0, $at
/* F461D0 8026A9A0 3C01FFFF */  lui        $at, (0xFFFF00FF >> 16)
/* F461D4 8026A9A4 3108FF00 */  andi       $t0, $t0, 0xFF00
/* F461D8 8026A9A8 342100FF */  ori        $at, $at, (0xFFFF00FF & 0xFFFF)
/* F461DC 8026A9AC 01284825 */  or         $t1, $t1, $t0
/* F461E0 8026A9B0 0361D824 */  and        $k1, $k1, $at
/* F461E4 8026A9B4 0369D825 */  or         $k1, $k1, $t1
/* F461E8 8026A9B8 ACBB0118 */  sw         $k1, 0x118($a1)
/* F461EC 8026A9BC 3C1BA430 */  lui        $k1, %hi(D_A430000C)
.L8026A9C0:
/* F461F0 8026A9C0 8F7B000C */  lw         $k1, %lo(D_A430000C)($k1)
/* F461F4 8026A9C4 1360000B */  beqz       $k1, .L8026A9F4
/* F461F8 8026A9C8 00000000 */   nop
/* F461FC 8026A9CC 3C1A8027 */  lui        $k0, %hi(__OSGlobalIntMask)
/* F46200 8026A9D0 275A7130 */  addiu      $k0, $k0, %lo(__OSGlobalIntMask)
/* F46204 8026A9D4 8F5A0000 */  lw         $k0, 0x0($k0)
/* F46208 8026A9D8 8CA80128 */  lw         $t0, 0x128($a1)
/* F4620C 8026A9DC 2401FFFF */  addiu      $at, $zero, -0x1
/* F46210 8026A9E0 001AD402 */  srl        $k0, $k0, 16
/* F46214 8026A9E4 0341D026 */  xor        $k0, $k0, $at
/* F46218 8026A9E8 335A003F */  andi       $k0, $k0, 0x3F
/* F4621C 8026A9EC 0348D024 */  and        $k0, $k0, $t0
/* F46220 8026A9F0 037AD825 */  or         $k1, $k1, $k0
.L8026A9F4:
/* F46224 8026A9F4 10800003 */  beqz       $a0, .L8026AA04
/* F46228 8026A9F8 ACBB0128 */   sw        $k1, 0x128($a1)
/* F4622C 8026A9FC 0C09AA83 */  jal        __osEnqueueThread
/* F46230 8026AA00 00000000 */   nop
.L8026AA04:
/* F46234 8026AA04 0809AA99 */  j          __osDispatchThread
/* F46238 8026AA08 00000000 */   nop
endlabel __osEnqueueAndYield

glabel __osEnqueueThread
/* F4623C 8026AA0C 8C980000 */  lw         $t8, 0x0($a0)
/* F46240 8026AA10 8CAF0004 */  lw         $t7, 0x4($a1)
/* F46244 8026AA14 0080C825 */  or         $t9, $a0, $zero
/* F46248 8026AA18 8F0E0004 */  lw         $t6, 0x4($t8)
/* F4624C 8026AA1C 01CF082A */  slt        $at, $t6, $t7
/* F46250 8026AA20 54200008 */  bnel       $at, $zero, .L8026AA44
/* F46254 8026AA24 8F380000 */   lw        $t8, 0x0($t9)
/* F46258 8026AA28 0300C825 */  or         $t9, $t8, $zero
.L8026AA2C:
/* F4625C 8026AA2C 8F180000 */  lw         $t8, 0x0($t8)
/* F46260 8026AA30 8F0E0004 */  lw         $t6, 0x4($t8)
/* F46264 8026AA34 01CF082A */  slt        $at, $t6, $t7
/* F46268 8026AA38 5020FFFC */  beql       $at, $zero, .L8026AA2C
/* F4626C 8026AA3C 0300C825 */   or        $t9, $t8, $zero
/* F46270 8026AA40 8F380000 */  lw         $t8, 0x0($t9)
.L8026AA44:
/* F46274 8026AA44 ACB80000 */  sw         $t8, 0x0($a1)
/* F46278 8026AA48 AF250000 */  sw         $a1, 0x0($t9)
/* F4627C 8026AA4C 03E00008 */  jr         $ra
/* F46280 8026AA50 ACA40008 */   sw        $a0, 0x8($a1)
endlabel __osEnqueueThread

glabel __osPopThread
/* F46284 8026AA54 8C820000 */  lw         $v0, 0x0($a0)
/* F46288 8026AA58 8C590000 */  lw         $t9, 0x0($v0)
/* F4628C 8026AA5C 03E00008 */  jr         $ra
/* F46290 8026AA60 AC990000 */   sw        $t9, 0x0($a0)
endlabel __osPopThread

# Handwritten function
glabel __osDispatchThread
/* F46294 8026AA64 3C048027 */  lui        $a0, %hi(__osRunQueue)
/* F46298 8026AA68 0C09AA95 */  jal        __osPopThread
/* F4629C 8026AA6C 24847378 */   addiu     $a0, $a0, %lo(__osRunQueue)
/* F462A0 8026AA70 3C018027 */  lui        $at, %hi(__osRunningThread)
/* F462A4 8026AA74 AC227380 */  sw         $v0, %lo(__osRunningThread)($at)
/* F462A8 8026AA78 24080004 */  addiu      $t0, $zero, 0x4
/* F462AC 8026AA7C A4480010 */  sh         $t0, 0x10($v0)
/* F462B0 8026AA80 0040D025 */  or         $k0, $v0, $zero
/* F462B4 8026AA84 3C088027 */  lui        $t0, %hi(__OSGlobalIntMask)
/* F462B8 8026AA88 8F5B0118 */  lw         $k1, 0x118($k0)
/* F462BC 8026AA8C 25087130 */  addiu      $t0, $t0, %lo(__OSGlobalIntMask)
/* F462C0 8026AA90 8D080000 */  lw         $t0, 0x0($t0)
/* F462C4 8026AA94 3C01FFFF */  lui        $at, (0xFFFF00FF >> 16)
/* F462C8 8026AA98 3369FF00 */  andi       $t1, $k1, 0xFF00
/* F462CC 8026AA9C 342100FF */  ori        $at, $at, (0xFFFF00FF & 0xFFFF)
/* F462D0 8026AAA0 3108FF00 */  andi       $t0, $t0, 0xFF00
/* F462D4 8026AAA4 01284824 */  and        $t1, $t1, $t0
/* F462D8 8026AAA8 0361D824 */  and        $k1, $k1, $at
/* F462DC 8026AAAC 0369D825 */  or         $k1, $k1, $t1
/* F462E0 8026AAB0 409B6000 */  mtc0       $k1, $12
/* F462E4 8026AAB4 DF5B0108 */  ld         $k1, 0x108($k0)
/* F462E8 8026AAB8 DF410020 */  ld         $at, 0x20($k0)
/* F462EC 8026AABC DF420028 */  ld         $v0, 0x28($k0)
/* F462F0 8026AAC0 03600013 */  mtlo       $k1
/* F462F4 8026AAC4 DF5B0110 */  ld         $k1, 0x110($k0)
/* F462F8 8026AAC8 DF430030 */  ld         $v1, 0x30($k0)
/* F462FC 8026AACC DF440038 */  ld         $a0, 0x38($k0)
/* F46300 8026AAD0 DF450040 */  ld         $a1, 0x40($k0)
/* F46304 8026AAD4 DF460048 */  ld         $a2, 0x48($k0)
/* F46308 8026AAD8 DF470050 */  ld         $a3, 0x50($k0)
/* F4630C 8026AADC DF480058 */  ld         $t0, 0x58($k0)
/* F46310 8026AAE0 DF490060 */  ld         $t1, 0x60($k0)
/* F46314 8026AAE4 DF4A0068 */  ld         $t2, 0x68($k0)
/* F46318 8026AAE8 DF4B0070 */  ld         $t3, 0x70($k0)
/* F4631C 8026AAEC DF4C0078 */  ld         $t4, 0x78($k0)
/* F46320 8026AAF0 DF4D0080 */  ld         $t5, 0x80($k0)
/* F46324 8026AAF4 DF4E0088 */  ld         $t6, 0x88($k0)
/* F46328 8026AAF8 DF4F0090 */  ld         $t7, 0x90($k0)
/* F4632C 8026AAFC DF500098 */  ld         $s0, 0x98($k0)
/* F46330 8026AB00 DF5100A0 */  ld         $s1, 0xA0($k0)
/* F46334 8026AB04 DF5200A8 */  ld         $s2, 0xA8($k0)
/* F46338 8026AB08 DF5300B0 */  ld         $s3, 0xB0($k0)
/* F4633C 8026AB0C DF5400B8 */  ld         $s4, 0xB8($k0)
/* F46340 8026AB10 DF5500C0 */  ld         $s5, 0xC0($k0)
/* F46344 8026AB14 DF5600C8 */  ld         $s6, 0xC8($k0)
/* F46348 8026AB18 DF5700D0 */  ld         $s7, 0xD0($k0)
/* F4634C 8026AB1C DF5800D8 */  ld         $t8, 0xD8($k0)
/* F46350 8026AB20 DF5900E0 */  ld         $t9, 0xE0($k0)
/* F46354 8026AB24 DF5C00E8 */  ld         $gp, 0xE8($k0)
/* F46358 8026AB28 03600011 */  mthi       $k1
/* F4635C 8026AB2C DF5D00F0 */  ld         $sp, 0xF0($k0)
/* F46360 8026AB30 DF5E00F8 */  ld         $fp, 0xF8($k0)
/* F46364 8026AB34 DF5F0100 */  ld         $ra, 0x100($k0)
/* F46368 8026AB38 8F5B011C */  lw         $k1, 0x11C($k0)
/* F4636C 8026AB3C 409B7000 */  mtc0       $k1, $14
/* F46370 8026AB40 8F5B0018 */  lw         $k1, 0x18($k0)
/* F46374 8026AB44 13600013 */  beqz       $k1, .L8026AB94
/* F46378 8026AB48 00000000 */   nop
/* F4637C 8026AB4C 8F5B012C */  lw         $k1, 0x12C($k0)
/* F46380 8026AB50 44DBF800 */  ctc1       $k1, $31
/* F46384 8026AB54 D7400130 */  ldc1       $f0, 0x130($k0)
/* F46388 8026AB58 D7420138 */  ldc1       $f2, 0x138($k0)
/* F4638C 8026AB5C D7440140 */  ldc1       $f4, 0x140($k0)
/* F46390 8026AB60 D7460148 */  ldc1       $f6, 0x148($k0)
/* F46394 8026AB64 D7480150 */  ldc1       $f8, 0x150($k0)
/* F46398 8026AB68 D74A0158 */  ldc1       $f10, 0x158($k0)
/* F4639C 8026AB6C D74C0160 */  ldc1       $f12, 0x160($k0)
/* F463A0 8026AB70 D74E0168 */  ldc1       $f14, 0x168($k0)
/* F463A4 8026AB74 D7500170 */  ldc1       $f16, 0x170($k0)
/* F463A8 8026AB78 D7520178 */  ldc1       $f18, 0x178($k0)
/* F463AC 8026AB7C D7540180 */  ldc1       $f20, 0x180($k0)
/* F463B0 8026AB80 D7560188 */  ldc1       $f22, 0x188($k0)
/* F463B4 8026AB84 D7580190 */  ldc1       $f24, 0x190($k0)
/* F463B8 8026AB88 D75A0198 */  ldc1       $f26, 0x198($k0)
/* F463BC 8026AB8C D75C01A0 */  ldc1       $f28, 0x1A0($k0)
/* F463C0 8026AB90 D75E01A8 */  ldc1       $f30, 0x1A8($k0)
.L8026AB94:
/* F463C4 8026AB94 8F5B0128 */  lw         $k1, 0x128($k0)
/* F463C8 8026AB98 3C1A8027 */  lui        $k0, %hi(__OSGlobalIntMask)
/* F463CC 8026AB9C 275A7130 */  addiu      $k0, $k0, %lo(__OSGlobalIntMask)
/* F463D0 8026ABA0 8F5A0000 */  lw         $k0, 0x0($k0)
/* F463D4 8026ABA4 001AD402 */  srl        $k0, $k0, 16
/* F463D8 8026ABA8 037AD824 */  and        $k1, $k1, $k0
/* F463DC 8026ABAC 001BD840 */  sll        $k1, $k1, 1
/* F463E0 8026ABB0 3C1A8028 */  lui        $k0, %hi(__osRcpImTable)
/* F463E4 8026ABB4 275A8C60 */  addiu      $k0, $k0, %lo(__osRcpImTable)
/* F463E8 8026ABB8 037AD821 */  addu       $k1, $k1, $k0
/* F463EC 8026ABBC 977B0000 */  lhu        $k1, 0x0($k1)
/* F463F0 8026ABC0 3C1AA430 */  lui        $k0, %hi(D_A430000C)
/* F463F4 8026ABC4 275A000C */  addiu      $k0, $k0, %lo(D_A430000C)
/* F463F8 8026ABC8 AF5B0000 */  sw         $k1, 0x0($k0)
/* F463FC 8026ABCC 00000000 */  nop
/* F46400 8026ABD0 00000000 */  nop
/* F46404 8026ABD4 00000000 */  nop
/* F46408 8026ABD8 00000000 */  nop
/* F4640C 8026ABDC 42000018 */  eret
endlabel __osDispatchThread

glabel __osCleanupThread
/* F46410 8026ABE0 0C09936C */  jal        osDestroyThread
/* F46414 8026ABE4 00002025 */   or        $a0, $zero, $zero
/* F46418 8026ABE8 00000000 */  nop
/* F4641C 8026ABEC 00000000 */  nop
endlabel __osCleanupThread

# Handwritten function
glabel osMapTLBRdb
/* F46420 8026ABF0 40085000 */  mfc0       $t0, $10
/* F46424 8026ABF4 2409001F */  addiu      $t1, $zero, 0x1F
/* F46428 8026ABF8 40890000 */  mtc0       $t1, $0
/* F4642C 8026ABFC 40802800 */  mtc0       $zero, $5
/* F46430 8026AC00 240A0017 */  addiu      $t2, $zero, 0x17
/* F46434 8026AC04 3C09C000 */  lui        $t1, (0xC0000000 >> 16)
/* F46438 8026AC08 40895000 */  mtc0       $t1, $10
/* F4643C 8026AC0C 3C098000 */  lui        $t1, (0x80000000 >> 16)
/* F46440 8026AC10 00095982 */  srl        $t3, $t1, 6
/* F46444 8026AC14 016A5825 */  or         $t3, $t3, $t2
/* F46448 8026AC18 408B1000 */  mtc0       $t3, $2
/* F4644C 8026AC1C 24090001 */  addiu      $t1, $zero, 0x1
/* F46450 8026AC20 40891800 */  mtc0       $t1, $3
/* F46454 8026AC24 00000000 */  nop
/* F46458 8026AC28 42000002 */  tlbwi
/* F4645C 8026AC2C 00000000 */  nop
/* F46460 8026AC30 00000000 */  nop
/* F46464 8026AC34 00000000 */  nop
/* F46468 8026AC38 00000000 */  nop
/* F4646C 8026AC3C 40885000 */  mtc0       $t0, $10
/* F46470 8026AC40 03E00008 */  jr         $ra
/* F46474 8026AC44 00000000 */   nop
/* F46478 8026AC48 00000000 */  nop
/* F4647C 8026AC4C 00000000 */  nop
endlabel osMapTLBRdb
