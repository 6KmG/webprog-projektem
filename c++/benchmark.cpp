#include <iostream>
#include <thread>
#include <math.h>
#include <chrono>
#include <vector>
#include <exception>
#include <cstring>

#define BLOCK_SIZE 10000
#define THREADS 100000

void primes(int bottom, int top, int *counter){
    int i1;
    int j1;
    bool is_prime;
    int square;

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
            *counter += 1;
        }
    }
    return;
}

int main(){
    int sum = 0;
    int arrayPrime[THREADS];
    memset(arrayPrime, 0, sizeof(int) * THREADS);
    auto start = std::chrono::high_resolution_clock::now();

    try{
        std::vector<std::thread> threads;

        for(int i = 0; i < THREADS; i++){
            threads.push_back(std::thread(primes, 1 + i * BLOCK_SIZE, i * BLOCK_SIZE + BLOCK_SIZE, &arrayPrime[i]));
        }
        for(int i = 0; i < threads.size(); i++){
            threads[i].join();
        }
    }catch(std::system_error error){
        printf("%s\n", error.what());
    }

    for(int i = 0; i < THREADS; i++){
        sum += arrayPrime[i];
    }
    printf("%d\n", sum);

    auto end = std::chrono::high_resolution_clock::now();    
    std::chrono::duration<double, std::milli> elapsed = (end - start) / 1000;
    printf("Program finished in %.4f seconds.\n", elapsed.count());
}