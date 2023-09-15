extern printf:proc
extern scanf:proc
extern time:proc
extern rand:proc
extern srand:proc 
extern ExitProcess:proc

.data
    intFormat   db "%d, %d, %d, %d, %d, %d", 10, 0

    intFormat2  db "%d", 10, 0

.code
main proc
    push rbp
    mov rbp, rsp
    sub rsp, 128

    mov rdx, 1
    mov r8, 2
    mov r9, 3

    mov qword ptr [rsp + 32], 4
    mov qword ptr [rsp + 40], 5
    mov qword ptr [rsp + 48], 6

    lea rcx, intFormat
    call printf

    mov rdx, qword ptr [rsp + 32]
    lea rcx, intFormat2
    call printf

    xor rcx, rcx
    call ExitProcess
main endp
end