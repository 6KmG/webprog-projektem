#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

double uTime(){
    struct timespec tp;
    clock_gettime(CLOCK_REALTIME, &tp);
    return (double)time(0) + ((double)tp.tv_nsec / 1000000000);
}

int main(int argc, char *argv[]){
    for(unsigned char i = 0; i < 255; i++)printf("%f\n",uTime());
    
}