	.file	"benchmark.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	call	__main
	movl	$1, %edi
	movl	$3, %ebx
	jmp	.L2
.L8:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movl	$3, %esi
	jmp	.L3
.L6:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L4
	movb	$0, -1(%rbp)
	jmp	.L5
.L4:
	addl	$2, %esi
.L3:
	cmpl	-8(%rbp), %esi
	jle	.L6
.L5:
	cmpb	$1, -1(%rbp)
	jne	.L7
	addl	$1, %edi
.L7:
	addl	$2, %ebx
.L2:
	cmpl	$99999999, %ebx
	jle	.L8
	movl	%edi, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 12.2.0"
	.def	sqrt;	.scl	2;	.type	32;	.endef
