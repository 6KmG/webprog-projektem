#include <windows.h>

int main(){
    HANDLE a = GetStdHandle(-11);
    WriteConsoleA(a, "Hello world!", 15, 0, 0);
    ExitProcess(0);
}