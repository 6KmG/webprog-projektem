//Compiled with gcc

#include <math.h>
#include <stdbool.h>
int main(){
    register long int count = 1;
    
    bool is_prime;
    register long int square;

    for (register long int i = 3; i<100000000;i+=2){
        is_prime = 1;
        square = sqrt(i);
        for (register long int j = 3; j<=square; j+=2){
            if (i%j==0){
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1){
            count++;
        }
    }
    return count;
}
