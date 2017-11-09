	.file	1 "motor.c"
	.section .mdebug.abi32
	.previous
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,216,$31		# vars= 192, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-216
	sw	$31,212($sp)
	sw	$fp,208($sp)
	move	$fp,$sp
	li	$2,73			# 0x49
	sw	$2,16($fp)
	li	$2,78			# 0x4e
	sw	$2,20($fp)
	li	$2,80			# 0x50
	sw	$2,24($fp)
	li	$2,85			# 0x55
	sw	$2,28($fp)
	li	$2,84			# 0x54
	sw	$2,32($fp)
	li	$2,78			# 0x4e
	sw	$2,36($fp)
	li	$2,85			# 0x55
	sw	$2,40($fp)
	li	$2,77			# 0x4d
	sw	$2,44($fp)
	li	$2,10			# 0xa
	sw	$2,48($fp)
	sw	$0,52($fp)
	addiu	$2,$fp,16
	move	$4,$2
	jal	my_print
	nop

$L2:
	lui	$2,%hi(key)
	lw	$2,%lo(key)($2)
	nop
	move	$4,$2
	jal	my_motor
	nop

	j	$L2
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.align	2
	.globl	my_motor
	.ent	my_motor
my_motor:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	lw	$2,24($fp)
	nop
	bne	$2,$0,$L5
	nop

	move	$4,$0
	jal	ext_out
	nop

	j	$L19
	nop

$L5:
	lw	$3,24($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L8
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	j	$L19
	nop

$L8:
	lw	$3,24($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L10
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	j	$L19
	nop

$L10:
	lw	$3,24($fp)
	li	$2,3			# 0x3
	bne	$3,$2,$L12
	nop

	li	$4,9			# 0x9
	jal	ext_out
	nop

	li	$4,12			# 0xc
	jal	ext_out
	nop

	li	$4,6			# 0x6
	jal	ext_out
	nop

	li	$4,3			# 0x3
	jal	ext_out
	nop

	j	$L19
	nop

$L12:
	lw	$3,24($fp)
	li	$2,4			# 0x4
	bne	$3,$2,$L14
	nop

	li	$4,3			# 0x3
	jal	ext_out
	nop

	li	$4,6			# 0x6
	jal	ext_out
	nop

	li	$4,12			# 0xc
	jal	ext_out
	nop

	li	$4,9			# 0x9
	jal	ext_out
	nop

	j	$L19
	nop

$L14:
	lw	$3,24($fp)
	li	$2,5			# 0x5
	bne	$3,$2,$L16
	nop

	li	$4,9			# 0x9
	jal	ext_out
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	li	$4,12			# 0xc
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,6			# 0x6
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,3			# 0x3
	jal	ext_out
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	j	$L19
	nop

$L16:
	lw	$3,24($fp)
	li	$2,6			# 0x6
	bne	$3,$2,$L19
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	li	$4,3			# 0x3
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,6			# 0x6
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,12			# 0xc
	jal	ext_out
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	li	$4,9			# 0x9
	jal	ext_out
	nop

$L19:
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_motor
	.size	my_motor, .-my_motor
	.align	2
	.globl	ext_out
	.ent	ext_out
ext_out:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	li	$3,800			# 0x320
	lw	$2,16($fp)
	nop
	sw	$2,0($3)
	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ext_out
	.size	ext_out, .-ext_out
	.align	2
	.globl	my_print
	.ent	my_print
my_print:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	j	$L23
	nop

$L24:
	li	$2,768			# 0x300
	sw	$0,0($2)
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,65
	bne	$2,$0,$L25
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,91
	beq	$2,$0,$L25
	nop

	li	$3,772			# 0x304
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$2,$2,-64
	sw	$2,0($3)
	j	$L28
	nop

$L25:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,97
	bne	$2,$0,$L29
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,123
	beq	$2,$0,$L29
	nop

	li	$3,772			# 0x304
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$2,$2,-96
	sw	$2,0($3)
	j	$L28
	nop

$L29:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	bne	$2,$0,$L32
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,58
	beq	$2,$0,$L32
	nop

	li	$2,772			# 0x304
	lw	$3,0($fp)
	nop
	lw	$3,0($3)
	nop
	sw	$3,0($2)
	j	$L28
	nop

$L32:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,64			# 0x40
	bne	$3,$2,$L35
	nop

	li	$2,772			# 0x304
	sw	$0,0($2)
	j	$L28
	nop

$L35:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,91			# 0x5b
	bne	$3,$2,$L37
	nop

	li	$3,772			# 0x304
	li	$2,27			# 0x1b
	sw	$2,0($3)
	j	$L28
	nop

$L37:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,93			# 0x5d
	bne	$3,$2,$L39
	nop

	li	$3,772			# 0x304
	li	$2,29			# 0x1d
	sw	$2,0($3)
	j	$L28
	nop

$L39:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,32
	bne	$2,$0,$L41
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	beq	$2,$0,$L41
	nop

	li	$2,772			# 0x304
	lw	$3,0($fp)
	nop
	lw	$3,0($3)
	nop
	sw	$3,0($2)
	j	$L28
	nop

$L41:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,63			# 0x3f
	bne	$3,$2,$L44
	nop

	li	$3,772			# 0x304
	li	$2,58			# 0x3a
	sw	$2,0($3)
	j	$L28
	nop

$L44:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L46
	nop

	li	$3,772			# 0x304
	li	$2,59			# 0x3b
	sw	$2,0($3)
	j	$L28
	nop

$L46:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,59			# 0x3b
	bne	$3,$2,$L48
	nop

	li	$3,772			# 0x304
	li	$2,60			# 0x3c
	sw	$2,0($3)
	j	$L28
	nop

$L48:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,58			# 0x3a
	bne	$3,$2,$L50
	nop

	li	$3,772			# 0x304
	li	$2,61			# 0x3d
	sw	$2,0($3)
	j	$L28
	nop

$L50:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,10			# 0xa
	bne	$3,$2,$L52
	nop

	li	$3,772			# 0x304
	li	$2,62			# 0x3e
	sw	$2,0($3)
	j	$L28
	nop

$L52:
	li	$2,772			# 0x304
	sw	$0,0($2)
$L28:
	li	$3,768			# 0x300
	li	$2,1			# 0x1
	sw	$2,0($3)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,4
	sw	$2,0($fp)
$L23:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L24
	nop

	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_print
	.size	my_print, .-my_print
	.align	2
	.globl	my_scan
	.ent	my_scan
my_scan:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,780			# 0x30c
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	j	$L57
	nop

$L58:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
$L57:
	li	$2,784			# 0x310
	lw	$3,0($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L58
	nop

	j	$L60
	nop

$L61:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	beq	$2,$0,$L62
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,27
	beq	$2,$0,$L62
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$3,$2,64
	lw	$2,0($fp)
	nop
	sw	$3,0($2)
	j	$L65
	nop

$L62:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	bne	$2,$0,$L66
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,58
	beq	$2,$0,$L66
	nop

	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	lw	$2,0($fp)
	nop
	sw	$3,0($2)
	j	$L65
	nop

$L66:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L69
	nop

	lw	$3,0($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
	j	$L65
	nop

$L69:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,27			# 0x1b
	bne	$3,$2,$L71
	nop

	lw	$3,0($fp)
	li	$2,91			# 0x5b
	sw	$2,0($3)
	j	$L65
	nop

$L71:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,29			# 0x1d
	bne	$3,$2,$L73
	nop

	lw	$3,0($fp)
	li	$2,93			# 0x5d
	sw	$2,0($3)
	j	$L65
	nop

$L73:
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,32
	bne	$2,$0,$L75
	nop

	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	beq	$2,$0,$L75
	nop

	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	lw	$2,0($fp)
	nop
	sw	$3,0($2)
	j	$L65
	nop

$L75:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,58			# 0x3a
	bne	$3,$2,$L78
	nop

	lw	$3,0($fp)
	li	$2,63			# 0x3f
	sw	$2,0($3)
	j	$L65
	nop

$L78:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,59			# 0x3b
	bne	$3,$2,$L80
	nop

	lw	$3,0($fp)
	li	$2,61			# 0x3d
	sw	$2,0($3)
	j	$L65
	nop

$L80:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,60			# 0x3c
	bne	$3,$2,$L82
	nop

	lw	$3,0($fp)
	li	$2,59			# 0x3b
	sw	$2,0($3)
	j	$L65
	nop

$L82:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L84
	nop

	lw	$3,0($fp)
	li	$2,58			# 0x3a
	sw	$2,0($3)
	j	$L65
	nop

$L84:
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L86
	nop

	lw	$3,0($fp)
	li	$2,10			# 0xa
	sw	$2,0($3)
	j	$L65
	nop

$L86:
	lw	$3,0($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
$L65:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,4
	sw	$2,0($fp)
$L60:
	li	$2,784			# 0x310
	lw	$3,0($2)
	lw	$2,0($fp)
	nop
	sw	$3,0($2)
	lw	$2,0($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L61
	nop

	lw	$2,0($fp)
	nop
	sw	$0,0($2)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$2,780			# 0x30c
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_scan
	.size	my_scan, .-my_scan

	.comm	key,4,4
	.ident	"GCC: (GNU) 4.2.0"
