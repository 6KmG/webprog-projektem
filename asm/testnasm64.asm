section .data
number db 9

section .text
global main:
    mov rdi, number
    fild qword [rdi]
    fsqrt
    fistp qword [rdi]
    mov rax, [rdi]

    ret
