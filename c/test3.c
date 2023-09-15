#include <stdio.h>
#include <time.h>
#include <Windows.h>

int main(){
    struct timeval start;
    mingw_gettimeofday(&start, NULL);
    printf(" %d ", start.tv_usec);
}