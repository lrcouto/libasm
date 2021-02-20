	.text
	.file	"strlentest.c"
	.globl	strlen_test             # -- Begin function strlen_test
	.p2align	4, 0x90
	.type	strlen_test,@function
strlen_test:                            # @strlen_test
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, -12(%rbp)
	movslq	%ecx, %rsi
	movsbl	(%rax,%rsi), %ecx
	cmpl	$0, %ecx
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_3:
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	strlen_test, .Lfunc_end0-strlen_test
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -8(%rbp)
	je	.LBB1_2
# %bb.1:
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
.LBB1_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	strlen_test
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rsi
	movl	-20(%rbp), %edx
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	xorl	%edx, %edx
	movl	%eax, -24(%rbp)         # 4-byte Spill
	movl	%edx, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"One string-shaped argument please. =)\n"
	.size	.L.str, 39

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"String: %s\nLength: %d\n"
	.size	.L.str.1, 23


	.ident	"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym strlen_test
	.addrsig_sym printf
