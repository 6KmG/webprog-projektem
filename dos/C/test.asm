.MODEL small 
.STACK 
.data
    msg db ?
    errorMessage db "Exception!",0


.CODE
exitProcess proc
    mov ah, 4Ch
    int 21h
exitProcess endp

printChar proc
    MOV AH, 2
    INT 21h
    ret
printChar endp

readChar proc
    mov ah, 01h
    int 21h
    mov dl, al

    ret
readChar endp 

print proc
    mov dl, [bx]
    cmp dl, 0
    je exit

    call printChar

    inc bx
    jmp print

    exit:
        mov dl, 0
        call printChar
        ret
print endp

printLine proc
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
        ret
printLine endp

read proc
    looping:
        call readChar
        cmp dl, " "
        je exit
        mov byte ptr [bx], dl 
        inc bx

    jmp looping

    exit: 
        mov byte ptr [bx], 0
        ret
read endp 

exception proc
    lea bx, errorMessage 
    call print
    mov ax, 1
    ret
exception endp

readInt proc
    push bx
    call read
    pop bx

    xor ax, ax
    xor dx, dx

    looping:
        mov al, byte ptr [bx] ; "6" "5"


        
        cmp al, "9"
        jg error1

        sub ax, "0" ; 6 5
        add ax, dx  ; ax: 6 + 0 = 6 ax: 5 + 60 = 65
        mov cx, 10
        mul cx ; ax: 6 * 10 = 60

        mov dx, ax ; dx : 60

        inc bx ; byte ptr [bx] = "3"
        jmp looping

    error1:
        call exception
        ret

    exitcode:
        mov ax, dx
        mov dl, 10
        idiv dl
        mov dx, ax
        ret
readInt endp

main proc
    mov ax, DGROUP
    mov ds, ax

    ; code here
    lea bx, msg
    call readInt

    call printChar

    call exitProcess
main endp
END main