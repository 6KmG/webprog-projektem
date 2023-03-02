	.globl	main
main:
	push	%rbp
	push	%rsi
	push	%rbx
	sub	$32, %rsp
	lea	32(%rsp), %rbp
	mov	$0, %ebx
	jmp	.L2
.L5:
	mov	$0, %esi
	jmp	.L3
.L4:
	add	$1, %esi
.L3:
	cmp	$49999, %esi
	jle	.L4
	add	$1, %ebx
.L2:
	cmp	$49999, %ebx
	jle	.L5
	mov	$0, %eax
	add	$32, %rsp
	pop	%rbx
	pop	%rsi
	pop	%rbp
	ret
