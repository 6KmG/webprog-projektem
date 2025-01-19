//Compiled with gcc

#include <math.h>
#include <stdio.h>

int main(){
    int count = 1; 
    int is_prime;
    int square; 

    for ( int i = 3; i < 100000000; i += 2){
        is_prime = 1;
        square = sqrt(i);
        for ( int j = 3; j <= square; j += 2){
            if (i % j == 0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count++;
        }
    }
    printf("The result: %ld\n", count);
    return 0;
}
