section .data
number db 9

section .text
global main:
    mov edi, number
    fild dword [edi]
    fsqrt
    fistp dword [edi]
    mov eax, [edi]

    ret
