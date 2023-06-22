#include "myfunctions.h"
#include <math.h>
#include <stdio.h>

void bubbleSort(int array[], int length){
    int temp;
    for(int limiti = length - 1; limiti > 1; limiti--){
        for(int i = 0; i < limiti; i++){
            if(array[i] > array[i+1]){
                temp = array[i+1];
                array[i+1] = array[i];
                array[i] = temp;
            }
        }
    }
}

    int numbers[4] = {5,9,1,3};
    const int size = len(numbers);
    int done[4];

    void merge(int bottom, int top){
        for(int i = 0; i < size; i++){
            if(bottom < size/2 && numbers[bottom] < numbers[top]){
                done[i] = numbers[bottom];
                bottom++;
            }
            else if(top < size){
                done[i] = numbers[top];
                top++;
            }
            else if(top >= size && bottom < size/2){
                done[i] = numbers[bottom];
                bottom++;            
            }
        }
    }
    
    bool mergeSort(int bottom, int top){
        if(bottom == top) return true;
        mergeSort(bottom, top/2);
        mergeSort(top/2+1, top);

        merge(bottom+1, top);
    }
int main(int argc, char *argv[]){


    //shuffleIntArray(numbers, size);
    printIntArray(numbers, size);

    merge(0, len(numbers));

    printIntArray(done, size);
}


