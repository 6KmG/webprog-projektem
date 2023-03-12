#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "SDL2/SDL.h"
#include "myfunctions.h"

// next to do:
// gravity
// collision detection
// jumping

#define true 1
#define false 0
#define bool char

#define WIDTH 800
#define HEIGHT 480
#define SPEED 240
#define FPS 240
#define BACKGROUNDCOLOR 101,154,210,255
#define PLAYERCOLOR 255,255,255,255
#define GRAVITY 0

int main(int argc, char *argv[])
{
    float velocity = 0;
    bool pressD = false;
    bool pressA = false;
    bool pressSpace = false;

    double previousTime;

    SDL_Init(SDL_INIT_EVERYTHING);

    SDL_Window *window = SDL_CreateWindow(
        "TestTitle",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        WIDTH,
        HEIGHT,
        0
    );
    
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    SDL_Rect player;
    player.h = 30;
    player.w = 30;
    player.x = 30;
    player.y = 30;

    SDL_Event event;
    bool running = true;
    while(running)
    {
        previousTime = nanoTime();
        SDL_SetRenderDrawColor(renderer, BACKGROUNDCOLOR);
        SDL_RenderClear(renderer); 

        if(SDL_PollEvent(&event)){
            switch(event.type){
                case SDL_QUIT:
                    running = false;
                    break;
                case SDL_KEYDOWN:
                    if(event.key.keysym.sym == SDLK_d) pressD = true;
                    if(event.key.keysym.sym == SDLK_a) pressA = true;
                    if(event.key.keysym.sym == SDLK_SPACE) pressSpace = true;
                    break;
                case SDL_KEYUP:
                    if(event.key.keysym.sym == SDLK_d) pressD = false;
                    if(event.key.keysym.sym == SDLK_a) pressA = false;
                    if(event.key.keysym.sym == SDLK_SPACE) pressSpace = false;
                    break;
            }
        }

        SDL_SetRenderDrawColor(renderer, PLAYERCOLOR);
        SDL_RenderFillRect(renderer, &player);

        SDL_RenderPresent(renderer); 
        SDL_Delay(1000 / FPS);

        if(pressD) player.x += (nanoTime() - previousTime) * SPEED;
        if(pressA) player.x -= (nanoTime() - previousTime) * SPEED;

        player.y += GRAVITY;
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
}