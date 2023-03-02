;Built using MASM32 https://www.masm32.com/
;Compilation and linking command (VSCode):
;cd $dir && ml /c /coff /nologo $fileName && link /subsystem:console /nologo /entry:main $fileNameWithoutExt.obj && $dir$fileNameWithoutExt;echo `nRet:$LASTEXITCODE
;ml /c /coff /nologo $fileName && link /subsystem:console /nologo /entry:main $fileNameWithoutExt.obj && 

.386
.model flat, stdcall
option casemap: none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
    number dd ?
    myformat db "The result: %d",0
    mymsg db ?

.code
main:
    mov edi, 3                  ;Outer loop iterator
    mov ecx, 1                  ;Counter
    ;ebp -> Square root of the outer loop
    ;eax -> Result of division

    OuterLoop:
        add edi, 2
        mov ebx, 3                      ;Inner loop iterator
        mov [number], edi
        fild number
        fsqrt
        fistp number
        mov ebp, [number]
        InnerLoop:
            ;if ==, break
            xor edx, edx                  ;Remainder
            mov eax, edi
            idiv ebx
            cmp edx, 0
            je OuterLoop
            ;else
            add ebx, 2
            cmp ebx, ebp
            jle InnerLoop
        inc ecx
        cmp edi, 100000000
        jl OuterLoop

    invoke wsprintf, offset mymsg, offset myformat, ecx
    invoke GetStdHandle, -11
    invoke WriteFile, eax, offset mymsg, 25, 0, 0
    invoke ExitProcess, 0
end main
