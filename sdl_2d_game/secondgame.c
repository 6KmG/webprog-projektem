#include "SDL2/SDL.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define WIDTH 800
#define HEIGHT 480
#define true 1
#define false 0
#define bool char
#define FPS 60

int main(int argc, char *argv[])
{
    SDL_Init(SDL_INIT_EVERYTHING);
    SDL_Window *window = SDL_CreateWindow(
        "TestTitle",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        WIDTH,
        HEIGHT,
        0
        );

    

    SDL_Event event;
    bool running = true;
    while(running)
    {

    if(SDL_PollEvent(&event))
    {
        switch(event.type)
        {
            // Close app on the exit button
            case SDL_QUIT:
                running = 0;
                break;
        }
    }

    SDL_Delay(1000/FPS);
    }
    return 0;
}