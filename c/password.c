#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    srand(time(0));

    for(char i = 0; i < 8; i++){
        putchar(rand()%133+33);
    }
    putchar(10);
    system("pause");
    return 0;
}