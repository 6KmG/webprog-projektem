#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "myfunctions.h"

int factorial(int x){
    if(x == 0) return 1;
    return factorial(x-1) * x;
}

int main(int argc, char *argv[]){
    printf("%d",factorial(5));

    return 0;
}