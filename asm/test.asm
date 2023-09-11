extern ExitProcess:proc
extern WriteConsoleA:proc 
extern GetStdHandle:proc
extern MessageBoxA:proc

.data
    msg db "Hello world!",0
    titl db "TItle",0

.code
main proc
    push rbp
    mov rbp, rsp
    sub rsp, 1024

    mov rcx, -11
    call GetStdHandle
    
    ; mov rcx, 0
    ; mov rdx, offset titl
    ; mov r8, offset msg
    ; mov r9, 0
    ; call MessageBoxA

    mov rbx, 0
    mov rax, 0FFFFFFh
    looping:
        inc rbx
        cmp rbx, rax
        jl looping

    mov rcx, rcx            ; GetStdHandle return
    mov rdx, offset msg     ; Pointer to the string
    mov r8, 15              ; Length of the string
    mov r9, 0               ; 4th parameter
    call WriteConsoleA

    xor rcx, rcx
    call ExitProcess
main endp
end