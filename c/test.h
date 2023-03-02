#pragma once

#include <windows.h>

void WinApiPrintf(const char *mytext, int arguments1,...){

    char buffer[100];
    int a = wsprintfA(buffer, mytext, arguments1);
    WriteFile(GetStdHandle(-11), buffer, a, 0, 0);
}
