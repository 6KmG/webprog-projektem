#include <iostream>
#include <thread>
#include <math.h>
#include <chrono>
#include <vector>
#include <exception>
#include <cstring>
#include <windows.h>

#define BLOCK_SIZE 1000
#define THREADS 1000

void stressCPU(){
    while(true){
        Sleep(0.00000001);
    }
}

int main(){
    int sum = 0;
    int arrayPrime[THREADS];
    memset(arrayPrime, 0, sizeof(int) * THREADS);
    auto start = std::chrono::high_resolution_clock::now();

    try{
        std::vector<std::thread> threads;

        for(int i = 0; i < THREADS; i++){
            threads.push_back(std::thread(stressCPU));
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