#include "SDL.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define true 1
#define false 0
#define bool char

#define WIDTH 800
#define HEIGHT 480
#define SPEED 300
#define BACKGROUNDCOLOR 101,154,210,255

int main(int argc, char *argv[]){
    SDL_Init(SDL_INIT_EVERYTHING);
    SDL_Window *window = SDL_CreateWindow(
        "Title",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        WIDTH,
        HEIGHT,
        0
    );

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);
    
    SDL_Event event;
    bool running = true;
    while(running)
    {
        if(SDL_PollEvent(&event)){
            switch(event.type){
                case SDL_QUIT:
                    running = false;
                    break;
            }
        }

        SDL_SetRenderDrawColor(renderer, BACKGROUNDCOLOR);
        SDL_RenderClear(renderer); 

        SDL_RenderPresent(renderer); 
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    return 0;
}