.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
    msg db "Hello", 0

.code
main:
    push -11
    call GetStdHandle

    push 0
    push 0
    push 6
    push offset msg
    push eax
    call WriteConsoleA

    push 0
    call ExitProcess
end main

