section .data
    number dq 0

section .text
global main
main:
    mov rdi, 3                  ;Outer loop iterator
    mov rcx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add rdi, 2
        mov rbx, 3                      ;Inner loop iterator
        mov [number], rdi
        fild qword [number]
        fsqrt
        fistp qword [number]
        mov rbp, [number]
        InnerLoop:
            ;if ==, break
            xor rdx, rdx                  ;Remainder
            mov rax, rdi
            idiv rbx
            cmp rdx, 0
            je OuterLoop
            ;else
            add rbx, 2
            cmp rbx, rbp
            jle InnerLoop
        inc rcx
        cmp rdi, 100000000
        jl OuterLoop

    mov rax, rcx                        ;Returning the number of primes
    ret
