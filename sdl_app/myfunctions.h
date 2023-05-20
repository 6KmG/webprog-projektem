#pragma once
#include <time.h>
#include "SDL2/SDL.h"

double nanoTime(){
    struct timespec tp;
    clock_gettime(CLOCK_REALTIME, &tp);
    return (double)time(0) + ((double)tp.tv_nsec / 1000000000);
}
