.MODEL small 
.STACK 
.data

    a db 0
    b db 0

.CODE 
main proc
    mov al, 3 ; 00000011
    mov bl, 5 ; 00000101

    or al, bl
    mov a, al

    ; mov al, 3 
    ; mov bl, 5 

    ; and al, bl
    ; mov b, al

    ; mov cl, a  
    ; mov dl, b 

    ; or dl, cl

    mov dl, al
    add dl, "0"
    mov ah, 2
    int 21h

    mov ah, 4Ch 
    int 21h
main endp
END