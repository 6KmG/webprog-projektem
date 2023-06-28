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

int main(int argc, char *argv[])
{
    int numbers[] = {8,9,17,1};
    const int size = len(numbers);
    int done[size];

    void merge(int bottom, int top){
        int bottomi = bottom;
        int topi = top / 2;
        for(int i = bottom; i < top; i++){
            if(bottomi < top/2 && numbers[bottomi] < numbers[topi]){
                done[i] = numbers[bottomi];
                bottomi++;
            }
            else if(topi < top){
                done[i] = numbers[topi];
                topi++;
            }
            else if(topi >= top && bottomi <= top/2){
                done[i] = numbers[bottomi];
                bottomi++;            
            }
        }
    }

    bool mergeSort(int bottom, int top){
        if(bottom == top) return true;
        mergeSort(bottom, top/2);
        mergeSort(top/2+1, top);

        merge(bottom, top / 2);
    }

    //shuffleIntArray(numbers, size);
    printIntArray(numbers, size);

    merge(2, len(numbers));

    printIntArray(done, size);
}