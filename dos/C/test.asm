.MODEL small 
.STACK 
.data
    msg db "sadas",0

.CODE
printChar proc
    push ax

    MOV AH, 2
    INT 21h

    pop ax
    ret
printChar endp

readChar proc
    push ax

    mov ah, 01h
    int 21h
    xor bx, bx
    mov dl, al

    pop ax
    ret
readChar endp 

print proc
    push ax

    mov dl, [bx]
    cmp dl, 0
    je exit

    call printChar

    inc bx
    jmp print

    exit:
        mov dl, 0
        call printChar
        pop ax
        ret
print endp

printLine proc
    push ax

    looping:
        mov dl, [bx]
        cmp dl, 0
        je exit

        call printChar

        inc bx
        jmp looping

    exit:
        mov dl, 10
        call printChar

        pop ax
        ret
printLine endp


main proc
    mov ax, DGROUP
    mov ds, ax

    ; code here

    lea bx, msg
    call print
 
    mov ah, 4Ch
    int 21h
main endp
END main