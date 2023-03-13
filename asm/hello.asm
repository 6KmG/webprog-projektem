.386
.model flat, stdcall

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib
; include \masm32\include\masm32.inc
; includelib \masm32\lib\masm32.lib

.data
    titlebar db "Fake virus", 0
    ; myformat db "%d",0
    mytext db "You got infected by a virus!"

.code
main:
    ; invoke wsprintf, offset mytext, offset myformat, 123

    push 0
    push offset titlebar
    push offset mytext
    push 0
    call MessageBox
    ; invoke MessageBox, 0, offset mytext, offset titlebar, 0

    ; push -11
    ; call GetStdHandle
    ; invoke GetStdHandle, -11

    ; push 0
    ; push 0
    ; push 28
    ; push offset mytext
    ; push eax
    ; call WriteFile
    ; invoke WriteFile, eax, offset mytext, 28, 0, 0

    push 0
    call ExitProcess
end main

