// Yoda notation is used occasionally

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <SDL.h>
#include "myfunctions.h"

// next to do:
// collision detection
// deltatime

// #define true 1
// #define false 0
// #define bool char

#define WIDTH 800
#define HEIGHT 450
#define SPEED 0.25
#define FPS 60
#define BACKGROUND_COLOR 101,154,210,255
#define PLAYER_COLOR 255,255,255,255
#define GRAVITY 0.375
#define JUMP_DURATION 1.5
#define JUMP_POWER 0.0075

bool keyD = false;
bool keyA = false;
bool keySpace = false;
bool falling = true;
bool jumping = false;

// Using double type as subpixels
double posX = 0;
double posY = 0;
double jumpForce = JUMP_DURATION;

int SDL_main(int argc, char *argv[])
{
    SDL_Init(SDL_INIT_EVERYTHING);

    SDL_Window *window = SDL_CreateWindow(
        "TestTitle",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        WIDTH,
        HEIGHT,
        0 // No flags set
    );
    
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0); // No flags set

    SDL_Rect player;
    player.h = 30;
    player.w = 30;
    player.x = 30; posX = player.x;
    player.y = 30; posY = player.y;

    // Loop
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
                    if(SDLK_d == event.key.keysym.sym) keyD = true;
                    if(SDLK_a == event.key.keysym.sym) keyA = true;
                    if(SDLK_SPACE == event.key.keysym.sym) keySpace = true;
                    break;
                case SDL_KEYUP:
                    if(SDLK_d == event.key.keysym.sym) keyD = false;
                    if(SDLK_a == event.key.keysym.sym) keyA = false;
                    if(SDLK_SPACE == event.key.keysym.sym) keySpace = false;
                    break;
            }
        }

        falling = true;

        // Collision detection
        if(player.y + 30 >= 300) falling = false;

        // Keys
        if(keyD) posX += SPEED;
        if(keyA) posX -= SPEED;
        if(keySpace && false == falling) jumping = true;

        if(falling) posY += GRAVITY; 

        if(true == jumping){
            posY -= jumpForce;
            jumpForce -= JUMP_POWER;
            if(0 >= jumpForce) {
                jumpForce = JUMP_DURATION;
                jumping = false;
            }
        }

        player.x = (int) posX;
        player.y = (int) posY;

        // ending the game when falling off
        if(player.y > HEIGHT) running = false;

        SDL_SetRenderDrawColor(renderer, BACKGROUND_COLOR);
        SDL_RenderClear(renderer); 

        // Everything is rendered here
        SDL_SetRenderDrawColor(renderer, PLAYER_COLOR);
        SDL_RenderFillRect(renderer, &player);

        drawRect(renderer, 100, 300, 400, 50, 255, 255, 255, 255);

        // End of rendering
        SDL_RenderPresent(renderer); 
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    return 0;
}