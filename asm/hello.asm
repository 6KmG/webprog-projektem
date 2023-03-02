.386
.model tiny, stdcall
option casemap :none

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib

.data
    titlebar db "Fake virus", 0
    ;myformat db "%d",0
    mytext db "You got infected by a virus!"

.code
main:
    ;invoke wsprintf, offset mytext, offset myformat, 123
    invoke MessageBox, 0, offset mytext, offset titlebar, 0
    invoke ExitProcess, 0 
end main

