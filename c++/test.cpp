//Compiled with gcc
#include <math.h>
int main(){
    int count = 1;
    int i;
    int j;
    char is_prime;
    int square;

    for (i=3;i<50000000;i+=2){
        is_prime = 1;
        square = sqrt(i);
        for (j = 3; j<=square; j+=2){
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
