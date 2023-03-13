section .data
number db 9

extern _ExitProcess
extern WriteFile
section .text


global _start:
    push 5
    call WriteFile
