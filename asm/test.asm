extern ExitProcess:proc
extern WriteConsoleA:proc 
extern GetStdHandle:proc
extern MessageBoxA:proc

.data
    msg db "Hello world!",10,0
    len equ $-msg
    titl db "TItle",0

.code
main proc
    push rbp
    mov rbp, rsp
    sub rsp, 128

    mov rcx, 0
    mov rdx, offset msg
    mov r8, offset titl
    mov r9, 0
    call MessageBoxA

    mov rcx, -11
    call GetStdHandle

    push 0
    mov rcx, rax            ; GetStdHandle return
    mov rdx, offset msg     ; Pointer to the string
    mov r8, len              ; Length of the string
    mov r9, 0               ; 4th parameter
    call WriteConsoleA

    xor rcx, rcx
    call ExitProcess
main endp
end