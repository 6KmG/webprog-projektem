.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
    ; message db 0
    ; titlebar db 0

.code
main:
    ;invoke MessageBox, 0, addr message, addr titlebar, 0
    ; xor edx, edx
    ; mov eax, 21
    ; mov ebx, 8
    ; idiv ebx
    
    ; push edx
    ; push offset format
    ; push offset message
    ; call wsprintfA

    push 0
    push 0 ; offset titlebar
    push 0 ; offset message
    push 0
    call MessageBox

    push 0
    call ExitProcess
end main
