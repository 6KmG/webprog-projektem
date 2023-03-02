#include <stdio.h>
#include <pthread.h>
#include <math.h>
//gcc $fileName -o $fileNameWithoutExt && 
int count1 = 1;

void* primes1(){
    int i1;
    int j1;
    char is_prime;
    int square;

    for (i1=3;i1<100000000;i1+=2){
        is_prime = 1;
        square = sqrt(i1);
        for (j1 = 3; j1<=square; j1+=2){
            if (i1%j1==0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count1++;
        }
    }
}

int main(){

    pthread_t thread1;

    pthread_create(&thread1, NULL, primes1, NULL);

    pthread_join(thread1, NULL);

    printf("%d", count1);

    return 0;
}
