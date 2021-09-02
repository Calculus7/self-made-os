	.file	"kernel.c"
	.text
	.section	.rodata
.LC0:
	.string	"X"
	.align 8
.LC1:
	.string	"This text spans multiple lines"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	clear_screen@PLT
	movl	$6, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	kprint_at@PLT
	movl	$10, %edx
	movl	$75, %esi
	leaq	.LC1(%rip), %rdi
	call	kprint_at@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
