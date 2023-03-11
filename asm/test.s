.global	main
main:
	push	%rbp
	movq	%rsp, %rbp
	sub	$32, %rsp

	lea	.testing(%rip), %rcx
	call puts

	mov	$0, %eax
	add	$32, %rsp
	pop	%rbp
	ret


.testing:
	.ascii "hello\0"
