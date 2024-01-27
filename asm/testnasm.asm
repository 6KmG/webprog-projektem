section .data
    title db 'Hello, Assembly!',0
    message db 'This is a MessageBox from assembly.',0

section .text
    global _start

_start:
    ; Set up the parameters for MessageBox
    mov     r9d, 0          ; hWnd (handle to the owner window, 0 for desktop)
    lea     r8, [rel title]  ; lpText (pointer to the message string)
    lea     rdx, [rel message] ; lpCaption (pointer to the caption string)
    mov     rcx, 0          ; uType (MessageBox style, 0 for OK button)

    ; Call MessageBox syscall (function number 0x40)
    mov     rax, 0x40       ; syscall number for MessageBox
    sub     rsp, 8          ; align stack
    syscall

    ; Exit the program
    mov     eax, 60         ; syscall number for exit
    xor     edi, edi        ; exit code 0
    syscall
