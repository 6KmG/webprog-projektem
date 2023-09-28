#include <windows.h>
#include <stdio.h>
#include <math.h>

#define RANGE 4

int count1 = 1;
int count2 = 0;
int count3 = 0;
int count4 = 0;

DWORD WINAPI primes1(LPVOID lpParam) {
    register int i1;
    register int j1;
    char is_prime;
    register int square;

    const int bottom = 2 + 1;
    const int top = 38 * pow(10, RANGE);

    for (i1 = bottom; i1 < top; i1 += 2){
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
    return 0;
}

DWORD WINAPI primes2(LPVOID lpParam) {
    register int i2;
    register int j2;
    char is_prime;
    register int square;

    const int bottom = 38 * pow(10, RANGE) + 1;
    const int top = 62 * pow(10, RANGE);

    for (i2=bottom;i2<top;i2+=2){
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
    return 0;
}

DWORD WINAPI primes3(LPVOID lpParam) {
    register int i3;
    register int j3;
    char is_prime;
    register int square;

    const int bottom = 62 * pow(10, RANGE) + 1;
    const int top = 82 * pow(10, RANGE);

    for (i3=bottom;i3<top;i3+=2){
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
    return 0;
}

DWORD WINAPI primes4(LPVOID lpParam) {
    register int i4;
    register int j4;
    char is_prime;
    register int square;

    const int bottom = 82 * pow(10, RANGE) + 1;
    const int top = 100 * pow(10, RANGE);

    for (i4=bottom;i4<top;i4+=2){
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
    return 0;
}

int main() {
    DWORD primes1ID, primes2ID, primes3ID, primes4ID;
    HANDLE hprimes1, hprimes2, hprimes3, hprimes4;

    hprimes1 = CreateThread(0, 0, primes1, 0, 0, &primes1ID);    
    hprimes2 = CreateThread(0, 0, primes2, 0, 0, &primes2ID);    
    hprimes3 = CreateThread(0, 0, primes3, 0, 0, &primes3ID);    
    hprimes4 = CreateThread(0, 0, primes4, 0, 0, &primes4ID);    


    // Wait until all threads have terminated.

    WaitForSingleObject(hprimes1, INFINITE);
    WaitForSingleObject(hprimes2, INFINITE);
    WaitForSingleObject(hprimes3, INFINITE);
    WaitForSingleObject(hprimes4, INFINITE);

    // Close the thread handle.

    CloseHandle(hprimes1);
    CloseHandle(hprimes2);
    CloseHandle(hprimes3);
    CloseHandle(hprimes4);

    printf("%d\n", count1+count2+count3+count4);
}
