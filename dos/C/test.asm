.MODEL small 
.STACK 
.data
    msg db "Hello world!",10,0
    msg2 db "Hi there!",10,0
.CODE 
main proc
    mov ax, DGROUP
    mov ds, ax

    lea bx, msg
    call print

    lea bx, msg2
    call print
 
    mov ah, 4ch
    int 21h
main endp
print proc
    mov dl, [bx]
    cmp dl, 0
    je exit

    MOV AH, 2
    INT 21h

    inc bx

    jmp print

    exit:
        ret
print endp
END