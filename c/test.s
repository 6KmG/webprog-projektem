.LC0:
	.ascii "title\0"
.LC1:
	.ascii "Hello\0"
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp


	movl	$0, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdx
	movl	$0, %ecx
	movq	__imp_MessageBoxA(%rip), %rax
	call	*%rax
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
