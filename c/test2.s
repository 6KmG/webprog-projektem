	.file	"test2.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Hello world!\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movl	$-11, %ecx
	movq	__imp_GetStdHandle(%rip), %rax
	call	*%rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$15, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	movq	__imp_WriteConsoleA(%rip), %rax
	call	*%rax
	movl	$0, %ecx
	movq	__imp_ExitProcess(%rip), %rax
	call	*%rax
	nop
	.seh_endproc
	.ident	"GCC: (GNU) 13.1.0"
