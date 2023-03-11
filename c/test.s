.LC0:
	.ascii "git pushed again\0"
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp

	leaq	.LC0(%rip), %rcx
	call	printf
	
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
