global _start
extern ExitProcess
extern MessageBoxA

section .data
    msg db "Hello!",0
    titl db "Title",0

section .text
_start:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov rcx, 0
    mov rdx, titl
    mov r8, msg
    mov r9, 0
    call MessageBoxA

    xor rcx, rcx
    call ExitProcess
