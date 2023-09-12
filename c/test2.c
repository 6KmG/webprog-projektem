#include <windows.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

long long a;
int main(){
    time(&a);
    srand(a);
    for(int i = 0; i < 5; i++){
        printf("%d ", rand());
    }
    
}