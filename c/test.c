#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <Windows.h>

#define MAX 8
void printCharArray(char array[], int len){
    for(int i = 0; i < len; i++) printf("%d, ",array[i]);
}

void printIntArray(int array[], int len){
    for(int i = 0; i < len; i++) printf("%d, ",array[i]);
}
#define printNumbers(x) printIntArray(x, sizeof(x) / sizeof(x[0]));putchar('\n')

void mergeSort(int array[], int bottom, int top){
    if(bottom >= top) return;
    
}

int main(int argc, char *argv[]){
    srand(time(0));
    int numbers[MAX];

    int len = sizeof(numbers) / sizeof(numbers[0]);
    for(int i = 0; i < len; i++) numbers[i] = rand() % 100 + 1;

    printNumbers(numbers);

    mergeSort(numbers, 0, sizeof(numbers) / sizeof(numbers[0]) - 1);

    printNumbers(numbers);
}