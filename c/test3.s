	.file	"test3.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	count1
	.data
	.align 4
count1:
	.long	1
	.globl	count2
	.bss
	.align 4
count2:
	.space 4
	.globl	count3
	.align 4
count3:
	.space 4
	.globl	count4
	.align 4
count4:
	.space 4
	.text
	.globl	primes1
	.def	primes1;	.scl	2;	.type	32;	.endef
	.seh_proc	primes1
primes1:
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
	movq	%rcx, 48(%rbp)
	movl	$3, -8(%rbp)
	movl	$380000, -12(%rbp)
	movl	-8(%rbp), %ebx
	jmp	.L4
.L10:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L5
.L8:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L6
	movb	$0, -1(%rbp)
	jmp	.L7
.L6:
	addl	$2, %esi
.L5:
	cmpl	%edi, %esi
	jle	.L8
.L7:
	cmpb	$1, -1(%rbp)
	jne	.L9
	movl	count1(%rip), %eax
	addl	$1, %eax
	movl	%eax, count1(%rip)
.L9:
	addl	$2, %ebx
.L4:
	cmpl	-12(%rbp), %ebx
	jl	.L10
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.globl	primes2
	.def	primes2;	.scl	2;	.type	32;	.endef
	.seh_proc	primes2
primes2:
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
	movq	%rcx, 48(%rbp)
	movl	$380001, -8(%rbp)
	movl	$620000, -12(%rbp)
	movl	-8(%rbp), %ebx
	jmp	.L13
.L19:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L14
.L17:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L15
	movb	$0, -1(%rbp)
	jmp	.L16
.L15:
	addl	$2, %esi
.L14:
	cmpl	%edi, %esi
	jle	.L17
.L16:
	cmpb	$1, -1(%rbp)
	jne	.L18
	movl	count2(%rip), %eax
	addl	$1, %eax
	movl	%eax, count2(%rip)
.L18:
	addl	$2, %ebx
.L13:
	cmpl	-12(%rbp), %ebx
	jl	.L19
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.globl	primes3
	.def	primes3;	.scl	2;	.type	32;	.endef
	.seh_proc	primes3
primes3:
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
	movq	%rcx, 48(%rbp)
	movl	$620001, -8(%rbp)
	movl	$820000, -12(%rbp)
	movl	-8(%rbp), %ebx
	jmp	.L22
.L28:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L23
.L26:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L24
	movb	$0, -1(%rbp)
	jmp	.L25
.L24:
	addl	$2, %esi
.L23:
	cmpl	%edi, %esi
	jle	.L26
.L25:
	cmpb	$1, -1(%rbp)
	jne	.L27
	movl	count3(%rip), %eax
	addl	$1, %eax
	movl	%eax, count3(%rip)
.L27:
	addl	$2, %ebx
.L22:
	cmpl	-12(%rbp), %ebx
	jl	.L28
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.globl	primes4
	.def	primes4;	.scl	2;	.type	32;	.endef
	.seh_proc	primes4
primes4:
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
	movq	%rcx, 48(%rbp)
	movl	$820001, -8(%rbp)
	movl	$1000000, -12(%rbp)
	movl	-8(%rbp), %ebx
	jmp	.L31
.L37:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L32
.L35:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L33
	movb	$0, -1(%rbp)
	jmp	.L34
.L33:
	addl	$2, %esi
.L32:
	cmpl	%edi, %esi
	jle	.L35
.L34:
	cmpb	$1, -1(%rbp)
	jne	.L36
	movl	count4(%rip), %eax
	addl	$1, %eax
	movl	%eax, count4(%rip)
.L36:
	addl	$2, %ebx
.L31:
	cmpl	-12(%rbp), %ebx
	jl	.L37
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "%d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	call	__main
	leaq	-36(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	primes1(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	movq	__imp_CreateThread(%rip), %rax
	call	*%rax
	movq	%rax, -8(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	primes2(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	movq	__imp_CreateThread(%rip), %rax
	call	*%rax
	movq	%rax, -16(%rbp)
	leaq	-44(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	primes3(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	movq	__imp_CreateThread(%rip), %rax
	call	*%rax
	movq	%rax, -24(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	primes4(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	movq	__imp_CreateThread(%rip), %rax
	call	*%rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	movq	__imp_WaitForSingleObject(%rip), %rax
	call	*%rax
	movq	-16(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	movq	__imp_WaitForSingleObject(%rip), %rax
	call	*%rax
	movq	-24(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	movq	__imp_WaitForSingleObject(%rip), %rax
	call	*%rax
	movq	-32(%rbp), %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	movq	__imp_WaitForSingleObject(%rip), %rax
	call	*%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp_CloseHandle(%rip), %rax
	call	*%rax
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp_CloseHandle(%rip), %rax
	call	*%rax
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp_CloseHandle(%rip), %rax
	call	*%rax
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp_CloseHandle(%rip), %rax
	call	*%rax
	movl	count1(%rip), %edx
	movl	count2(%rip), %eax
	addl	%eax, %edx
	movl	count3(%rip), %eax
	addl	%eax, %edx
	movl	count4(%rip), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.1.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
