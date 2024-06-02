#include <stdio.h>
#include <stdlib.h>

void* func(){
    int *result = 5;    *result = ;
    return (void*) result;
}

int main(int argc, char* argv){
    int *a = (int*) func();
    printf("%d", *a);

    return 0;
}