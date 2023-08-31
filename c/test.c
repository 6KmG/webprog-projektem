#include <windows.h>
<<<<<<< HEAD
int _main(){
    MessageBox(0, 0, 0, 0);
    ExitProcess(0);
}
=======

int __main(){
    int diag = MessageBox(0, "hi", "hi", MB_YESNOCANCEL|MB_ICONWARNING);
    while(diag == IDYES) {
        diag = MessageBox(0, "hi", "hi", MB_YESNOCANCEL|MB_ICONERROR);
    }
    ExitProcess(0);
} 
>>>>>>> e3fb36dbbbfd4271d371da7f1eaeb81c9bb9cf55
