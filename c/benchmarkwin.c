//Compiled with gcc
#include <windows.h>
#include <math.h>

int main(){
    char mymsg[25];
    register long int count = 1;
    char is_prime;
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
    HANDLE handle = GetStdHandle(-11);
    wsprintf(mymsg, "The result: %d\0", count);
    WriteFile(handle, mymsg, 25, 0, 0);

    return 0;
}
