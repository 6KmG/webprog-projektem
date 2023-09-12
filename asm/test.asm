extern printf:proc
extern scanf:proc
extern time:proc
extern rand:proc
extern srand:proc 

.data
    intFormat   db "%d", 10, 0
    a           dq ?

.code
main proc
    push rbp
    mov rbp, rsp

    mov rcx, offset a
    call time 

    mov rcx, [a]
    call srand

    call rand
    call rand

    mov rax, rcx
    mov rbx, 100
    idiv rbx

    ; mov rdx, rdx
    mov rcx, offset intFormat
    call printf

    xor rcx, rcx
    call ExitProcess
main endp
end