extern ExitProcess:proc
extern WriteConsoleA:proc 
extern GetStdHandle:proc

option casemap:none

.data
    msg db "Hello world!",10,0

.code
main proc
    push 5
    pop rcx
    call ExitProcess
main endp
end