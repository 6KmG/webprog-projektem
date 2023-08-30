#include <windows.h>

int __main(){
    int diag = MessageBox(0, "hi", "hi", MB_YESNOCANCEL|MB_ICONWARNING);
    while(diag == IDYES) {
        diag = MessageBox(0, "hi", "hi", MB_YESNOCANCEL|MB_ICONERROR);
    }
    ExitProcess(0);
} 