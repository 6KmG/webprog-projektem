#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "myfunctions.h"

int numbers[15];

void merge(int bottom, int top){
    int sorted[top - bottom];
    int index = 0;
    int i = bottom;
    const int limiti = top / 2;
    int j = limiti;
    const int limitj = top;
    
    while(true){
        if(numbers[j] < numbers[i]){
            sorted[index] = numbers[j];
            j++;
            index++;
        }
        else{
            sorted[index] = numbers[i];
            i++;
            index++;
        }
        if(i >= limiti || j >= limitj) break;
    }

    while(j < limitj){
        sorted[index] = numbers[j];
        j++;
        index++;
    }

    while(i < limiti){
        sorted[index] = numbers[i];
        i++;
        index++;
    }

    j = bottom;
    for(int i = 0; i < len(sorted); i++){
        numbers[j] = sorted[i];
        j++;
    }
}

void mergeSort(int bottom, int top){
    if(bottom < top){
        mergeSort(bottom, top / 2);
        mergeSort(top / 2 + 1, top);
    }

    merge(bottom, top / 2);
    merge(top / 2 + 1, top);
}

int main(int argc, char *argv[]){
    shuffleIntArray(numbers, len(numbers));
    printIntArray(numbers, len(numbers));
    putchar('\n');

    mergeSort(0, len(numbers) - 1);

    printIntArray(numbers, len(numbers));
}

