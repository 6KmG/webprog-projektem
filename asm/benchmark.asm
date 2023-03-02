;Built using MASM32 https://www.masm32.com/
;Compilation and linking command (VSCode):
;cd $dir && ml /c /coff /nologo $fileName && link /subsystem:console /nologo /entry:main $fileNameWithoutExt.obj && $dir$fileNameWithoutExt;echo `nRet:$LASTEXITCODE
;ml /c /coff /nologo $fileName && link /subsystem:console /nologo /entry:main $fileNameWithoutExt.obj && 
.386
.model flat, stdcall

.data
    number dword 0

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

    mov eax, ecx                        ;Returning the number of primes
    ret
end main
