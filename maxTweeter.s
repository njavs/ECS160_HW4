	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	__CsvParser_delimiterIsAccepted
	.align	4, 0x90
__CsvParser_delimiterIsAccepted:        ## @_CsvParser_delimiterIsAccepted
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movb	(%rdi), %al
	movb	%al, -17(%rbp)
	movsbl	-17(%rbp), %ecx
	cmpl	$10, %ecx
	je	LBB0_4
## BB#1:
	movsbl	-17(%rbp), %eax
	cmpl	$13, %eax
	je	LBB0_4
## BB#2:
	movsbl	-17(%rbp), %eax
	cmpl	$0, %eax
	je	LBB0_4
## BB#3:
	movsbl	-17(%rbp), %eax
	cmpl	$34, %eax
	jne	LBB0_5
LBB0_4:
	movl	$0, -4(%rbp)
	jmp	LBB0_6
LBB0_5:
	movl	$1, -4(%rbp)
LBB0_6:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_new
	.align	4, 0x90
_CsvParser_new:                         ## @CsvParser_new
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$64, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -8(%rbp)
	jne	LBB1_2
## BB#1:
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	jmp	LBB1_3
LBB1_2:
	movq	-8(%rbp), %rdi
	callq	_strlen
	movl	%eax, %ecx
	movl	%ecx, -36(%rbp)
	movl	-36(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	-32(%rbp), %rdi
	movq	%rax, (%rdi)
	movq	-32(%rbp), %rax
	movq	(%rax), %rdi
	movq	-8(%rbp), %rsi
	callq	___strcpy_chk
	movq	%rax, -48(%rbp)         ## 8-byte Spill
LBB1_3:
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, 12(%rcx)
	movq	-32(%rbp), %rcx
	movq	$0, 16(%rcx)
	cmpq	$0, -16(%rbp)
	jne	LBB1_5
## BB#4:
	movq	-32(%rbp), %rax
	movb	$44, 8(%rax)
	jmp	LBB1_9
LBB1_5:
	movq	-16(%rbp), %rdi
	callq	__CsvParser_delimiterIsAccepted
	cmpl	$0, %eax
	je	LBB1_7
## BB#6:
	movq	-16(%rbp), %rax
	movb	(%rax), %cl
	movq	-32(%rbp), %rax
	movb	%cl, 8(%rax)
	jmp	LBB1_8
LBB1_7:
	movq	-32(%rbp), %rax
	movb	$0, 8(%rax)
LBB1_8:
	jmp	LBB1_9
LBB1_9:
	movq	-32(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-32(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-32(%rbp), %rax
	movl	$0, 40(%rax)
	movq	-32(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-32(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-32(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_new_from_string
	.align	4, 0x90
_CsvParser_new_from_string:             ## @CsvParser_new_from_string
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %edx
	movq	%rcx, %rdi
	callq	_CsvParser_new
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, 40(%rax)
	cmpq	$0, -8(%rbp)
	je	LBB2_2
## BB#1:
	movq	-8(%rbp), %rdi
	callq	_strlen
	movl	%eax, %ecx
	movl	%ecx, -36(%rbp)
	movl	-36(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	-32(%rbp), %rdi
	movq	%rax, 48(%rdi)
	movq	-32(%rbp), %rax
	movq	48(%rax), %rdi
	movq	-8(%rbp), %rsi
	callq	___strcpy_chk
	movq	%rax, -48(%rbp)         ## 8-byte Spill
LBB2_2:
	movq	-32(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_destroy_row
	.align	4, 0x90
_CsvParser_destroy_row:                 ## @CsvParser_destroy_row
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	8(%rcx), %eax
	jge	LBB3_4
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movslq	-12(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	(%rcx,%rax,8), %rdi
	callq	_free
## BB#3:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB3_1
LBB3_4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_destroy
	.align	4, 0x90
_CsvParser_destroy:                     ## @CsvParser_destroy
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	LBB4_2
## BB#1:
	jmp	LBB4_13
LBB4_2:
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB4_4
## BB#3:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	callq	_free
LBB4_4:
	movq	-8(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	LBB4_6
## BB#5:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_free
LBB4_6:
	movq	-8(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	LBB4_8
## BB#7:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_fclose
	movl	%eax, -12(%rbp)         ## 4-byte Spill
LBB4_8:
	movq	-8(%rbp), %rax
	cmpq	$0, 24(%rax)
	je	LBB4_10
## BB#9:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_CsvParser_destroy_row
LBB4_10:
	movq	-8(%rbp), %rax
	cmpq	$0, 48(%rax)
	je	LBB4_12
## BB#11:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rdi
	callq	_free
LBB4_12:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
LBB4_13:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__CsvParser_setErrorMessage
	.align	4, 0x90
__CsvParser_setErrorMessage:            ## @_CsvParser_setErrorMessage
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	cmpq	$0, 16(%rsi)
	je	LBB5_2
## BB#1:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_free
LBB5_2:
	movq	-16(%rbp), %rdi
	callq	_strlen
	movl	%eax, %ecx
	movl	%ecx, -20(%rbp)
	movl	-20(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	-8(%rbp), %rdi
	movq	%rax, 16(%rdi)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	___strcpy_chk
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__CsvParser_getRow
	.align	4, 0x90
__CsvParser_getRow:                     ## @_CsvParser_getRow
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$64, -24(%rbp)
	movl	$64, -28(%rbp)
	movq	-16(%rbp), %rdi
	cmpq	$0, (%rdi)
	jne	LBB6_3
## BB#1:
	movq	-16(%rbp), %rax
	cmpl	$0, 40(%rax)
	jne	LBB6_3
## BB#2:
	leaq	L_.str(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	__CsvParser_setErrorMessage
	movq	$0, -8(%rbp)
	jmp	LBB6_56
LBB6_3:
	movq	-16(%rbp), %rax
	cmpq	$0, 48(%rax)
	jne	LBB6_6
## BB#4:
	movq	-16(%rbp), %rax
	cmpl	$0, 40(%rax)
	je	LBB6_6
## BB#5:
	leaq	L_.str.1(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	__CsvParser_setErrorMessage
	movq	$0, -8(%rbp)
	jmp	LBB6_56
LBB6_6:
	movq	-16(%rbp), %rax
	movsbl	8(%rax), %ecx
	cmpl	$0, %ecx
	jne	LBB6_8
## BB#7:
	leaq	L_.str.2(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	__CsvParser_setErrorMessage
	movq	$0, -8(%rbp)
	jmp	LBB6_56
LBB6_8:
	movq	-16(%rbp), %rax
	cmpl	$0, 40(%rax)
	jne	LBB6_14
## BB#9:
	movq	-16(%rbp), %rax
	cmpq	$0, 32(%rax)
	jne	LBB6_13
## BB#10:
	leaq	L_.str.3(%rip), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	_fopen
	movq	-16(%rbp), %rsi
	movq	%rax, 32(%rsi)
	movq	-16(%rbp), %rax
	cmpq	$0, 32(%rax)
	jne	LBB6_12
## BB#11:
	callq	___error
	movl	(%rax), %ecx
	movl	%ecx, -32(%rbp)
	movl	-32(%rbp), %edi
	callq	_strerror
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	callq	_strlen
	addq	$1024, %rax             ## imm = 0x400
	movq	%rax, %rdi
	callq	_malloc
	leaq	L_.str.4(%rip), %rsi
	movq	$-1, %rdx
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rdi
	callq	___strcpy_chk
	xorl	%esi, %esi
	leaq	L_.str.5(%rip), %rcx
	movq	$-1, %rdx
	movq	-48(%rbp), %rdi
	movq	-16(%rbp), %r8
	movq	(%r8), %r8
	movq	-40(%rbp), %r9
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movb	$0, %al
	callq	___sprintf_chk
	movq	-16(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movl	%eax, -116(%rbp)        ## 4-byte Spill
	callq	__CsvParser_setErrorMessage
	movq	-48(%rbp), %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB6_56
LBB6_12:
	jmp	LBB6_13
LBB6_13:
	jmp	LBB6_14
LBB6_14:
	movl	$16, %eax
	movl	%eax, %edi
	callq	_malloc
	movq	%rax, -56(%rbp)
	movslq	-24(%rbp), %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-56(%rbp), %rdi
	movq	%rax, (%rdi)
	movq	-56(%rbp), %rax
	movl	$0, 8(%rax)
	movl	$0, -60(%rbp)
	movslq	-28(%rbp), %rdi
	callq	_malloc
	movq	%rax, -72(%rbp)
	movl	$0, -76(%rbp)
	movl	$0, -80(%rbp)
	movl	$0, -84(%rbp)
	movl	$0, -88(%rbp)
	movl	$0, -92(%rbp)
LBB6_15:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 40(%rax)
	je	LBB6_17
## BB#16:                               ##   in Loop: Header=BB6_15 Depth=1
	movq	-16(%rbp), %rax
	movslq	56(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	48(%rcx), %rcx
	movsbl	(%rcx,%rax), %edx
	movl	%edx, -120(%rbp)        ## 4-byte Spill
	jmp	LBB6_18
LBB6_17:                                ##   in Loop: Header=BB6_15 Depth=1
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_fgetc
	movl	%eax, -120(%rbp)        ## 4-byte Spill
LBB6_18:                                ##   in Loop: Header=BB6_15 Depth=1
	movl	-120(%rbp), %eax        ## 4-byte Reload
	movb	%al, %cl
	movb	%cl, -93(%rbp)
	movq	-16(%rbp), %rdx
	movl	56(%rdx), %eax
	addl	$1, %eax
	movl	%eax, 56(%rdx)
	movq	-16(%rbp), %rdx
	cmpl	$0, 40(%rdx)
	je	LBB6_20
## BB#19:                               ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	cmpl	$0, %eax
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movl	%eax, -100(%rbp)
	jmp	LBB6_21
LBB6_20:                                ##   in Loop: Header=BB6_15 Depth=1
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_feof
	movl	%eax, -100(%rbp)
LBB6_21:                                ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -100(%rbp)
	je	LBB6_26
## BB#22:                               ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -80(%rbp)
	jne	LBB6_25
## BB#23:                               ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -60(%rbp)
	jne	LBB6_25
## BB#24:
	leaq	L_.str.6(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	__CsvParser_setErrorMessage
	movq	$0, -8(%rbp)
	jmp	LBB6_56
LBB6_25:                                ##   in Loop: Header=BB6_15 Depth=1
	movb	$10, -93(%rbp)
	movl	$1, -92(%rbp)
LBB6_26:                                ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	cmpl	$13, %eax
	jne	LBB6_28
## BB#27:                               ##   in Loop: Header=BB6_15 Depth=1
	jmp	LBB6_15
LBB6_28:                                ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -80(%rbp)
	jne	LBB6_33
## BB#29:                               ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -88(%rbp)
	jne	LBB6_33
## BB#30:                               ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	cmpl	$34, %eax
	jne	LBB6_32
## BB#31:                               ##   in Loop: Header=BB6_15 Depth=1
	movl	$1, -76(%rbp)
	movl	$1, -88(%rbp)
	jmp	LBB6_15
LBB6_32:                                ##   in Loop: Header=BB6_15 Depth=1
	jmp	LBB6_39
LBB6_33:                                ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	cmpl	$34, %eax
	jne	LBB6_37
## BB#34:                               ##   in Loop: Header=BB6_15 Depth=1
	movl	$2, %eax
	movl	-84(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -84(%rbp)
	movl	-84(%rbp), %ecx
	movl	%eax, -124(%rbp)        ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-124(%rbp), %ecx        ## 4-byte Reload
	idivl	%ecx
	cmpl	$0, %edx
	sete	%sil
	andb	$1, %sil
	movzbl	%sil, %edx
	movl	%edx, -76(%rbp)
	cmpl	$0, -76(%rbp)
	je	LBB6_36
## BB#35:                               ##   in Loop: Header=BB6_15 Depth=1
	movl	-80(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -80(%rbp)
LBB6_36:                                ##   in Loop: Header=BB6_15 Depth=1
	jmp	LBB6_38
LBB6_37:                                ##   in Loop: Header=BB6_15 Depth=1
	movl	$0, -84(%rbp)
LBB6_38:                                ##   in Loop: Header=BB6_15 Depth=1
	jmp	LBB6_39
LBB6_39:                                ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -92(%rbp)
	jne	LBB6_43
## BB#40:                               ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	movq	-16(%rbp), %rcx
	movsbl	8(%rcx), %edx
	cmpl	%edx, %eax
	je	LBB6_42
## BB#41:                               ##   in Loop: Header=BB6_15 Depth=1
	movsbl	-93(%rbp), %eax
	cmpl	$10, %eax
	jne	LBB6_52
LBB6_42:                                ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -76(%rbp)
	jne	LBB6_52
LBB6_43:                                ##   in Loop: Header=BB6_15 Depth=1
	cmpl	$0, -88(%rbp)
	je	LBB6_45
## BB#44:                               ##   in Loop: Header=BB6_15 Depth=1
	movl	-80(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -128(%rbp)        ## 4-byte Spill
	jmp	LBB6_46
LBB6_45:                                ##   in Loop: Header=BB6_15 Depth=1
	movl	-80(%rbp), %eax
	movl	%eax, -128(%rbp)        ## 4-byte Spill
LBB6_46:                                ##   in Loop: Header=BB6_15 Depth=1
	movl	-128(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-72(%rbp), %rdx
	movb	$0, (%rdx,%rcx)
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movslq	-60(%rbp), %rcx
	movq	-56(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rax, (%rdi,%rcx,8)
	movslq	-60(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	(%rcx,%rax,8), %rdi
	movq	-72(%rbp), %rsi
	callq	___strcpy_chk
	movq	-72(%rbp), %rdi
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	callq	_free
	movq	-56(%rbp), %rax
	movl	8(%rax), %r8d
	addl	$1, %r8d
	movl	%r8d, 8(%rax)
	movsbl	-93(%rbp), %r8d
	cmpl	$10, %r8d
	jne	LBB6_48
## BB#47:
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_56
LBB6_48:                                ##   in Loop: Header=BB6_15 Depth=1
	movq	-56(%rbp), %rax
	cmpl	$0, 8(%rax)
	je	LBB6_51
## BB#49:                               ##   in Loop: Header=BB6_15 Depth=1
	movq	-56(%rbp), %rax
	movl	8(%rax), %eax
	cltd
	idivl	-24(%rbp)
	cmpl	$0, %edx
	jne	LBB6_51
## BB#50:                               ##   in Loop: Header=BB6_15 Depth=1
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %ecx
	addl	$2, %ecx
	imull	-24(%rbp), %ecx
	movslq	%ecx, %rdx
	shlq	$3, %rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	_realloc
	movq	-56(%rbp), %rdx
	movq	%rax, (%rdx)
	movl	-20(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -20(%rbp)
LBB6_51:                                ##   in Loop: Header=BB6_15 Depth=1
	movl	$64, -28(%rbp)
	movslq	-28(%rbp), %rdi
	callq	_malloc
	movq	%rax, -72(%rbp)
	movl	$0, -80(%rbp)
	movl	-60(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -60(%rbp)
	movl	$0, -76(%rbp)
	jmp	LBB6_55
LBB6_52:                                ##   in Loop: Header=BB6_15 Depth=1
	movb	-93(%rbp), %al
	movslq	-80(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movb	%al, (%rdx,%rcx)
	movl	-80(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -80(%rbp)
	movl	-80(%rbp), %esi
	movl	-28(%rbp), %edi
	subl	$1, %edi
	cmpl	%edi, %esi
	jne	LBB6_54
## BB#53:                               ##   in Loop: Header=BB6_15 Depth=1
	movl	-28(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-72(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	callq	_realloc
	movq	%rax, -72(%rbp)
LBB6_54:                                ##   in Loop: Header=BB6_15 Depth=1
	jmp	LBB6_55
LBB6_55:                                ##   in Loop: Header=BB6_15 Depth=1
	xorl	%eax, %eax
	movl	$1, %ecx
	movsbl	-93(%rbp), %edx
	cmpl	$34, %edx
	cmovel	%ecx, %eax
	movl	%eax, -88(%rbp)
	jmp	LBB6_15
LBB6_56:
	movq	-8(%rbp), %rax
	addq	$144, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_getErrorMessage
	.align	4, 0x90
_CsvParser_getErrorMessage:             ## @CsvParser_getErrorMessage
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp21:
	.cfi_def_cfa_offset 16
Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp23:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	16(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_getRow
	.align	4, 0x90
_CsvParser_getRow:                      ## @CsvParser_getRow
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp24:
	.cfi_def_cfa_offset 16
Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp26:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	cmpl	$0, 12(%rdi)
	je	LBB8_3
## BB#1:
	movq	-8(%rbp), %rax
	cmpq	$0, 24(%rax)
	jne	LBB8_3
## BB#2:
	movq	-8(%rbp), %rdi
	callq	__CsvParser_getRow
	movq	-8(%rbp), %rdi
	movq	%rax, 24(%rdi)
LBB8_3:
	movq	-8(%rbp), %rdi
	callq	__CsvParser_getRow
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_getHeader
	.align	4, 0x90
_CsvParser_getHeader:                   ## @CsvParser_getHeader
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp27:
	.cfi_def_cfa_offset 16
Ltmp28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp29:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	cmpl	$0, 12(%rdi)
	jne	LBB9_2
## BB#1:
	leaq	L_.str.7(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	__CsvParser_setErrorMessage
	movq	$0, -8(%rbp)
	jmp	LBB9_5
LBB9_2:
	movq	-16(%rbp), %rax
	cmpq	$0, 24(%rax)
	jne	LBB9_4
## BB#3:
	movq	-16(%rbp), %rdi
	callq	__CsvParser_getRow
	movq	-16(%rbp), %rdi
	movq	%rax, 24(%rdi)
LBB9_4:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
LBB9_5:
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_getNumFields
	.align	4, 0x90
_CsvParser_getNumFields:                ## @CsvParser_getNumFields
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp30:
	.cfi_def_cfa_offset 16
Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp32:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	8(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_CsvParser_getFields
	.align	4, 0x90
_CsvParser_getFields:                   ## @CsvParser_getFields
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp33:
	.cfi_def_cfa_offset 16
Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp35:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_getNumOcs
	.align	4, 0x90
_getNumOcs:                             ## @getNumOcs
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp36:
	.cfi_def_cfa_offset 16
Ltmp37:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp38:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$1000, %eax             ## imm = 0x3E8
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movl	$1000, %edx             ## imm = 0x3E8
                                        ## 
	movq	$-1, %rcx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	-8(%rbp), %rsi
	callq	___strncpy_chk
	movl	$0, -28(%rbp)
	movq	%rax, -40(%rbp)         ## 8-byte Spill
LBB12_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_strstr
	movq	%rax, -24(%rbp)
	cmpq	$0, %rax
	je	LBB12_3
## BB#2:                                ##   in Loop: Header=BB12_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -24(%rbp)
	jmp	LBB12_1
LBB12_3:
	movq	-24(%rbp), %rdi
	callq	_free
	movl	-28(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp39:
	.cfi_def_cfa_offset 16
Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp41:
	.cfi_def_cfa_register %rbp
	subq	$4432, %rsp             ## imm = 0x1150
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -4060(%rbp)
	movl	%edi, -4064(%rbp)
	movq	%rsi, -4072(%rbp)
	movl	$0, -4076(%rbp)
	movl	$0, -4080(%rbp)
	cmpl	$2, -4064(%rbp)
	je	LBB13_2
## BB#1:
	xorl	%edi, %edi
	callq	_exit
LBB13_2:
	movq	-4072(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB13_4
## BB#3:
	xorl	%edi, %edi
	callq	_exit
LBB13_4:
	movq	-4072(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	LBB13_6
## BB#5:
	xorl	%edi, %edi
	callq	_exit
LBB13_6:
	leaq	L_.str.3(%rip), %rsi
	movq	-4072(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -4104(%rbp)
	movq	-4104(%rbp), %rdi
	callq	_fopen
	movq	%rax, -4112(%rbp)
	cmpq	$0, -4112(%rbp)
	jne	LBB13_8
## BB#7:
	leaq	L_.str.8(%rip), %rdi
	callq	_perror
	movl	$-1, -4060(%rbp)
	jmp	LBB13_83
LBB13_8:
	movl	$2000, %esi             ## imm = 0x7D0
	leaq	-2016(%rbp), %rdi
	movq	-4112(%rbp), %rdx
	callq	_fgets
	cmpq	$0, %rax
	jne	LBB13_10
## BB#9:
	xorl	%edi, %edi
	callq	_exit
LBB13_10:
	movl	$1000, %eax             ## imm = 0x3E8
	movl	%eax, %edx
	movl	$2000, %eax             ## imm = 0x7D0
	movl	%eax, %ecx
	leaq	-2016(%rbp), %rsi
	leaq	-4016(%rbp), %rdi
	callq	___strncpy_chk
	movl	$1000, %r8d             ## imm = 0x3E8
	movl	%r8d, %edi
	movq	%rax, -4256(%rbp)       ## 8-byte Spill
	callq	_malloc
	leaq	L_.str.9(%rip), %rsi
	leaq	-4016(%rbp), %rdi
	movq	%rax, -4120(%rbp)
	callq	_strtok
	movq	%rax, -4120(%rbp)
	movl	$0, -4124(%rbp)
	movl	$0, -4128(%rbp)
	movl	$-1, -4132(%rbp)
	movl	$0, -4136(%rbp)
	movl	$0, -4140(%rbp)
LBB13_11:                               ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -4120(%rbp)
	je	LBB13_30
## BB#12:                               ##   in Loop: Header=BB13_11 Depth=1
	leaq	L_.str.10(%rip), %rdi
	movq	-4120(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movq	-4120(%rbp), %rdi
	movl	%eax, -4260(%rbp)       ## 4-byte Spill
	callq	_strlen
	subq	$1, %rax
	movq	-4120(%rbp), %rsi
	movsbl	(%rsi,%rax), %ecx
	cmpl	$10, %ecx
	jne	LBB13_15
## BB#13:                               ##   in Loop: Header=BB13_11 Depth=1
	cmpl	$2, -4136(%rbp)
	jge	LBB13_15
## BB#14:                               ##   in Loop: Header=BB13_11 Depth=1
	movl	-4136(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4136(%rbp)
	jmp	LBB13_19
LBB13_15:                               ##   in Loop: Header=BB13_11 Depth=1
	movq	-4120(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$34, %ecx
	jne	LBB13_17
## BB#16:                               ##   in Loop: Header=BB13_11 Depth=1
	movq	-4120(%rbp), %rdi
	callq	_strlen
	subq	$1, %rax
	movq	-4120(%rbp), %rdi
	movsbl	(%rdi,%rax), %ecx
	cmpl	$34, %ecx
	je	LBB13_18
LBB13_17:
	leaq	L_.str.11(%rip), %rdi
	movq	-4120(%rbp), %rax
	movsbl	(%rax), %esi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.12(%rip), %rdi
	movq	-4120(%rbp), %rcx
	movq	%rdi, -4272(%rbp)       ## 8-byte Spill
	movq	%rcx, %rdi
	movl	%eax, -4276(%rbp)       ## 4-byte Spill
	callq	_strlen
	subq	$1, %rax
	movq	-4120(%rbp), %rcx
	movsbl	(%rcx,%rax), %esi
	movq	-4272(%rbp), %rdi       ## 8-byte Reload
	movb	$0, %al
	callq	_printf
	leaq	L_.str.13(%rip), %rdi
	movl	%eax, -4280(%rbp)       ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.14(%rip), %rdi
	movl	%eax, -4284(%rbp)       ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4288(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_18:                               ##   in Loop: Header=BB13_11 Depth=1
	jmp	LBB13_19
LBB13_19:                               ##   in Loop: Header=BB13_11 Depth=1
	cmpl	$1, -4136(%rbp)
	jle	LBB13_21
## BB#20:
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4292(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_21:                               ##   in Loop: Header=BB13_11 Depth=1
	leaq	L_.str.15(%rip), %rsi
	movq	-4120(%rbp), %rdi
	callq	_getNumOcs
	movl	%eax, -4144(%rbp)
	cmpl	$2, -4144(%rbp)
	jle	LBB13_23
## BB#22:
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4296(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_23:                               ##   in Loop: Header=BB13_11 Depth=1
	leaq	L_.str.9(%rip), %rsi
	movq	-4120(%rbp), %rdi
	callq	_getNumOcs
	movl	%eax, -4148(%rbp)
	cmpl	$0, -4148(%rbp)
	jle	LBB13_25
## BB#24:
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4300(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_25:                               ##   in Loop: Header=BB13_11 Depth=1
	leaq	L_.str.16(%rip), %rsi
	movl	$6, %eax
	movl	%eax, %edx
	movq	-4120(%rbp), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB13_27
## BB#26:                               ##   in Loop: Header=BB13_11 Depth=1
	movl	-4128(%rbp), %eax
	movl	%eax, -4132(%rbp)
	movl	$1, -4124(%rbp)
LBB13_27:                               ##   in Loop: Header=BB13_11 Depth=1
	leaq	L_.str.17(%rip), %rsi
	movl	$6, %eax
	movl	%eax, %edx
	movq	-4120(%rbp), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB13_29
## BB#28:                               ##   in Loop: Header=BB13_11 Depth=1
	movl	-4128(%rbp), %eax
	movl	%eax, -4140(%rbp)
LBB13_29:                               ##   in Loop: Header=BB13_11 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	L_.str.9(%rip), %rsi
	callq	_strtok
	movq	%rax, -4120(%rbp)
	movl	-4128(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -4128(%rbp)
	jmp	LBB13_11
LBB13_30:
	cmpl	$0, -4124(%rbp)
	jne	LBB13_32
## BB#31:
	leaq	L_.str.18(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4304(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_32:
	leaq	L_.str.9(%rip), %rsi
	movl	$1, %edx
	movq	-4104(%rbp), %rdi
	callq	_CsvParser_new
	movq	%rax, -4160(%rbp)
	movq	-4160(%rbp), %rdi
	callq	_CsvParser_getHeader
	movq	%rax, -4168(%rbp)
	cmpq	$0, -4168(%rbp)
	jne	LBB13_34
## BB#33:
	movq	-4160(%rbp), %rdi
	callq	_CsvParser_getErrorMessage
	leaq	L_.str.10(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4308(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_34:
	movl	$320000, %eax           ## imm = 0x4E200
	movl	%eax, %edi
	callq	_malloc
	movl	$160000, %ecx           ## imm = 0x27100
	movl	%ecx, %edi
	movq	%rax, -4088(%rbp)
	callq	_malloc
	movq	%rax, -4096(%rbp)
	movq	-4168(%rbp), %rdi
	callq	_CsvParser_getFields
	movq	%rax, -4184(%rbp)
	movl	$0, -4076(%rbp)
LBB13_35:                               ## =>This Inner Loop Header: Depth=1
	movl	-4076(%rbp), %eax
	movq	-4168(%rbp), %rdi
	movl	%eax, -4312(%rbp)       ## 4-byte Spill
	callq	_CsvParser_getNumFields
	movl	-4312(%rbp), %ecx       ## 4-byte Reload
	cmpl	%eax, %ecx
	jge	LBB13_38
## BB#36:                               ##   in Loop: Header=BB13_35 Depth=1
	leaq	L_.str.19(%rip), %rdi
	movslq	-4076(%rbp), %rax
	movq	-4184(%rbp), %rcx
	movq	(%rcx,%rax,8), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -4316(%rbp)       ## 4-byte Spill
## BB#37:                               ##   in Loop: Header=BB13_35 Depth=1
	movl	-4076(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4076(%rbp)
	jmp	LBB13_35
LBB13_38:
	jmp	LBB13_39
LBB13_39:                               ## =>This Inner Loop Header: Depth=1
	movq	-4160(%rbp), %rdi
	callq	_CsvParser_getRow
	movq	%rax, -4176(%rbp)
	cmpq	$0, %rax
	je	LBB13_43
## BB#40:                               ##   in Loop: Header=BB13_39 Depth=1
	leaq	L_.str.20(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-4176(%rbp), %rdi
	movl	%eax, -4320(%rbp)       ## 4-byte Spill
	callq	_CsvParser_getFields
	leaq	L_.str.9(%rip), %rsi
	movq	%rax, -4192(%rbp)
	movslq	-4140(%rbp), %rax
	movq	-4192(%rbp), %rdi
	movq	(%rdi,%rax,8), %rdi
	callq	_getNumOcs
	movl	%eax, -4196(%rbp)
	cmpl	$0, -4196(%rbp)
	jle	LBB13_42
## BB#41:
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edi, %edi
	movl	%eax, -4324(%rbp)       ## 4-byte Spill
	callq	_exit
LBB13_42:                               ##   in Loop: Header=BB13_39 Depth=1
	leaq	L_.str.21(%rip), %rdi
	movslq	-4132(%rbp), %rax
	movq	-4192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rsi
	movb	$0, %al
	callq	_printf
	movl	$16, %edx
                                        ## 
	movq	$-1, %rcx
	movslq	-4080(%rbp), %rsi
	movq	-4088(%rbp), %rdi
	shlq	$4, %rsi
	addq	%rsi, %rdi
	movslq	-4132(%rbp), %rsi
	movq	-4192(%rbp), %r8
	movq	(%r8,%rsi,8), %rsi
	movl	%eax, -4328(%rbp)       ## 4-byte Spill
	callq	___strncpy_chk
	leaq	L_.str.22(%rip), %rdi
	movl	-4080(%rbp), %esi
	movslq	-4080(%rbp), %rcx
	movq	-4088(%rbp), %rdx
	shlq	$4, %rcx
	addq	%rcx, %rdx
	movq	%rax, -4336(%rbp)       ## 8-byte Spill
	movb	$0, %al
	callq	_printf
	movq	-4176(%rbp), %rdi
	movl	%eax, -4340(%rbp)       ## 4-byte Spill
	callq	_CsvParser_destroy_row
	movl	-4080(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4080(%rbp)
	jmp	LBB13_39
LBB13_43:
	movl	-4080(%rbp), %eax
	movl	%eax, -4200(%rbp)
	movl	$0, -4204(%rbp)
LBB13_44:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_46 Depth 2
	movl	-4204(%rbp), %eax
	movl	-4200(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	LBB13_53
## BB#45:                               ##   in Loop: Header=BB13_44 Depth=1
	movl	-4204(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4208(%rbp)
LBB13_46:                               ##   Parent Loop BB13_44 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-4208(%rbp), %eax
	cmpl	-4200(%rbp), %eax
	jge	LBB13_51
## BB#47:                               ##   in Loop: Header=BB13_46 Depth=2
	movslq	-4204(%rbp), %rax
	movq	-4088(%rbp), %rcx
	shlq	$4, %rax
	addq	%rax, %rcx
	movslq	-4208(%rbp), %rax
	movq	-4088(%rbp), %rdx
	shlq	$4, %rax
	addq	%rax, %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jle	LBB13_49
## BB#48:                               ##   in Loop: Header=BB13_46 Depth=2
	movl	$16, %eax
	movl	%eax, %ecx
	leaq	-4032(%rbp), %rdi
	movslq	-4204(%rbp), %rdx
	movq	-4088(%rbp), %rsi
	shlq	$4, %rdx
	addq	%rdx, %rsi
	movq	%rcx, %rdx
	callq	___strncpy_chk
	movl	$16, %r8d
	movl	%r8d, %edx
	movq	$-1, %rcx
	movslq	-4204(%rbp), %rsi
	movq	-4088(%rbp), %rdi
	shlq	$4, %rsi
	addq	%rsi, %rdi
	movslq	-4208(%rbp), %rsi
	movq	-4088(%rbp), %r9
	shlq	$4, %rsi
	addq	%rsi, %r9
	movq	%r9, %rsi
	movq	%rax, -4352(%rbp)       ## 8-byte Spill
	callq	___strncpy_chk
	movl	$16, %r8d
	movl	%r8d, %edx
	movq	$-1, %rcx
	leaq	-4032(%rbp), %rsi
	movslq	-4208(%rbp), %rdi
	movq	-4088(%rbp), %r9
	shlq	$4, %rdi
	addq	%rdi, %r9
	movq	%r9, %rdi
	movq	%rax, -4360(%rbp)       ## 8-byte Spill
	callq	___strncpy_chk
	movq	%rax, -4368(%rbp)       ## 8-byte Spill
LBB13_49:                               ##   in Loop: Header=BB13_46 Depth=2
	jmp	LBB13_50
LBB13_50:                               ##   in Loop: Header=BB13_46 Depth=2
	movl	-4208(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4208(%rbp)
	jmp	LBB13_46
LBB13_51:                               ##   in Loop: Header=BB13_44 Depth=1
	jmp	LBB13_52
LBB13_52:                               ##   in Loop: Header=BB13_44 Depth=1
	movl	-4204(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4204(%rbp)
	jmp	LBB13_44
LBB13_53:
	movl	$0, -4212(%rbp)
LBB13_54:                               ## =>This Inner Loop Header: Depth=1
	movl	-4212(%rbp), %eax
	cmpl	-4080(%rbp), %eax
	jge	LBB13_57
## BB#55:                               ##   in Loop: Header=BB13_54 Depth=1
	leaq	L_.str.10(%rip), %rdi
	movslq	-4212(%rbp), %rax
	movq	-4088(%rbp), %rcx
	shlq	$4, %rax
	addq	%rax, %rcx
	movq	%rcx, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -4372(%rbp)       ## 4-byte Spill
## BB#56:                               ##   in Loop: Header=BB13_54 Depth=1
	movl	-4212(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4212(%rbp)
	jmp	LBB13_54
LBB13_57:
	movl	$400000, %eax           ## imm = 0x61A80
	movl	%eax, %edi
	movl	$0, -4216(%rbp)
	movl	$0, -4224(%rbp)
	callq	_malloc
	movq	%rax, -4096(%rbp)
	movl	$0, -4228(%rbp)
LBB13_58:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_60 Depth 2
	movl	-4228(%rbp), %eax
	movl	-4080(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	LBB13_64
## BB#59:                               ##   in Loop: Header=BB13_58 Depth=1
	movl	$16, %eax
	movl	%eax, %edx
	movq	$-1, %rcx
	movl	$0, -4216(%rbp)
	movslq	-4224(%rbp), %rsi
	imulq	$20, %rsi, %rsi
	addq	-4096(%rbp), %rsi
	addq	$4, %rsi
	movslq	-4228(%rbp), %rdi
	movq	-4088(%rbp), %r8
	shlq	$4, %rdi
	addq	%rdi, %r8
	movq	%rsi, %rdi
	movq	%r8, %rsi
	callq	___strncpy_chk
	leaq	L_.str.23(%rip), %rdi
	movslq	-4228(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	addq	$4, %rcx
	movq	%rcx, %rsi
	movq	%rax, -4384(%rbp)       ## 8-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.24(%rip), %rdi
	movslq	-4228(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	movl	(%rcx), %esi
	movl	%eax, -4388(%rbp)       ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$1, -4220(%rbp)
	movl	%eax, -4392(%rbp)       ## 4-byte Spill
LBB13_60:                               ##   Parent Loop BB13_58 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	$16, %eax
	movl	%eax, %edx
	movslq	-4228(%rbp), %rcx
	movq	-4088(%rbp), %rsi
	shlq	$4, %rcx
	addq	%rcx, %rsi
	movl	-4228(%rbp), %eax
	addl	-4220(%rbp), %eax
	movslq	%eax, %rcx
	movq	-4088(%rbp), %rdi
	shlq	$4, %rcx
	addq	%rcx, %rdi
	movq	%rdi, -4400(%rbp)       ## 8-byte Spill
	movq	%rsi, %rdi
	movq	-4400(%rbp), %rsi       ## 8-byte Reload
	callq	_strncmp
	cmpl	$0, %eax
	setne	%r8b
	xorb	$-1, %r8b
	testb	$1, %r8b
	jne	LBB13_61
	jmp	LBB13_62
LBB13_61:                               ##   in Loop: Header=BB13_60 Depth=2
	leaq	L_.str.23(%rip), %rdi
	movslq	-4228(%rbp), %rax
	movq	-4088(%rbp), %rcx
	shlq	$4, %rax
	addq	%rax, %rcx
	movq	%rcx, %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.25(%rip), %rdi
	movl	-4228(%rbp), %edx
	addl	-4220(%rbp), %edx
	movslq	%edx, %rcx
	movq	-4088(%rbp), %rsi
	shlq	$4, %rcx
	addq	%rcx, %rsi
	movl	%eax, -4404(%rbp)       ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	-4220(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -4220(%rbp)
	movl	%eax, -4408(%rbp)       ## 4-byte Spill
	jmp	LBB13_60
LBB13_62:                               ##   in Loop: Header=BB13_58 Depth=1
	movl	-4220(%rbp), %eax
	movslq	-4224(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	-4228(%rbp), %eax
	addl	-4220(%rbp), %eax
	movl	%eax, -4228(%rbp)
	movl	$0, -4220(%rbp)
	movl	-4224(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4224(%rbp)
## BB#63:                               ##   in Loop: Header=BB13_58 Depth=1
	movl	-4228(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4228(%rbp)
	jmp	LBB13_58
LBB13_64:
	movl	$0, -4232(%rbp)
LBB13_65:                               ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -4232(%rbp)
	jge	LBB13_68
## BB#66:                               ##   in Loop: Header=BB13_65 Depth=1
	leaq	L_.str.26(%rip), %rdi
	movslq	-4232(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	addq	$4, %rax
	movslq	-4232(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	movl	(%rcx), %edx
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -4412(%rbp)       ## 4-byte Spill
## BB#67:                               ##   in Loop: Header=BB13_65 Depth=1
	movl	-4232(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4232(%rbp)
	jmp	LBB13_65
LBB13_68:
	movl	$0, -4236(%rbp)
LBB13_69:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_71 Depth 2
	movl	-4236(%rbp), %eax
	movl	-4224(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	LBB13_78
## BB#70:                               ##   in Loop: Header=BB13_69 Depth=1
	movl	-4236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4240(%rbp)
LBB13_71:                               ##   Parent Loop BB13_69 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-4240(%rbp), %eax
	cmpl	-4224(%rbp), %eax
	jge	LBB13_76
## BB#72:                               ##   in Loop: Header=BB13_71 Depth=2
	movslq	-4236(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	movl	(%rax), %ecx
	movslq	-4240(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	cmpl	(%rax), %ecx
	jge	LBB13_74
## BB#73:                               ##   in Loop: Header=BB13_71 Depth=2
	movslq	-4236(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -4056(%rbp)
	movq	8(%rax), %rcx
	movq	%rcx, -4048(%rbp)
	movl	16(%rax), %edx
	movl	%edx, -4040(%rbp)
	movslq	-4236(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	movslq	-4240(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, (%rax)
	movq	8(%rcx), %rsi
	movq	%rsi, 8(%rax)
	movl	16(%rcx), %edx
	movl	%edx, 16(%rax)
	movslq	-4240(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	movq	-4056(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	-4048(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movl	-4040(%rbp), %edx
	movl	%edx, 16(%rax)
LBB13_74:                               ##   in Loop: Header=BB13_71 Depth=2
	jmp	LBB13_75
LBB13_75:                               ##   in Loop: Header=BB13_71 Depth=2
	movl	-4240(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4240(%rbp)
	jmp	LBB13_71
LBB13_76:                               ##   in Loop: Header=BB13_69 Depth=1
	jmp	LBB13_77
LBB13_77:                               ##   in Loop: Header=BB13_69 Depth=1
	movl	-4236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4236(%rbp)
	jmp	LBB13_69
LBB13_78:
	leaq	L_.str.27(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -4244(%rbp)
	movl	%eax, -4416(%rbp)       ## 4-byte Spill
LBB13_79:                               ## =>This Inner Loop Header: Depth=1
	cmpl	$10, -4244(%rbp)
	jge	LBB13_82
## BB#80:                               ##   in Loop: Header=BB13_79 Depth=1
	leaq	L_.str.28(%rip), %rdi
	movslq	-4244(%rbp), %rax
	imulq	$20, %rax, %rax
	addq	-4096(%rbp), %rax
	addq	$4, %rax
	movslq	-4244(%rbp), %rcx
	imulq	$20, %rcx, %rcx
	addq	-4096(%rbp), %rcx
	movl	(%rcx), %edx
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -4420(%rbp)       ## 4-byte Spill
## BB#81:                               ##   in Loop: Header=BB13_79 Depth=1
	movl	-4244(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4244(%rbp)
	jmp	LBB13_79
LBB13_82:
	movq	-4160(%rbp), %rdi
	callq	_CsvParser_destroy
	movq	-4088(%rbp), %rdi
	callq	_free
	movq	-4096(%rbp), %rdi
	callq	_free
	movq	-4112(%rbp), %rdi
	callq	_fclose
	movl	$0, -4060(%rbp)
	movl	%eax, -4424(%rbp)       ## 4-byte Spill
LBB13_83:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movl	-4060(%rbp), %ecx
	movq	(%rax), %rax
	cmpq	-8(%rbp), %rax
	movl	%ecx, -4428(%rbp)       ## 4-byte Spill
	jne	LBB13_85
## BB#84:                               ## %SP_return
	movl	-4428(%rbp), %eax       ## 4-byte Reload
	addq	$4432, %rsp             ## imm = 0x1150
	popq	%rbp
	retq
LBB13_85:                               ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Supplied CSV file path is NULL"

L_.str.1:                               ## @.str.1
	.asciz	"Supplied CSV string is NULL"

L_.str.2:                               ## @.str.2
	.asciz	"Supplied delimiter is not supported"

L_.str.3:                               ## @.str.3
	.asciz	"r"

L_.str.4:                               ## @.str.4
	.space	1

L_.str.5:                               ## @.str.5
	.asciz	"Error opening CSV file for reading: %s : %s"

L_.str.6:                               ## @.str.6
	.asciz	"Reached EOF"

L_.str.7:                               ## @.str.7
	.asciz	"Cannot supply header, as current CsvParser object does not support header"

L_.str.8:                               ## @.str.8
	.asciz	"Error opening file"

L_.str.9:                               ## @.str.9
	.asciz	","

L_.str.10:                              ## @.str.10
	.asciz	"%s\n"

L_.str.11:                              ## @.str.11
	.asciz	"token 0:%c\n"

L_.str.12:                              ## @.str.12
	.asciz	"token last:%c\n"

L_.str.13:                              ## @.str.13
	.asciz	"Quote mark missing at start of header\n"

L_.str.14:                              ## @.str.14
	.asciz	"Invalid Input Format\n"

L_.str.15:                              ## @.str.15
	.asciz	"\"\""

L_.str.16:                              ## @.str.16
	.asciz	"\"name\""

L_.str.17:                              ## @.str.17
	.asciz	"\"text\""

L_.str.18:                              ## @.str.18
	.asciz	"Did not find name column\n"

L_.str.19:                              ## @.str.19
	.asciz	"TITLE: %s\n"

L_.str.20:                              ## @.str.20
	.asciz	"NEW LINE:\n"

L_.str.21:                              ## @.str.21
	.asciz	"FIELD: %s\n"

L_.str.22:                              ## @.str.22
	.asciz	"tweet container at %d: %s\n"

L_.str.23:                              ## @.str.23
	.asciz	"name to look for:%s\n"

L_.str.24:                              ## @.str.24
	.asciz	"current count is:%d\n"

L_.str.25:                              ## @.str.25
	.asciz	"next name: %s\n"

L_.str.26:                              ## @.str.26
	.asciz	"Name: %s count: %d\n"

L_.str.27:                              ## @.str.27
	.asciz	"Printing top 10... --------------------- \n"

L_.str.28:                              ## @.str.28
	.asciz	"Name: %s, Count: %d\n"


.subsections_via_symbols
