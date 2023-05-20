#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "myfunctions.h"

int main(int argc, char *argv[]){
    int numbers[100000];
    memset(numbers, -1, sizeof(numbers));
    
    shuffleIntArray(numbers, len(numbers));
    //printIntArray(numbers, len(numbers));
    putchar('\n');

    int sorted[len(numbers)];
    memset(sorted, -1, sizeof(sorted));

    int count;
    int size = len(numbers);
    for(int i = 0; i < size; i++){
        count = 0;
        for(int j = 0; j < size; j++){
            if(numbers[i] > numbers[j]) count++;
        }
        while(sorted[count] == numbers[i]) count++;
        sorted[count] = numbers[i];
    }

    //printIntArray(sorted, len(sorted));
}