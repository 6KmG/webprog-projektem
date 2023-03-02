//gcc -nostdlib -nostartfiles test.c -lkernel32 -luser32 -s -o test
#include <windows.h>
int _start()
{
    WriteFile(GetStdHandle(-11), "Hello, world!", 13, 0, 0);
    MessageBox(0,"title","message",0);
    ExitProcess(0);
}
