.386
.model flat, stdcall

include E:\masm32\include\kernel32.inc
includelib E:\masm32\lib\kernel32.lib
include E:\masm32\include\user32.inc
includelib E:\masm32\lib\user32.lib

.data

.code
main:
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    loop1:
        loop2:
            loop3:
                loop4:
                    inc eax
                    cmp eax, 127
                    jl loop4

                inc ebx
                cmp ebx, 127
                jl loop3

            inc ecx
            cmp ecx, 127
            jl loop2

        inc edx
        cmp edx, 127
        jl loop1


    push edx
    call ExitProcess
end main

