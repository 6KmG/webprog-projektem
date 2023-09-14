extern printf:proc
extern scanf:proc
extern time:proc
extern rand:proc
extern srand:proc 
extern ExitProcess:proc

.data
    intFormat   db "%d, %d, %d, %d, %d, %d", 10, 0

.code
main proc
    push rbp
    mov rbp, rsp
    sub rsp, 4


    push 444444444


    mov rdx, 1
    mov r8, 2
    mov r9, 3

    mov rcx, offset intFormat
    call printf

    xor rcx, rcx
    call ExitProcess
main endp
end