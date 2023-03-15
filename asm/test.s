.intel_syntax noprefix

.section .data

caption: .asciz "GAS Greeting"
message: .asciz "Hello World!"
.align 4,0

.section .text
.balign 16
.globl main
main:


push 3                 # style
push offset caption    # caption
push offset message    # message
push 0                 # window handle
call _MessageBoxA@16   # MessageBox

ret 16