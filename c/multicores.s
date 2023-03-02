	.file	"multicores.c"
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
	movl	$3, %ebx
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
	cmpl	$379999999, %ebx
	jle	.L10
	nop
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
	movl	$380000001, %ebx
	jmp	.L12
.L18:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L13
.L16:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L14
	movb	$0, -1(%rbp)
	jmp	.L15
.L14:
	addl	$2, %esi
.L13:
	cmpl	%edi, %esi
	jle	.L16
.L15:
	cmpb	$1, -1(%rbp)
	jne	.L17
	movl	count2(%rip), %eax
	addl	$1, %eax
	movl	%eax, count2(%rip)
.L17:
	addl	$2, %ebx
.L12:
	cmpl	$619999999, %ebx
	jle	.L18
	nop
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
	movl	$620000001, %ebx
	jmp	.L20
.L26:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L21
.L24:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L22
	movb	$0, -1(%rbp)
	jmp	.L23
.L22:
	addl	$2, %esi
.L21:
	cmpl	%edi, %esi
	jle	.L24
.L23:
	cmpb	$1, -1(%rbp)
	jne	.L25
	movl	count3(%rip), %eax
	addl	$1, %eax
	movl	%eax, count3(%rip)
.L25:
	addl	$2, %ebx
.L20:
	cmpl	$819999999, %ebx
	jle	.L26
	nop
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
	movl	$820000001, %ebx
	jmp	.L28
.L34:
	movb	$1, -1(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %edi
	movl	$3, %esi
	jmp	.L29
.L32:
	movl	%ebx, %eax
	cltd
	idivl	%esi
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L30
	movb	$0, -1(%rbp)
	jmp	.L31
.L30:
	addl	$2, %esi
.L29:
	cmpl	%edi, %esi
	jle	.L32
.L31:
	cmpb	$1, -1(%rbp)
	jne	.L33
	movl	count4(%rip), %eax
	addl	$1, %eax
	movl	%eax, count4(%rip)
.L33:
	addl	$2, %ebx
.L28:
	cmpl	$999999999, %ebx
	jle	.L34
	nop
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
	.ascii "%d\0"
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
	leaq	-8(%rbp), %rax
	movl	$0, %r9d
	leaq	primes1(%rip), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_create
	leaq	-16(%rbp), %rax
	movl	$0, %r9d
	leaq	primes2(%rip), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_create
	leaq	-24(%rbp), %rax
	movl	$0, %r9d
	leaq	primes3(%rip), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_create
	leaq	-32(%rbp), %rax
	movl	$0, %r9d
	leaq	primes4(%rip), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_create
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_join
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_join
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_join
	movq	-32(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	pthread_join
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
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 12.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	pthread_create;	.scl	2;	.type	32;	.endef
	.def	pthread_join;	.scl	2;	.type	32;	.endef
