	.cpu cortex-m0
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"time.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.timer_reset,"ax",%progbits
	.align	1
	.global	timer_reset
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	timer_reset, %function
timer_reset:
.LFB33:
	.file 1 "arch/m0/src/time.c"
	.loc 1 20 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 22 0
	ldr	r3, .L2
	movs	r2, #99
	str	r2, [r3, #4]
	.loc 1 23 0
	ldr	r2, .L2
	ldr	r3, .L2
	ldr	r2, [r2, #4]
	str	r2, [r3, #8]
	.loc 1 24 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	-536813552
	.cfi_endproc
.LFE33:
	.size	timer_reset, .-timer_reset
	.section	.text.timer_measure,"ax",%progbits
	.align	1
	.global	timer_measure
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	timer_measure, %function
timer_measure:
.LFB34:
	.loc 1 26 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 30 0
	ldr	r3, .L6
	ldr	r2, [r3, #4]
	ldr	r3, .L6
	ldr	r3, [r3, #8]
	subs	r3, r2, r3
	str	r3, [r7, #4]
	.loc 1 31 0
	ldr	r3, [r7, #4]
	.loc 1 32 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	-536813552
	.cfi_endproc
.LFE34:
	.size	timer_measure, .-timer_measure
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Paulin was here\012\000"
	.align	2
.LC2:
	.ascii	"t1 = %d\012\000"
	.align	2
.LC4:
	.ascii	"t2 = %d\012\000"
	.section	.text.time_run_c,"ax",%progbits
	.align	1
	.global	time_run_c
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	time_run_c, %function
time_run_c:
.LFB35:
	.loc 1 34 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 39 0
	movs	r3, #1
	str	r3, [r7, #12]
	.loc 1 40 0
	movs	r3, #12
	str	r3, [r7, #8]
	.loc 1 42 0
	ldr	r3, .L9
	ldr	r2, [r3]
	ldr	r3, .L9
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 43 0
	.syntax divided
@ 43 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 44 0
	.thumb
	.syntax unified
	bl	timer_reset
	.loc 1 45 0
	.syntax divided
@ 45 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 46 0
	.thumb
	.syntax unified
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	_input_code
	.loc 1 47 0
	.syntax divided
@ 47 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 48 0
	.thumb
	.syntax unified
	bl	timer_measure
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 49 0
	.syntax divided
@ 49 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 51 0
@ 51 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 52 0
	.thumb
	.syntax unified
	bl	timer_reset
	.loc 1 53 0
	.syntax divided
@ 53 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 54 0
	.thumb
	.syntax unified
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	_input_code
	.loc 1 55 0
	.syntax divided
@ 55 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 56 0
	.thumb
	.syntax unified
	bl	timer_measure
	movs	r3, r0
	str	r3, [r7]
	.loc 1 57 0
	.syntax divided
@ 57 "arch/m0/src/time.c" 1
	DMB 	
 DSB 	
 ISB 	

@ 0 "" 2
	.loc 1 59 0
	.thumb
	.syntax unified
	ldr	r3, .L9+4
	movs	r0, r3
	bl	printf
	.loc 1 60 0
	ldr	r2, [r7, #4]
	ldr	r3, .L9+8
	movs	r1, r2
	movs	r0, r3
	bl	printf
	.loc 1 61 0
	ldr	r2, [r7]
	ldr	r3, .L9+12
	movs	r1, r2
	movs	r0, r3
	bl	printf
	.loc 1 62 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	-536813552
	.word	.LC0
	.word	.LC2
	.word	.LC4
	.cfi_endproc
.LFE35:
	.size	time_run_c, .-time_run_c
	.section	.rodata
	.align	2
.LC6:
	.ascii	"%d\012\000"
	.section	.text.run_time_experiment,"ax",%progbits
	.align	1
	.global	run_time_experiment
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	run_time_experiment, %function
run_time_experiment:
.LFB36:
	.loc 1 66 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 67 0
	bl	_time_run
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 69 0
	ldr	r2, [r7, #4]
	ldr	r3, .L12
	movs	r1, r2
	movs	r0, r3
	bl	printf
	.loc 1 70 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	.LC6
	.cfi_endproc
.LFE36:
	.size	run_time_experiment, .-run_time_experiment
	.text
.Letext0:
	.file 2 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "libs/CMSIS_CORE_LPC11xx/inc/core_cm0.h"
	.file 5 "libs/CMSIS_CORE_LPC11xx/inc/system_LPC11xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x195
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF782
	.byte	0xc
	.4byte	.LASF783
	.4byte	.LASF784
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF763
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF764
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF765
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF766
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF767
	.uleb128 0x3
	.4byte	.LASF772
	.byte	0x2
	.byte	0x4f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF768
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF769
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF770
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF771
	.uleb128 0x3
	.4byte	.LASF773
	.byte	0x3
	.byte	0x30
	.4byte	0x4c
	.uleb128 0x5
	.4byte	0x7a
	.uleb128 0x6
	.4byte	0x85
	.uleb128 0x7
	.byte	0x10
	.byte	0x4
	.2byte	0x19a
	.4byte	0xcd
	.uleb128 0x8
	.4byte	.LASF774
	.byte	0x4
	.2byte	0x19c
	.4byte	0x85
	.byte	0
	.uleb128 0x8
	.4byte	.LASF775
	.byte	0x4
	.2byte	0x19d
	.4byte	0x85
	.byte	0x4
	.uleb128 0x9
	.ascii	"VAL\000"
	.byte	0x4
	.2byte	0x19e
	.4byte	0x85
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF776
	.byte	0x4
	.2byte	0x19f
	.4byte	0x8a
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.4byte	.LASF777
	.byte	0x4
	.2byte	0x1a0
	.4byte	0x8f
	.uleb128 0xb
	.4byte	.LASF785
	.byte	0x5
	.byte	0x23
	.4byte	0x7a
	.uleb128 0xc
	.4byte	.LASF780
	.byte	0x1
	.byte	0x41
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x108
	.uleb128 0xd
	.ascii	"res\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF786
	.byte	0x1
	.byte	0x22
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x161
	.uleb128 0xd
	.ascii	"t1\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"t2\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF778
	.byte	0x1
	.byte	0x27
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF779
	.byte	0x1
	.byte	0x28
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF787
	.byte	0x1
	.byte	0x2e
	.4byte	0x6c
	.uleb128 0x11
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF781
	.byte	0x1
	.byte	0x1a
	.4byte	0x7a
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x187
	.uleb128 0xd
	.ascii	"t\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF788
	.byte	0x1
	.byte	0x14
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.file 6 "all/inc/lib/printf.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF437
	.file 7 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/lib/gcc/arm-none-eabi/7.3.1/include/stdarg.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x7
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x4
	.file 8 "libs/CMSIS_CORE_LPC11xx/inc/LPC11xx.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x3
	.uleb128 0x76
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.file 9 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/lib/gcc/arm-none-eabi/7.3.1/include/stdint.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x9
	.file 10 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0xa
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF465
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF466
	.file 11 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/sys/features.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF467
	.file 12 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/_newlib_version.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xc
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.file 13 "/home/holba/tutorial/HolBA_opt/gcc-arm-none-eabi-7-2018-q2u/arm-none-eabi/include/sys/_intsup.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF620
	.byte	0x4
	.file 14 "libs/CMSIS_CORE_LPC11xx/inc/core_cmInstr.h"
	.byte	0x3
	.uleb128 0x7f
	.uleb128 0xe
	.byte	0x7
	.4byte	.Ldebug_macro11
	.byte	0x4
	.file 15 "libs/CMSIS_CORE_LPC11xx/inc/core_cmFunc.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0xf
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF625
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF708
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x4
	.byte	0x4
	.file 16 "all/inc/config.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF752
	.file 17 "all/inc/config_input.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF762
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.39ff90e0deb08411cc234f46fc72d878,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0
	.4byte	.LASF389
	.byte	0x6
	.uleb128 0
	.4byte	.LASF390
	.byte	0x6
	.uleb128 0
	.4byte	.LASF391
	.byte	0x6
	.uleb128 0
	.4byte	.LASF392
	.byte	0x6
	.uleb128 0
	.4byte	.LASF393
	.byte	0x6
	.uleb128 0
	.4byte	.LASF394
	.byte	0x6
	.uleb128 0
	.4byte	.LASF395
	.byte	0x6
	.uleb128 0
	.4byte	.LASF396
	.byte	0x6
	.uleb128 0
	.4byte	.LASF397
	.byte	0x6
	.uleb128 0
	.4byte	.LASF398
	.byte	0x6
	.uleb128 0
	.4byte	.LASF399
	.byte	0x6
	.uleb128 0
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0
	.4byte	.LASF407
	.byte	0x6
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0
	.4byte	.LASF413
	.byte	0x6
	.uleb128 0
	.4byte	.LASF414
	.byte	0x6
	.uleb128 0
	.4byte	.LASF415
	.byte	0x6
	.uleb128 0
	.4byte	.LASF416
	.byte	0x6
	.uleb128 0
	.4byte	.LASF417
	.byte	0x6
	.uleb128 0
	.4byte	.LASF418
	.byte	0x6
	.uleb128 0
	.4byte	.LASF419
	.byte	0x6
	.uleb128 0
	.4byte	.LASF420
	.byte	0x6
	.uleb128 0
	.4byte	.LASF421
	.byte	0x6
	.uleb128 0
	.4byte	.LASF422
	.byte	0x6
	.uleb128 0
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0
	.4byte	.LASF427
	.byte	0x6
	.uleb128 0
	.4byte	.LASF428
	.byte	0x6
	.uleb128 0
	.4byte	.LASF429
	.byte	0x6
	.uleb128 0
	.4byte	.LASF430
	.byte	0x6
	.uleb128 0
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0
	.4byte	.LASF436
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.31.b55da1089056868966f25de5dbfc7d3c,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF439
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF451
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.LPC11xx.h.31.3390084d921aa84aa1be2fe419ae7159,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF455
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.core_cm0.h.47.022e66414e77714da7c4b30b3ad99fe8,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF464
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._newlib_version.h.4.875b979a44719054cd750d0952ad3fd6,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF472
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.features.h.33.5bd1eea2d80518b50f7af0b5ce6750e0,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF474
	.byte	0x6
	.uleb128 0x83
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF476
	.byte	0x6
	.uleb128 0x88
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF478
	.byte	0x6
	.uleb128 0x8a
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF480
	.byte	0x6
	.uleb128 0x9e
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF492
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._default_types.h.15.247e5cd201eca3442cbf5404108c4935,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF503
	.byte	0x6
	.uleb128 0xf4
	.4byte	.LASF504
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._intsup.h.10.cce27fed8484c08a33f522034c30d2b5,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF506
	.byte	0x6
	.uleb128 0x2a
	.4byte	.LASF507
	.byte	0x6
	.uleb128 0x2b
	.4byte	.LASF508
	.byte	0x6
	.uleb128 0x2c
	.4byte	.LASF509
	.byte	0x6
	.uleb128 0x2d
	.4byte	.LASF510
	.byte	0x2
	.uleb128 0x2e
	.ascii	"int\000"
	.byte	0x6
	.uleb128 0x2f
	.4byte	.LASF511
	.byte	0x6
	.uleb128 0x30
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF533
	.byte	0x6
	.uleb128 0xb5
	.4byte	.LASF507
	.byte	0x6
	.uleb128 0xb6
	.4byte	.LASF508
	.byte	0x6
	.uleb128 0xb7
	.4byte	.LASF509
	.byte	0x6
	.uleb128 0xb8
	.4byte	.LASF510
	.byte	0x2
	.uleb128 0xb9
	.ascii	"int\000"
	.byte	0x6
	.uleb128 0xba
	.4byte	.LASF512
	.byte	0x6
	.uleb128 0xbf
	.4byte	.LASF511
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._stdint.h.10.c24fa3af3bc1706662bb5593a907e841,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF550
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.23.d53047a68f4a85177f80b422d52785ed,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF619
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.core_cmInstr.h.39.b7b6650bdd2316848d940915272d75b8,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF624
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.core_cm0.h.135.ca70469f87e143609670bb393bfa6518,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x165
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x1a3
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x1a9
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x1aa
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x1ad
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x1b5
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x1b8
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x1b9
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x1bb
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x1be
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x1d6
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x1d8
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x1dc
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x1f8
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x1f9
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF707
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.LPC11xx.h.541.5f9e1951825967e9bd1a077ddff9701f,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x21d
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x21e
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x220
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x223
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x225
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x226
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x228
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x22c
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x22d
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x22f
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x230
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x234
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x235
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x236
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x238
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x23d
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x23e
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x23f
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x240
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x241
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x242
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x243
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x244
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x245
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x246
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x247
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x24a
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x24b
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x24c
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x24d
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x24e
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x24f
	.4byte	.LASF751
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.config_input.h.1.c2aca166f127b6c75ebc405a2350a4ce,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF758
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.config.h.23.04fcad6c953d7f6efc3d94c7912d82b4,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF761
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF181:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF361:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF730:
	.ascii	"LPC_GPIO1_BASE (LPC_AHB_BASE + 0x10000)\000"
.LASF517:
	.ascii	"__int20 +2\000"
.LASF251:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF91:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF214:
	.ascii	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64\000"
.LASF700:
	.ascii	"NVIC_BASE (SCS_BASE + 0x0100UL)\000"
.LASF378:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF373:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF253:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF758:
	.ascii	"__PROGPLAT_MUL_RUNS__ 10\000"
.LASF216:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF325:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF345:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF317:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF79:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF565:
	.ascii	"INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)\000"
.LASF542:
	.ascii	"_UINT32_T_DECLARED \000"
.LASF90:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF238:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF342:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF210:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF667:
	.ascii	"SCB_AIRCR_VECTCLRACTIVE_Msk (1UL << SCB_AIRCR_VECTC"
	.ascii	"LRACTIVE_Pos)\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF318:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF75:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF635:
	.ascii	"SCB_CPUID_ARCHITECTURE_Msk (0xFUL << SCB_CPUID_ARCH"
	.ascii	"ITECTURE_Pos)\000"
.LASF391:
	.ascii	"__ARM_FEATURE_QBIT\000"
.LASF763:
	.ascii	"signed char\000"
.LASF637:
	.ascii	"SCB_CPUID_PARTNO_Msk (0xFFFUL << SCB_CPUID_PARTNO_P"
	.ascii	"os)\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF166:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF624:
	.ascii	"__BKPT(value) __ASM volatile (\"bkpt \"#value)\000"
.LASF265:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF489:
	.ascii	"__POSIX_VISIBLE 200809\000"
.LASF301:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF235:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF640:
	.ascii	"SCB_ICSR_NMIPENDSET_Pos 31\000"
.LASF338:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF241:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF677:
	.ascii	"SCB_CCR_UNALIGN_TRP_Msk (1UL << SCB_CCR_UNALIGN_TRP"
	.ascii	"_Pos)\000"
.LASF594:
	.ascii	"UINT_FAST32_MAX (__UINT_FAST32_MAX__)\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF198:
	.ascii	"__FLT32_MIN__ 1.1754943508222875e-38F32\000"
.LASF647:
	.ascii	"SCB_ICSR_PENDSTSET_Msk (1UL << SCB_ICSR_PENDSTSET_P"
	.ascii	"os)\000"
.LASF300:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF196:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF76:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF177:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF491:
	.ascii	"__XSI_VISIBLE 0\000"
.LASF175:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF119:
	.ascii	"__UINT8_C(c) c\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF211:
	.ascii	"__FLT64_MAX__ 1.7976931348623157e+308F64\000"
.LASF522:
	.ascii	"__INT8 \"hh\"\000"
.LASF572:
	.ascii	"INT_LEAST16_MAX (__INT_LEAST16_MAX__)\000"
.LASF590:
	.ascii	"INT_FAST16_MAX (__INT_FAST16_MAX__)\000"
.LASF288:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF646:
	.ascii	"SCB_ICSR_PENDSTSET_Pos 26\000"
.LASF563:
	.ascii	"INT8_MAX (__INT8_MAX__)\000"
.LASF604:
	.ascii	"PTRDIFF_MAX (__PTRDIFF_MAX__)\000"
.LASF195:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF261:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF682:
	.ascii	"SysTick_CTRL_CLKSOURCE_Pos 2\000"
.LASF140:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF192:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF726:
	.ascii	"LPC_CAN_BASE (LPC_APB0_BASE + 0x50000)\000"
.LASF625:
	.ascii	"__CORE_CMFUNC_H \000"
.LASF662:
	.ascii	"SCB_AIRCR_ENDIANESS_Pos 15\000"
.LASF656:
	.ascii	"SCB_ICSR_VECTACTIVE_Pos 0\000"
.LASF569:
	.ascii	"INT16_MAX (__INT16_MAX__)\000"
.LASF751:
	.ascii	"LPC_GPIO3 ((LPC_GPIO_TypeDef *) LPC_GPIO3_BASE )\000"
.LASF86:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF278:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF207:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF557:
	.ascii	"__int_fast32_t_defined 1\000"
.LASF133:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF737:
	.ascii	"LPC_TMR16B1 ((LPC_TMR_TypeDef *) LPC_CT16B1_BASE)\000"
.LASF313:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF612:
	.ascii	"INT16_C(x) __INT16_C(x)\000"
.LASF257:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF714:
	.ascii	"LPC_WDT_BASE (LPC_APB0_BASE + 0x04000)\000"
.LASF113:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF347:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF298:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF337:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF562:
	.ascii	"INT8_MIN (-__INT8_MAX__ - 1)\000"
.LASF534:
	.ascii	"_SYS__STDINT_H \000"
.LASF584:
	.ascii	"INT_LEAST64_MAX (__INT_LEAST64_MAX__)\000"
.LASF206:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF88:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF694:
	.ascii	"SysTick_CALIB_SKEW_Pos 30\000"
.LASF134:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF237:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF607:
	.ascii	"WCHAR_MAX (__WCHAR_MAX__)\000"
.LASF314:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF566:
	.ascii	"INT_LEAST8_MAX (__INT_LEAST8_MAX__)\000"
.LASF461:
	.ascii	"__ASM __asm\000"
.LASF504:
	.ascii	"__EXP\000"
.LASF81:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF129:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF413:
	.ascii	"__VFP_FP__ 1\000"
.LASF532:
	.ascii	"__LEAST32 \"l\"\000"
.LASF525:
	.ascii	"__INT64 \"ll\"\000"
.LASF138:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF733:
	.ascii	"LPC_I2C ((LPC_I2C_TypeDef *) LPC_I2C_BASE )\000"
.LASF135:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF583:
	.ascii	"INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)\000"
.LASF436:
	.ascii	"__USE_CMSIS CMSIS_CORE_LPC11xx\000"
.LASF473:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF270:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF675:
	.ascii	"SCB_CCR_STKALIGN_Msk (1UL << SCB_CCR_STKALIGN_Pos)\000"
.LASF450:
	.ascii	"_VA_LIST_T_H \000"
.LASF230:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF592:
	.ascii	"INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)\000"
.LASF684:
	.ascii	"SysTick_CTRL_TICKINT_Pos 1\000"
.LASF787:
	.ascii	"_input_code\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF734:
	.ascii	"LPC_WDT ((LPC_WDT_TypeDef *) LPC_WDT_BASE )\000"
.LASF303:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF309:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF767:
	.ascii	"long int\000"
.LASF715:
	.ascii	"LPC_UART_BASE (LPC_APB0_BASE + 0x08000)\000"
.LASF132:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF224:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF169:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF231:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF227:
	.ascii	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x\000"
.LASF501:
	.ascii	"___int_least16_t_defined 1\000"
.LASF247:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF365:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF209:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF93:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF595:
	.ascii	"INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)\000"
.LASF712:
	.ascii	"LPC_AHB_BASE (0x50000000UL)\000"
.LASF760:
	.ascii	"RUN_TIME \000"
.LASF374:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF499:
	.ascii	"___int64_t_defined 1\000"
.LASF421:
	.ascii	"__ARM_NEON__\000"
.LASF561:
	.ascii	"UINTPTR_MAX (__UINTPTR_MAX__)\000"
.LASF194:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF359:
	.ascii	"__TA_FBIT__ 63\000"
.LASF424:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF291:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF740:
	.ascii	"LPC_ADC ((LPC_ADC_TypeDef *) LPC_ADC_BASE )\000"
.LASF545:
	.ascii	"_UINT64_T_DECLARED \000"
.LASF433:
	.ascii	"__ELF__ 1\000"
.LASF732:
	.ascii	"LPC_GPIO3_BASE (LPC_AHB_BASE + 0x30000)\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF419:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF480:
	.ascii	"_POSIX_C_SOURCE 200809L\000"
.LASF136:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF151:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF114:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF736:
	.ascii	"LPC_TMR16B0 ((LPC_TMR_TypeDef *) LPC_CT16B0_BASE)\000"
.LASF739:
	.ascii	"LPC_TMR32B1 ((LPC_TMR_TypeDef *) LPC_CT32B1_BASE)\000"
.LASF527:
	.ascii	"__FAST16 \000"
.LASF582:
	.ascii	"UINT64_MAX (__UINT64_MAX__)\000"
.LASF487:
	.ascii	"__LARGEFILE_VISIBLE 0\000"
.LASF243:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF470:
	.ascii	"__NEWLIB__ 3\000"
.LASF671:
	.ascii	"SCB_SCR_SLEEPDEEP_Msk (1UL << SCB_SCR_SLEEPDEEP_Pos"
	.ascii	")\000"
.LASF367:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF486:
	.ascii	"__ISO_C_VISIBLE 1999\000"
.LASF153:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF536:
	.ascii	"_UINT8_T_DECLARED \000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF720:
	.ascii	"LPC_ADC_BASE (LPC_APB0_BASE + 0x1C000)\000"
.LASF599:
	.ascii	"INTMAX_MIN (-INTMAX_MAX - 1)\000"
.LASF371:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF606:
	.ascii	"WCHAR_MIN (__WCHAR_MIN__)\000"
.LASF263:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF327:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF663:
	.ascii	"SCB_AIRCR_ENDIANESS_Msk (1UL << SCB_AIRCR_ENDIANESS"
	.ascii	"_Pos)\000"
.LASF753:
	.ascii	"__PROGPLAT_ARCH__M0 \000"
.LASF120:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF403:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF465:
	.ascii	"_STDINT_H \000"
.LASF657:
	.ascii	"SCB_ICSR_VECTACTIVE_Msk (0x1FFUL << SCB_ICSR_VECTAC"
	.ascii	"TIVE_Pos)\000"
.LASF296:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF621:
	.ascii	"__CORE_CMINSTR_H \000"
.LASF148:
	.ascii	"__FLT_DIG__ 6\000"
.LASF506:
	.ascii	"__STDINT_EXP(x) __ ##x ##__\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF764:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF228:
	.ascii	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x\000"
.LASF152:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF250:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF266:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF141:
	.ascii	"__GCC_IEC_559 0\000"
.LASF735:
	.ascii	"LPC_UART ((LPC_UART_TypeDef *) LPC_UART_BASE )\000"
.LASF130:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF673:
	.ascii	"SCB_SCR_SLEEPONEXIT_Msk (1UL << SCB_SCR_SLEEPONEXIT"
	.ascii	"_Pos)\000"
.LASF428:
	.ascii	"__ARM_ARCH_EXT_IDIV__\000"
.LASF458:
	.ascii	"__CM0_CMSIS_VERSION_SUB (0x20)\000"
.LASF159:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF340:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF693:
	.ascii	"SysTick_CALIB_NOREF_Msk (1UL << SysTick_CALIB_NOREF"
	.ascii	"_Pos)\000"
.LASF587:
	.ascii	"INT_FAST8_MAX (__INT_FAST8_MAX__)\000"
.LASF783:
	.ascii	"arch/m0/src/time.c\000"
.LASF600:
	.ascii	"UINTMAX_MAX (__UINTMAX_MAX__)\000"
.LASF341:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF252:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF558:
	.ascii	"__int_fast64_t_defined 1\000"
.LASF634:
	.ascii	"SCB_CPUID_ARCHITECTURE_Pos 16\000"
.LASF781:
	.ascii	"timer_measure\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF328:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF437:
	.ascii	"_PRINTF_H \000"
.LASF701:
	.ascii	"SCB_BASE (SCS_BASE + 0x0D00UL)\000"
.LASF467:
	.ascii	"_SYS_FEATURES_H \000"
.LASF649:
	.ascii	"SCB_ICSR_PENDSTCLR_Msk (1UL << SCB_ICSR_PENDSTCLR_P"
	.ascii	"os)\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF386:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF744:
	.ascii	"LPC_SSP1 ((LPC_SSP_TypeDef *) LPC_SSP1_BASE )\000"
.LASF509:
	.ascii	"char\000"
.LASF364:
	.ascii	"__USA_IBIT__ 16\000"
.LASF605:
	.ascii	"PTRDIFF_MIN (-PTRDIFF_MAX - 1)\000"
.LASF442:
	.ascii	"va_start(v,l) __builtin_va_start(v,l)\000"
.LASF256:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF155:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF353:
	.ascii	"__HA_FBIT__ 7\000"
.LASF603:
	.ascii	"SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))\000"
.LASF233:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF620:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF260:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF422:
	.ascii	"__ARM_NEON\000"
.LASF102:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF497:
	.ascii	"___int16_t_defined 1\000"
.LASF179:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF672:
	.ascii	"SCB_SCR_SLEEPONEXIT_Pos 1\000"
.LASF670:
	.ascii	"SCB_SCR_SLEEPDEEP_Pos 2\000"
.LASF490:
	.ascii	"__SVID_VISIBLE 1\000"
.LASF456:
	.ascii	"__CORE_CM0_H_GENERIC \000"
.LASF172:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF686:
	.ascii	"SysTick_CTRL_ENABLE_Pos 0\000"
.LASF598:
	.ascii	"INTMAX_MAX (__INTMAX_MAX__)\000"
.LASF575:
	.ascii	"INT32_MAX (__INT32_MAX__)\000"
.LASF69:
	.ascii	"__GXX_ABI_VERSION 1011\000"
.LASF357:
	.ascii	"__DA_FBIT__ 31\000"
.LASF769:
	.ascii	"long long int\000"
.LASF109:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF645:
	.ascii	"SCB_ICSR_PENDSVCLR_Msk (1UL << SCB_ICSR_PENDSVCLR_P"
	.ascii	"os)\000"
.LASF157:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF183:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF97:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF68:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF573:
	.ascii	"UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)\000"
.LASF123:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF636:
	.ascii	"SCB_CPUID_PARTNO_Pos 4\000"
.LASF641:
	.ascii	"SCB_ICSR_NMIPENDSET_Msk (1UL << SCB_ICSR_NMIPENDSET"
	.ascii	"_Pos)\000"
.LASF611:
	.ascii	"UINT8_C(x) __UINT8_C(x)\000"
.LASF156:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF680:
	.ascii	"SysTick_CTRL_COUNTFLAG_Pos 16\000"
.LASF552:
	.ascii	"__int_least16_t_defined 1\000"
.LASF696:
	.ascii	"SysTick_CALIB_TENMS_Pos 0\000"
.LASF578:
	.ascii	"INT_LEAST32_MAX (__INT_LEAST32_MAX__)\000"
.LASF379:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF460:
	.ascii	"__CORTEX_M (0x00)\000"
.LASF623:
	.ascii	"__CMSIS_GCC_USE_REG(r) \"l\" (r)\000"
.LASF383:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF488:
	.ascii	"__MISC_VISIBLE 1\000"
.LASF449:
	.ascii	"_VA_LIST_DEFINED \000"
.LASF203:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF188:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF705:
	.ascii	"_BIT_SHIFT(IRQn) ( (((uint32_t)(IRQn) ) & 0x03) * 8"
	.ascii	" )\000"
.LASF559:
	.ascii	"INTPTR_MIN (-__INTPTR_MAX__ - 1)\000"
.LASF441:
	.ascii	"__GNUC_VA_LIST \000"
.LASF426:
	.ascii	"__ARM_PCS 1\000"
.LASF344:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF759:
	.ascii	"RUN_2EXPS \000"
.LASF96:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF310:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF381:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF642:
	.ascii	"SCB_ICSR_PENDSVSET_Pos 28\000"
.LASF664:
	.ascii	"SCB_AIRCR_SYSRESETREQ_Pos 2\000"
.LASF762:
	.ascii	"BARRIER_DMB_DSB_ISB() __asm__ __volatile__(\"DMB \\"
	.ascii	"t\\n DSB \\t\\n ISB \\t\\n\")\000"
.LASF602:
	.ascii	"SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)\000"
.LASF710:
	.ascii	"LPC_RAM_BASE (0x10000000UL)\000"
.LASF538:
	.ascii	"_INT16_T_DECLARED \000"
.LASF271:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF609:
	.ascii	"WINT_MIN (__WINT_MIN__)\000"
.LASF111:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF554:
	.ascii	"__int_least64_t_defined 1\000"
.LASF145:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF780:
	.ascii	"run_time_experiment\000"
.LASF245:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF435:
	.ascii	"USE_OLD_STYLE_DATA_BSS_INIT 1\000"
.LASF502:
	.ascii	"___int_least32_t_defined 1\000"
.LASF326:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF553:
	.ascii	"__int_least32_t_defined 1\000"
.LASF370:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF105:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF104:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF616:
	.ascii	"INT64_C(x) __INT64_C(x)\000"
.LASF481:
	.ascii	"_ATFILE_SOURCE\000"
.LASF589:
	.ascii	"INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)\000"
.LASF106:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF659:
	.ascii	"SCB_AIRCR_VECTKEY_Msk (0xFFFFUL << SCB_AIRCR_VECTKE"
	.ascii	"Y_Pos)\000"
.LASF429:
	.ascii	"__ARM_FEATURE_IDIV\000"
.LASF574:
	.ascii	"INT32_MIN (-__INT32_MAX__ - 1)\000"
.LASF523:
	.ascii	"__INT16 \"h\"\000"
.LASF520:
	.ascii	"_INTPTR_EQ_INT \000"
.LASF402:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF222:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF67:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF749:
	.ascii	"LPC_GPIO1 ((LPC_GPIO_TypeDef *) LPC_GPIO1_BASE )\000"
.LASF639:
	.ascii	"SCB_CPUID_REVISION_Msk (0xFUL << SCB_CPUID_REVISION"
	.ascii	"_Pos)\000"
.LASF170:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF275:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF117:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF618:
	.ascii	"INTMAX_C(x) __INTMAX_C(x)\000"
.LASF306:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF653:
	.ascii	"SCB_ICSR_ISRPENDING_Msk (1UL << SCB_ICSR_ISRPENDING"
	.ascii	"_Pos)\000"
.LASF98:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF385:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF496:
	.ascii	"___int8_t_defined 1\000"
.LASF255:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF768:
	.ascii	"long unsigned int\000"
.LASF356:
	.ascii	"__SA_IBIT__ 16\000"
.LASF394:
	.ascii	"__ARM_FEATURE_UNALIGNED\000"
.LASF507:
	.ascii	"signed\000"
.LASF142:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF223:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF5:
	.ascii	"__GNUC__ 7\000"
.LASF415:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF477:
	.ascii	"_POSIX_SOURCE\000"
.LASF772:
	.ascii	"__uint32_t\000"
.LASF412:
	.ascii	"__SOFTFP__ 1\000"
.LASF655:
	.ascii	"SCB_ICSR_VECTPENDING_Msk (0x1FFUL << SCB_ICSR_VECTP"
	.ascii	"ENDING_Pos)\000"
.LASF144:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF742:
	.ascii	"LPC_FLASHCTRL ((LPC_FLASHCTRL_Type *) LPC_FLASHCTRL"
	.ascii	"_BASE)\000"
.LASF518:
	.ascii	"int +2\000"
.LASF785:
	.ascii	"SystemCoreClock\000"
.LASF610:
	.ascii	"INT8_C(x) __INT8_C(x)\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF324:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF267:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF651:
	.ascii	"SCB_ICSR_ISRPREEMPT_Msk (1UL << SCB_ICSR_ISRPREEMPT"
	.ascii	"_Pos)\000"
.LASF100:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF530:
	.ascii	"__LEAST8 \"hh\"\000"
.LASF453:
	.ascii	"__MPU_PRESENT 0\000"
.LASF115:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF406:
	.ascii	"__APCS_32__ 1\000"
.LASF757:
	.ascii	"__PROGPLAT_RUN_TIMEOUT__6 \000"
.LASF476:
	.ascii	"_DEFAULT_SOURCE 1\000"
.LASF190:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF8:
	.ascii	"__VERSION__ \"7.3.1 20180622 (release) [ARM/embedde"
	.ascii	"d-7-branch revision 261907]\"\000"
.LASF200:
	.ascii	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32\000"
.LASF125:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF258:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF185:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF713:
	.ascii	"LPC_I2C_BASE (LPC_APB0_BASE + 0x00000)\000"
.LASF376:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF165:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF529:
	.ascii	"__FAST64 \"ll\"\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF514:
	.ascii	"unsigned +0\000"
.LASF229:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF147:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF350:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF438:
	.ascii	"_STDARG_H \000"
.LASF541:
	.ascii	"_INT32_T_DECLARED \000"
.LASF528:
	.ascii	"__FAST32 \000"
.LASF741:
	.ascii	"LPC_PMU ((LPC_PMU_TypeDef *) LPC_PMU_BASE )\000"
.LASF627:
	.ascii	"__I volatile const\000"
.LASF186:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF101:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF540:
	.ascii	"__int16_t_defined 1\000"
.LASF289:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF94:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF638:
	.ascii	"SCB_CPUID_REVISION_Pos 0\000"
.LASF463:
	.ascii	"__STATIC_INLINE static inline\000"
.LASF549:
	.ascii	"_INTPTR_T_DECLARED \000"
.LASF84:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF154:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF308:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF272:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF731:
	.ascii	"LPC_GPIO2_BASE (LPC_AHB_BASE + 0x20000)\000"
.LASF754:
	.ascii	"__PROGPLAT_TYPE__EXPS2 \000"
.LASF158:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF468:
	.ascii	"_NEWLIB_VERSION_H__ 1\000"
.LASF320:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF660:
	.ascii	"SCB_AIRCR_VECTKEYSTAT_Pos 16\000"
.LASF262:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF405:
	.ascii	"__ARM_ARCH 6\000"
.LASF146:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF202:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF722:
	.ascii	"LPC_FLASHCTRL_BASE (LPC_APB0_BASE + 0x3C000)\000"
.LASF576:
	.ascii	"UINT32_MAX (__UINT32_MAX__)\000"
.LASF189:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF85:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF608:
	.ascii	"WINT_MAX (__WINT_MAX__)\000"
.LASF717:
	.ascii	"LPC_CT16B1_BASE (LPC_APB0_BASE + 0x10000)\000"
.LASF137:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF414:
	.ascii	"__ARM_FP\000"
.LASF354:
	.ascii	"__HA_IBIT__ 8\000"
.LASF390:
	.ascii	"__ARM_FEATURE_DSP\000"
.LASF139:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF382:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF226:
	.ascii	"__FLT32X_MIN__ 2.2250738585072014e-308F32x\000"
.LASF208:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF212:
	.ascii	"__FLT64_MIN__ 2.2250738585072014e-308F64\000"
.LASF498:
	.ascii	"___int32_t_defined 1\000"
.LASF87:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF273:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF570:
	.ascii	"UINT16_MAX (__UINT16_MAX__)\000"
.LASF387:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF484:
	.ascii	"__BSD_VISIBLE 1\000"
.LASF571:
	.ascii	"INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)\000"
.LASF654:
	.ascii	"SCB_ICSR_VECTPENDING_Pos 12\000"
.LASF652:
	.ascii	"SCB_ICSR_ISRPENDING_Pos 22\000"
.LASF503:
	.ascii	"___int_least64_t_defined 1\000"
.LASF748:
	.ascii	"LPC_GPIO0 ((LPC_GPIO_TypeDef *) LPC_GPIO0_BASE )\000"
.LASF775:
	.ascii	"LOAD\000"
.LASF112:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF254:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF482:
	.ascii	"_ATFILE_SOURCE 1\000"
.LASF786:
	.ascii	"time_run_c\000"
.LASF622:
	.ascii	"__CMSIS_GCC_OUT_REG(r) \"=l\" (r)\000"
.LASF493:
	.ascii	"__EXP(x) __ ##x ##__\000"
.LASF745:
	.ascii	"LPC_CAN ((LPC_CAN_TypeDef *) LPC_CAN_BASE )\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF199:
	.ascii	"__FLT32_EPSILON__ 1.1920928955078125e-7F32\000"
.LASF423:
	.ascii	"__ARM_NEON_FP\000"
.LASF396:
	.ascii	"__ARM_32BIT_STATE\000"
.LASF268:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF349:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF707:
	.ascii	"_IP_IDX(IRQn) ( ((uint32_t)(IRQn) >> 2) )\000"
.LASF556:
	.ascii	"__int_fast16_t_defined 1\000"
.LASF180:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF236:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF581:
	.ascii	"INT64_MAX (__INT64_MAX__)\000"
.LASF648:
	.ascii	"SCB_ICSR_PENDSTCLR_Pos 25\000"
.LASF771:
	.ascii	"unsigned int\000"
.LASF774:
	.ascii	"CTRL\000"
.LASF471:
	.ascii	"__NEWLIB_MINOR__ 0\000"
.LASF149:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF217:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF615:
	.ascii	"UINT32_C(x) __UINT32_C(x)\000"
.LASF633:
	.ascii	"SCB_CPUID_VARIANT_Msk (0xFUL << SCB_CPUID_VARIANT_P"
	.ascii	"os)\000"
.LASF761:
	.ascii	"NUM_MUL_RUNS __PROGPLAT_MUL_RUNS__\000"
.LASF331:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF299:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF586:
	.ascii	"INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)\000"
.LASF215:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF329:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF312:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF143:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF723:
	.ascii	"LPC_SSP0_BASE (LPC_APB0_BASE + 0x40000)\000"
.LASF70:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF127:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF408:
	.ascii	"__thumb2__\000"
.LASF397:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF343:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF335:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF691:
	.ascii	"SysTick_VAL_CURRENT_Msk (0xFFFFFFUL << SysTick_VAL_"
	.ascii	"CURRENT_Pos)\000"
.LASF240:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF311:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF276:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF389:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF719:
	.ascii	"LPC_CT32B1_BASE (LPC_APB0_BASE + 0x18000)\000"
.LASF500:
	.ascii	"___int_least8_t_defined 1\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF555:
	.ascii	"__int_fast8_t_defined 1\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF750:
	.ascii	"LPC_GPIO2 ((LPC_GPIO_TypeDef *) LPC_GPIO2_BASE )\000"
.LASF82:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF246:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF560:
	.ascii	"INTPTR_MAX (__INTPTR_MAX__)\000"
.LASF363:
	.ascii	"__USA_FBIT__ 16\000"
.LASF699:
	.ascii	"SysTick_BASE (SCS_BASE + 0x0010UL)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF220:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF160:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF375:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF483:
	.ascii	"__ATFILE_VISIBLE 1\000"
.LASF277:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF782:
	.ascii	"GNU C99 7.3.1 20180622 (release) [ARM/embedded-7-br"
	.ascii	"anch revision 261907] -mcpu=cortex-m0 -mthumb -g3 -"
	.ascii	"std=gnu99 -fno-builtin -fno-stack-protector -ffunct"
	.ascii	"ion-sections -fdata-sections -fno-common\000"
.LASF676:
	.ascii	"SCB_CCR_UNALIGN_TRP_Pos 3\000"
.LASF401:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF679:
	.ascii	"SCB_SHCSR_SVCALLPENDED_Msk (1UL << SCB_SHCSR_SVCALL"
	.ascii	"PENDED_Pos)\000"
.LASF404:
	.ascii	"__arm__ 1\000"
.LASF445:
	.ascii	"va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF193:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF568:
	.ascii	"INT16_MIN (-__INT16_MAX__ - 1)\000"
.LASF416:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF777:
	.ascii	"SysTick_Type\000"
.LASF232:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF466:
	.ascii	"_MACHINE__DEFAULT_TYPES_H \000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF668:
	.ascii	"SCB_SCR_SEVONPEND_Pos 4\000"
.LASF360:
	.ascii	"__TA_IBIT__ 64\000"
.LASF533:
	.ascii	"__LEAST64 \"ll\"\000"
.LASF690:
	.ascii	"SysTick_VAL_CURRENT_Pos 0\000"
.LASF650:
	.ascii	"SCB_ICSR_ISRPREEMPT_Pos 23\000"
.LASF395:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF410:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF457:
	.ascii	"__CM0_CMSIS_VERSION_MAIN (0x03)\000"
.LASF74:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF512:
	.ascii	"long\000"
.LASF666:
	.ascii	"SCB_AIRCR_VECTCLRACTIVE_Pos 1\000"
.LASF269:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF420:
	.ascii	"__ARM_FEATURE_FMA\000"
.LASF698:
	.ascii	"SCS_BASE (0xE000E000UL)\000"
.LASF107:
	.ascii	"__INT8_C(c) c\000"
.LASF274:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF455:
	.ascii	"__Vendor_SysTickConfig 0\000"
.LASF384:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF163:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF377:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF191:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF619:
	.ascii	"UINTMAX_C(x) __UINTMAX_C(x)\000"
.LASF597:
	.ascii	"UINT_FAST64_MAX (__UINT_FAST64_MAX__)\000"
.LASF513:
	.ascii	"signed +0\000"
.LASF187:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF305:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF697:
	.ascii	"SysTick_CALIB_TENMS_Msk (0xFFFFFFUL << SysTick_VAL_"
	.ascii	"CURRENT_Pos)\000"
.LASF393:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF709:
	.ascii	"LPC_FLASH_BASE (0x00000000UL)\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF788:
	.ascii	"timer_reset\000"
.LASF124:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF264:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF83:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF472:
	.ascii	"__NEWLIB_PATCHLEVEL__ 0\000"
.LASF439:
	.ascii	"_ANSI_STDARG_H_ \000"
.LASF239:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF770:
	.ascii	"long long unsigned int\000"
.LASF585:
	.ascii	"UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)\000"
.LASF150:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF319:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF71:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF588:
	.ascii	"UINT_FAST8_MAX (__UINT_FAST8_MAX__)\000"
.LASF332:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF543:
	.ascii	"__int32_t_defined 1\000"
.LASF628:
	.ascii	"__O volatile\000"
.LASF485:
	.ascii	"__GNU_VISIBLE 0\000"
.LASF294:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF339:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF346:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF548:
	.ascii	"_UINTMAX_T_DECLARED \000"
.LASF295:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF281:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF398:
	.ascii	"__ARM_FEATURE_CLZ\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF547:
	.ascii	"_INTMAX_T_DECLARED \000"
.LASF316:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF626:
	.ascii	"__CORE_CM0_H_DEPENDANT \000"
.LASF219:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF725:
	.ascii	"LPC_SYSCON_BASE (LPC_APB0_BASE + 0x48000)\000"
.LASF351:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF128:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF494:
	.ascii	"__have_longlong64 1\000"
.LASF469:
	.ascii	"_NEWLIB_VERSION \"3.0.0\"\000"
.LASF550:
	.ascii	"_UINTPTR_T_DECLARED \000"
.LASF321:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF110:
	.ascii	"__INT16_C(c) c\000"
.LASF280:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF601:
	.ascii	"SIZE_MAX (__SIZE_MAX__)\000"
.LASF658:
	.ascii	"SCB_AIRCR_VECTKEY_Pos 16\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF118:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF708:
	.ascii	"__SYSTEM_LPC11xx_H \000"
.LASF537:
	.ascii	"__int8_t_defined 1\000"
.LASF632:
	.ascii	"SCB_CPUID_VARIANT_Pos 20\000"
.LASF544:
	.ascii	"_INT64_T_DECLARED \000"
.LASF706:
	.ascii	"_SHP_IDX(IRQn) ( ((((uint32_t)(IRQn) & 0x0F)-8) >> "
	.ascii	"2) )\000"
.LASF718:
	.ascii	"LPC_CT32B0_BASE (LPC_APB0_BASE + 0x14000)\000"
.LASF685:
	.ascii	"SysTick_CTRL_TICKINT_Msk (1UL << SysTick_CTRL_TICKI"
	.ascii	"NT_Pos)\000"
.LASF446:
	.ascii	"__va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF702:
	.ascii	"SCB ((SCB_Type *) SCB_BASE )\000"
.LASF352:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF355:
	.ascii	"__SA_FBIT__ 15\000"
.LASF225:
	.ascii	"__FLT32X_MAX__ 1.7976931348623157e+308F32x\000"
.LASF427:
	.ascii	"__ARM_EABI__ 1\000"
.LASF683:
	.ascii	"SysTick_CTRL_CLKSOURCE_Msk (1UL << SysTick_CTRL_CLK"
	.ascii	"SOURCE_Pos)\000"
.LASF409:
	.ascii	"__THUMBEL__ 1\000"
.LASF738:
	.ascii	"LPC_TMR32B0 ((LPC_TMR_TypeDef *) LPC_CT32B0_BASE)\000"
.LASF334:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF776:
	.ascii	"CALIB\000"
.LASF617:
	.ascii	"UINT64_C(x) __UINT64_C(x)\000"
.LASF323:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF221:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF567:
	.ascii	"UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)\000"
.LASF348:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 3\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF399:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF380:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF510:
	.ascii	"short\000"
.LASF418:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF302:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF174:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF614:
	.ascii	"INT32_C(x) __INT32_C(x)\000"
.LASF591:
	.ascii	"UINT_FAST16_MAX (__UINT_FAST16_MAX__)\000"
.LASF729:
	.ascii	"LPC_GPIO0_BASE (LPC_AHB_BASE + 0x00000)\000"
.LASF286:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF248:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF689:
	.ascii	"SysTick_LOAD_RELOAD_Msk (0xFFFFFFUL << SysTick_LOAD"
	.ascii	"_RELOAD_Pos)\000"
.LASF579:
	.ascii	"UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)\000"
.LASF459:
	.ascii	"__CM0_CMSIS_VERSION ((__CM0_CMSIS_VERSION_MAIN << 1"
	.ascii	"6) | __CM0_CMSIS_VERSION_SUB )\000"
.LASF643:
	.ascii	"SCB_ICSR_PENDSVSET_Msk (1UL << SCB_ICSR_PENDSVSET_P"
	.ascii	"os)\000"
.LASF692:
	.ascii	"SysTick_CALIB_NOREF_Pos 31\000"
.LASF515:
	.ascii	"char +0\000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF687:
	.ascii	"SysTick_CTRL_ENABLE_Msk (1UL << SysTick_CTRL_ENABLE"
	.ascii	"_Pos)\000"
.LASF282:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF369:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF197:
	.ascii	"__FLT32_MAX__ 3.4028234663852886e+38F32\000"
.LASF162:
	.ascii	"__DBL_DIG__ 15\000"
.LASF539:
	.ascii	"_UINT16_T_DECLARED \000"
.LASF425:
	.ascii	"__ARM_ARCH_6M__ 1\000"
.LASF535:
	.ascii	"_INT8_T_DECLARED \000"
.LASF716:
	.ascii	"LPC_CT16B0_BASE (LPC_APB0_BASE + 0x0C000)\000"
.LASF249:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF116:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF178:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF577:
	.ascii	"INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)\000"
.LASF184:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF304:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF784:
	.ascii	"/home/holba/projcourse/EmbExp-ProgPlatform\000"
.LASF508:
	.ascii	"unsigned\000"
.LASF765:
	.ascii	"short int\000"
.LASF678:
	.ascii	"SCB_SHCSR_SVCALLPENDED_Pos 15\000"
.LASF444:
	.ascii	"va_arg(v,l) __builtin_va_arg(v,l)\000"
.LASF121:
	.ascii	"__UINT16_C(c) c\000"
.LASF366:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF531:
	.ascii	"__LEAST16 \"h\"\000"
.LASF372:
	.ascii	"__NO_INLINE__ 1\000"
.LASF580:
	.ascii	"INT64_MIN (-__INT64_MAX__ - 1)\000"
.LASF728:
	.ascii	"LPC_GPIO_BASE (LPC_AHB_BASE + 0x00000)\000"
.LASF721:
	.ascii	"LPC_PMU_BASE (LPC_APB0_BASE + 0x38000)\000"
.LASF431:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF173:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF95:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF204:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF629:
	.ascii	"__IO volatile\000"
.LASF434:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF724:
	.ascii	"LPC_IOCON_BASE (LPC_APB0_BASE + 0x44000)\000"
.LASF242:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF703:
	.ascii	"SysTick ((SysTick_Type *) SysTick_BASE )\000"
.LASF167:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF644:
	.ascii	"SCB_ICSR_PENDSVCLR_Pos 27\000"
.LASF495:
	.ascii	"__have_long32 1\000"
.LASF546:
	.ascii	"__int64_t_defined 1\000"
.LASF688:
	.ascii	"SysTick_LOAD_RELOAD_Pos 0\000"
.LASF755:
	.ascii	"__PROGPLAT_PARAMS__TIME \000"
.LASF492:
	.ascii	"__SSP_FORTIFY_LEVEL 0\000"
.LASF234:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF333:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF674:
	.ascii	"SCB_CCR_STKALIGN_Pos 9\000"
.LASF213:
	.ascii	"__FLT64_EPSILON__ 2.2204460492503131e-16F64\000"
.LASF474:
	.ascii	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)\000"
.LASF368:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF443:
	.ascii	"va_end(v) __builtin_va_end(v)\000"
.LASF464:
	.ascii	"__FPU_USED 0\000"
.LASF292:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF704:
	.ascii	"NVIC ((NVIC_Type *) NVIC_BASE )\000"
.LASF122:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF388:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF681:
	.ascii	"SysTick_CTRL_COUNTFLAG_Msk (1UL << SysTick_CTRL_COU"
	.ascii	"NTFLAG_Pos)\000"
.LASF432:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF182:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF315:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF126:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF201:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF526:
	.ascii	"__FAST8 \000"
.LASF756:
	.ascii	"__PROGPLAT_BOARD__LPC11C24 \000"
.LASF330:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF131:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF451:
	.ascii	"__va_list__ \000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF747:
	.ascii	"LPC_SYSCON ((LPC_SYSCON_TypeDef *) LPC_SYSCON_BASE)"
	.ascii	"\000"
.LASF524:
	.ascii	"__INT32 \"l\"\000"
.LASF99:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF475:
	.ascii	"_DEFAULT_SOURCE\000"
.LASF452:
	.ascii	"__LPC11xx_H__ \000"
.LASF171:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF290:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF417:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF630:
	.ascii	"SCB_CPUID_IMPLEMENTER_Pos 24\000"
.LASF284:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF613:
	.ascii	"UINT16_C(x) __UINT16_C(x)\000"
.LASF285:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF773:
	.ascii	"uint32_t\000"
.LASF743:
	.ascii	"LPC_SSP0 ((LPC_SSP_TypeDef *) LPC_SSP0_BASE )\000"
.LASF505:
	.ascii	"_SYS__INTSUP_H \000"
.LASF711:
	.ascii	"LPC_APB0_BASE (0x40000000UL)\000"
.LASF297:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF596:
	.ascii	"INT_FAST64_MAX (__INT_FAST64_MAX__)\000"
.LASF478:
	.ascii	"_POSIX_SOURCE 1\000"
.LASF454:
	.ascii	"__NVIC_PRIO_BITS 2\000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF695:
	.ascii	"SysTick_CALIB_SKEW_Msk (1UL << SysTick_CALIB_SKEW_P"
	.ascii	"os)\000"
.LASF362:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF307:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF322:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF176:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF89:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF752:
	.ascii	"CONFIG_H \000"
.LASF78:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF205:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF244:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF77:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF108:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF168:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF766:
	.ascii	"short unsigned int\000"
.LASF283:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF631:
	.ascii	"SCB_CPUID_IMPLEMENTER_Msk (0xFFUL << SCB_CPUID_IMPL"
	.ascii	"EMENTER_Pos)\000"
.LASF407:
	.ascii	"__thumb__ 1\000"
.LASF411:
	.ascii	"__ARMEL__ 1\000"
.LASF778:
	.ascii	"input1\000"
.LASF779:
	.ascii	"input2\000"
.LASF665:
	.ascii	"SCB_AIRCR_SYSRESETREQ_Msk (1UL << SCB_AIRCR_SYSRESE"
	.ascii	"TREQ_Pos)\000"
.LASF521:
	.ascii	"_INT32_EQ_LONG \000"
.LASF440:
	.ascii	"__need___va_list\000"
.LASF80:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF392:
	.ascii	"__ARM_FEATURE_SAT\000"
.LASF564:
	.ascii	"UINT8_MAX (__UINT8_MAX__)\000"
.LASF73:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF551:
	.ascii	"__int_least8_t_defined 1\000"
.LASF519:
	.ascii	"long +4\000"
.LASF287:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF400:
	.ascii	"__ARM_FEATURE_SIMD32\000"
.LASF218:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF430:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__\000"
.LASF448:
	.ascii	"_VA_LIST \000"
.LASF358:
	.ascii	"__DA_IBIT__ 32\000"
.LASF259:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF516:
	.ascii	"short +1\000"
.LASF669:
	.ascii	"SCB_SCR_SEVONPEND_Msk (1UL << SCB_SCR_SEVONPEND_Pos"
	.ascii	")\000"
.LASF746:
	.ascii	"LPC_IOCON ((LPC_IOCON_TypeDef *) LPC_IOCON_BASE )\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF336:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF164:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF661:
	.ascii	"SCB_AIRCR_VECTKEYSTAT_Msk (0xFFFFUL << SCB_AIRCR_VE"
	.ascii	"CTKEYSTAT_Pos)\000"
.LASF727:
	.ascii	"LPC_SSP1_BASE (LPC_APB0_BASE + 0x58000)\000"
.LASF511:
	.ascii	"__int20\000"
.LASF462:
	.ascii	"__INLINE inline\000"
.LASF593:
	.ascii	"INT_FAST32_MAX (__INT_FAST32_MAX__)\000"
.LASF447:
	.ascii	"_VA_LIST_ \000"
.LASF479:
	.ascii	"_POSIX_C_SOURCE\000"
.LASF92:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF161:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF279:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF72:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF103:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF293:
	.ascii	"__SACCUM_FBIT__ 7\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
