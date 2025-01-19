	.file	"benchmark.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"The result: %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	pxor	%xmm1, %xmm1
	movl	$1, %ebp
	pushq	%rbx
	movl	$3, %ebx
	subq	$8, %rsp
	.p2align 4
	.p2align 3
.L8:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	ucomisd	%xmm0, %xmm1
	ja	.L15
	sqrtsd	%xmm0, %xmm0
.L4:
	cvttsd2sil	%xmm0, %esi
	cmpl	$2, %esi
	jle	.L5
	movl	$3, %ecx
	jmp	.L7
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L18:
	addl	$2, %ecx
	cmpl	%ecx, %esi
	jl	.L5
.L7:
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	testl	%edx, %edx
	jne	.L18
	addl	$2, %ebx
	cmpl	$200000001, %ebx
	jne	.L8
.L19:
	movl	%ebp, %esi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	addl	$2, %ebx
	addl	$1, %ebp
	cmpl	$200000001, %ebx
	jne	.L8
	jmp	.L19
.L15:
	call	sqrt@PLT
	pxor	%xmm1, %xmm1
	jmp	.L4
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
