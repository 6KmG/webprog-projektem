global _main

extern _ExitProcess@4
extern _MessageBoxA@16

section .data
    title db "Title", 0
    msg db "Please choose yes or no.", 0

    yes_msg db "You choosed yes.", 0
    no_msg db "You choosed no."

section .text
_main:
    push 0x040034
    push title
    push msg
    push 0
    call _MessageBoxA@16

    cmp eax, 6
    je yes

    cmp eax, 7
    je no

    push 1
    call _ExitProcess@4

yes:
    push 0x040000
    push title
    push yes_msg
    push 0
    call _MessageBoxA@16

    push 0
    call _ExitProcess@4

no:
    push 0x040000
    push title
    push no_msg
    push 0
    call _MessageBoxA@16

    push 0
    call _ExitProcess@4