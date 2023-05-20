#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <Windows.h>
#include "myfunctions.h"

int main(int argc, char *argv[]){
    for(int i = 0; i < 10; i++) printf("%d, ", random(0, 100));

}