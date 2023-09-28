extern printf:proc
extern ExitProcess:proc
extern CreateThread:proc
extern WaitForSingleObject:proc
extern CloseHandle:proc

.data
    number dd 0

    intFormat  db "%d", 10, 0

.code
primes1 proc
    mov edi, 3                  ;Outer loop iterator (bottom)
    mov ecx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add edi, 2
        mov ebx, 3                      ;Inner loop iterator
        mov number, edi
        fild number
        fsqrt
        fistp number
        mov ebp, number
        InnerLoop:
            ;if ==, break
            xor edx, edx                  ;Remainder
            mov eax, edi
            idiv ebx
            cmp edx, 0
            je OuterLoop
            ;else
            add ebx, 2
            cmp ebx, ebp
            jle InnerLoop
        inc ecx
        cmp edi, 380000        ;top
        jl OuterLoop

    mov eax, ecx                        ;Returning the number of primes
    ret
primes1 endp

primes2 proc
    mov edi, 380001                  ;Outer loop iterator (bottom)
    mov ecx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add edi, 2
        mov ebx, 3                      ;Inner loop iterator
        mov number, edi
        fild number
        fsqrt
        fistp number
        mov ebp, number
        InnerLoop:
            ;if ==, break
            xor edx, edx                  ;Remainder
            mov eax, edi
            idiv ebx
            cmp edx, 0
            je OuterLoop
            ;else
            add ebx, 2
            cmp ebx, ebp
            jle InnerLoop
        inc ecx
        cmp edi, 620000        ;top
        jl OuterLoop

    mov eax, ecx                        ;Returning the number of primes
    ret
primes2 endp


primes3 proc
    mov edi, 620001                  ;Outer loop iterator (bottom)
    mov ecx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add edi, 2
        mov ebx, 3                      ;Inner loop iterator
        mov number, edi
        fild number
        fsqrt
        fistp number
        mov ebp, number
        InnerLoop:
            ;if ==, break
            xor edx, edx                  ;Remainder
            mov eax, edi
            idiv ebx
            cmp edx, 0
            je OuterLoop
            ;else
            add ebx, 2
            cmp ebx, ebp
            jle InnerLoop
        inc ecx
        cmp edi, 820000        ;top
        jl OuterLoop

    mov eax, ecx                        ;Returning the number of primes
    ret
primes3 endp

primes4 proc
    mov edi, 820001                  ;Outer loop iterator (bottom)
    mov ecx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add edi, 2
        mov ebx, 3                      ;Inner loop iterator
        mov number, edi
        fild number
        fsqrt
        fistp number
        mov ebp, number
        InnerLoop:
            ;if ==, break
            xor edx, edx                  ;Remainder
            mov eax, edi
            idiv ebx
            cmp edx, 0
            je OuterLoop
            ;else
            add ebx, 2
            cmp ebx, ebp
            jle InnerLoop
        inc ecx
        cmp edi, 1000000        ;top
        jl OuterLoop

    mov eax, ecx                        ;Returning the number of primes
    ret
primes4 endp

main proc
    call primes1
    mov rdx, rax
    lea rcx, intFormat
    call printf
    mov rcx, 0
    call ExitProcess
main endp
end