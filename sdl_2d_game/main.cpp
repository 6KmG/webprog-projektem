// Yoda notation is used occasionally

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <SDL.h>
#include "myfunctions.h"

// Things to do:
// collision detection
// deltatime
// lerping

// #define true 1
// #define false 0
// #define bool char

void moveRight(double *vectorX, double value){
    *vectorX += value;
}
void moveLeft(double *vectorX, double value){
    *vectorX -= value;
}
void jump(bool* switcher, double* vectorY, double* jumpForce, const double jumpHeight, const double jumpDuration){
    if(false == *switcher) return;
    *vectorY -= *jumpForce;
    *jumpForce -= jumpHeight;
    if(0 >= *jumpForce) {
        *switcher = false;
        *jumpForce = jumpDuration;
    }
}

#define WIDTH 800
#define HEIGHT 450
#define SPEED 0.25
#define FPS 60
#define BACKGROUND_COLOR 101,154,210,255
#define PLAYER_COLOR 255,255,255,255
#define GRAVITY 0.5
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
double jumpForce;

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
        if(keyD) moveRight(&posX, SPEED);
        if(keyA) moveLeft(&posX, SPEED);
        if(keySpace && false == falling) jumping = true;

        if(falling) posY += GRAVITY; 

        jump(&jumping, &posY, &jumpForce, JUMP_POWER, JUMP_DURATION);

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