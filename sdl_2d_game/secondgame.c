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
#define SPEED 300
#define FPS 120
#define BACKGROUNDCOLOR 101,154,210,255
#define PLAYERCOLOR 255,255,255,255
#define GRAVITY 0

int main(int argc, char *argv[])
{
    bool keyD = false;
    bool keyA = false;
    bool keySpace = false;

    double previousTime = 0;
    double deltaTime = 0;
    int velocity;

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

        if(keyD) player.x += velocity;
        if(keyA) player.x -= velocity;

        player.y += round(GRAVITY * deltaTime);

        previousTime = nanoTime();

        if(FPS) SDL_Delay(1000 / FPS);

        deltaTime = nanoTime() - previousTime;

        velocity = round(deltaTime * SPEED)+1;

        if(velocity > SPEED) velocity = velocity / FPS;
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
}