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
#define HEIGHT 450
#define SPEED 1
#define FPS 500
#define BACKGROUNDCOLOR 101,154,210,255
#define PLAYERCOLOR 255,255,255,255
#define GRAVITY 0

bool keyD = false;
bool keyA = false;
bool keySpace = false;

double previousTime = 0;
double deltaTime = 0;
double velocity;

int SDL_main(int argc, char *argv[])
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
    
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    SDL_Rect player;
    player.h = 30;
    player.w = 30;
    player.x = 30; velocity = player.x;
    player.y = 30;

    SDL_Event event;
    bool running = true;
    while(running)
    {
        if(SDL_PollEvent(&event)){
            switch(event.type){
                case SDL_QUIT:
                    running = false;
                    break;
                case SDL_KEYDOWN:
                    if(event.key.keysym.sym == SDLK_d) keyD = true;
                    if(event.key.keysym.sym == SDLK_a) keyA = true;
                    if(event.key.keysym.sym == SDLK_SPACE) keySpace = true;
                    break;
                case SDL_KEYUP:
                    if(event.key.keysym.sym == SDLK_d) keyD = false;
                    if(event.key.keysym.sym == SDLK_a) keyA = false;
                    if(event.key.keysym.sym == SDLK_SPACE) keySpace = false;
                    break;
            }
        }

        SDL_SetRenderDrawColor(renderer, BACKGROUNDCOLOR);
        SDL_RenderClear(renderer); 
        SDL_SetRenderDrawColor(renderer, PLAYERCOLOR);
        SDL_RenderFillRect(renderer, &player);
        SDL_RenderPresent(renderer); 

        if(keyD) velocity += SPEED;
        if(keyA) velocity -= SPEED;

        player.x = (int) velocity;
        player.y += round(GRAVITY * deltaTime);

        previousTime = nanoTime();

        if(FPS) SDL_Delay(1000 / FPS);

        deltaTime = nanoTime() - previousTime;
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    return 0;
}