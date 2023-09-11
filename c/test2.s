	.text

.LC0:
	.ascii "Hello world!"
	.globl	main

main:
	pushq	%rbp
	movq	%rsp, %rbp
	
	movl	$-11, %ecx
	call	GetStdHandle

	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$12, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	WriteConsoleA

	movl	$0, %ecx
	call	ExitProcess
	