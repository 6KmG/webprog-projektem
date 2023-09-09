.MODEL small 
.STACK 
.data
    msg db "Hello world!",10,0
    msg2 db "Hi there!",10,0
.CODE 
main proc
    mov ax, DGROUP
    mov ds, ax

    lea dx, msg 
    mov ah, 09h
    int 21h
 
    mov ah, 4ch
    int 21h
main endp
END