#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <Windows.h>
#include "myfunctions.h"

int main(int argc, char *argv[]){
    int numbers[] = {3,5,7,9, 1,2,4,7};

    int sorted[len(numbers)];

    int index = 0;

    printIntArray(numbers, len(numbers));
    int top = len(numbers);
    int bottom = 0;
    
    int i = 0;
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

    printIntArray(sorted, len(sorted));
}