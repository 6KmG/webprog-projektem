#include <stdio.h>
#include <pthread.h>
#include <math.h>
//gcc $fileName -o $fileNameWithoutExt && 
int count1 = 1;
int count2 = 0;
int count3 = 0;
int count4 = 0;

void* primes1(){
    register int i1;
    register int j1;
    char is_prime;
    register int square;

    for (i1=3;i1<38000000;i1+=2){
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
void* primes2(){
    register int i2;
    register int j2;
    char is_prime;
    register int square;

    for (i2=38000001;i2<62000000;i2+=2){
        is_prime = 1;
        square = sqrt(i2);
        for (j2 = 3; j2<=square; j2+=2){
            if (i2%j2==0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count2++;
        }
    }
}
void* primes3(){
    register int i3;
    register int j3;
    char is_prime;
    register int square;

    for (i3=62000001;i3<82000000;i3+=2){
        is_prime = 1;
        square = sqrt(i3);
        for (j3 = 3; j3<=square; j3+=2){
            if (i3%j3==0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count3++;
        }
    }
}
void* primes4(){
    register int i4;
    register int j4;
    char is_prime;
    register int square;

    for (i4=82000001;i4<100000000;i4+=2){
        is_prime = 1;
        square = sqrt(i4);
        for (j4 = 3; j4<=square; j4+=2){
            if (i4%j4==0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count4++;
        }
    }
}

int main(){

    pthread_t thread1, thread2, thread3, thread4;

    pthread_create(&thread1, NULL, primes1, NULL);
    pthread_create(&thread2, NULL, primes2, NULL);
    pthread_create(&thread3, NULL, primes3, NULL);
    pthread_create(&thread4, NULL, primes4, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    pthread_join(thread3, NULL);
    pthread_join(thread4, NULL);

    printf("%d", count1+count2+count3+count4);

    return 0;
}
