#pragma once
#include <time.h>

#define len(array) sizeof(array) / sizeof(array [0])

double nanoTime(){
    struct timespec tp;
    clock_gettime(CLOCK_REALTIME, &tp);
    return (double)time(0) + ((double)tp.tv_nsec / 1000000000);
}

int random(int from, int to){
    struct timespec tp;
    clock_gettime(CLOCK_REALTIME, &tp);
    srand(tp.tv_nsec + time(0));
    return rand() % to + from;
}

void printIntArray(int array[], int length){
    for(int i = 0; i < length; i++) printf("%d, ", array[i]);
    putchar('\n');
}

void shuffleIntArray(int array[], int length){
    srand(time(0));
    for(int i = 0; i < length; i++) array[i] = random(0,10);
}
