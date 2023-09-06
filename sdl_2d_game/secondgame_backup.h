#pragma once

#include "SDL2/SDL.h"

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

#define WIDTH 1280
#define HEIGHT 720
#define FPS 240
#define SPEED 5
#define BACKGROUNDCOLOR 101,154,210,255
#define BODYCOLOR 150,150,150,150
#define HEADCOLOR 255,255,255,255
#define JUMPHEIGHT 22
#define NUMBEROFPLATFORMS 5
#define GRAVITYFORCE 5
#define JUMPLIMIT 1

unsigned short FrameCounter = 0;
char title[64];
int velocity = 0;
int JumpForce = JUMPHEIGHT;
int lerping = 0;
char JumpDelay = 0;
char jump = 0;
char OnFloor = 1;

void DrawRect(  
                SDL_Renderer* renderer, 
                SDL_Rect player, 
                int platleft, 
                int plattop, 
                int platright, 
                int platbottom, 
                char r, char g, char b, char a
                )
{
    SDL_Rect rect;
    rect.x = platleft;
    rect.y = plattop;
    rect.w = platright - platleft;
    rect.h = platbottom - plattop;

    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_RenderFillRect(renderer, &rect);
}

int main(int argc, char *argv[])    // I don't use line indentation for the "main" function 
{                                   // because some of the lines are already too long
struct platform
{
    short top;
    short left;
    short bottom;
    short right;
};

long long FrameRateOutputSpeed = time(0) + 1;

char keys[322];                     // 322 is the number of SDLK_DOWN events
memset(keys, 0, 322);               // Setting every value of this array to 0 since 
                                    // 0 will represent "off" and 1 will represent "on"
SDL_Init(SDL_INIT_EVERYTHING);

SDL_Window *window = SDL_CreateWindow
(
    "My game | ",
    SDL_WINDOWPOS_UNDEFINED,
    SDL_WINDOWPOS_UNDEFINED,
    WIDTH, HEIGHT,
    SDL_WINDOW_ALLOW_HIGHDPI
);

struct platform plat[NUMBEROFPLATFORMS];            // I made an array for the tiles for ease
memset(plat, 0, NUMBEROFPLATFORMS*2*4);             // Again I set the elements of this array to 0
                                                    // however not as important as at "keys"
SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

SDL_Rect player;
player.x = 400 * WIDTH / 800;
player.y = 0 * HEIGHT / 480;
player.w = 20 * WIDTH / 800;
player.h = 40 * HEIGHT / 480;

plat[0].top = 460; plat[0].bottom = 480; plat[0].left = 100; plat[0].right = 600;   // Ground
plat[1].top = 300; plat[1].bottom = 380; plat[1].left = 400; plat[1].right = 500;
plat[2].top = 430; plat[2].bottom = 460; plat[2].left = 300; plat[2].right = 330;
plat[3].top = 380; plat[3].bottom = 400; plat[3].left = 250; plat[3].right = 300;
plat[4].top = 410; plat[4].bottom = 430; plat[4].left = 200; plat[4].right = 250;

for(unsigned char i = 0; i < NUMBEROFPLATFORMS; i++)
{
    plat[i].top = plat[i].top * HEIGHT / 480;
    plat[i].bottom = plat[i].bottom * HEIGHT / 480;
    plat[i].left = plat[i].left * WIDTH / 800;
    plat[i].right = plat[i].right * WIDTH / 800;
}

SDL_Event Event;
char running = 1;
while(running)
{
    // The window title with the simpliest fps counter
    FrameCounter++;
    if (time(0)>FrameRateOutputSpeed){
        sprintf(title, "My game | FPS: %d",FrameCounter);
        SDL_SetWindowTitle(window, title);
        FrameRateOutputSpeed++;
        FrameCounter = 0;
    }

    // Render the background
    SDL_SetRenderDrawColor(renderer, BACKGROUND_COLOR);
    SDL_RenderClear(renderer);

    // Drawing the player
    SDL_SetRenderDrawColor(renderer, HEADCOLOR);
    SDL_RenderFillRect(renderer, &player);

    if(SDL_PollEvent(&Event))
    {
        switch(Event.type)
        {
            // Close app on the exit button
            case SDL_QUIT:
                running = 0;
                break;
            case SDL_KEYDOWN:
                keys[Event.key.keysym.sym] = 1;
                break;
            case SDL_KEYUP:
                keys[Event.key.keysym.sym] = 0;
                break;
            break;
        }
    }
    if(keys[SDLK_d]) velocity = SPEED / FPS;

    if(keys[SDLK_a]) velocity = -SPEED / FPS;

    if(keys[SDLK_SPACE]) jump = 1, keys[SDLK_SPACE] = 0;

    if(jump && OnFloor){
        keys[SDLK_SPACE] = 0;
        if(JumpForce > 0){
            JumpDelay++;
            player.y -= JumpForce;
            JumpForce--;
            JumpDelay = 0;
        }
        else{
            JumpForce = JUMPHEIGHT;
            jump = 0;
            OnFloor = 0;
        }
    }
    player.x += velocity;

    if (velocity > 0){
        lerping += 1;
        if(lerping >= 40){
            velocity--;
            lerping = 0;
        }
    }
    else if (velocity < 0){
        lerping += 1;
        if(lerping >= 40){
            velocity++;
            lerping = 0;
        }
    }
    //velocity = 0;

    for(unsigned char i = 0; i < NUMBEROFPLATFORMS; i++)    // It renders the tiles and
    {                                                       // checks for collisions with this loop
        DrawRect(
            renderer, 
            player, 
            plat[i].left, 
            plat[i].top, 
            plat[i].right, 
            plat[i].bottom, 
            BODYCOLOR
        );
        
        // onfloor
        if  (
                player.y + player.h + 8 > plat[i].top && 
                player.y + player.h - 8 < plat[i].top && 
                player.x < plat[i].right && 
                player.x + player.w > plat[i].left)
                {
                    player.y = plat[i].top - player.h - 8;
                    OnFloor = 1;
                    JumpForce = JUMPHEIGHT;
                }
        // under
        else if(
                player.y < plat[i].bottom && 
                player.x + player.w > plat[i].left && 
                player.x < plat[i].right && 
                player.y > plat[i].top)
                {
                    JumpForce = 0;
                }
        // onright
        if  (
                player.x < plat[i].right + 8 && 
                player.y < plat[i].bottom - 16 && 
                player.y + player.h > plat[i].top && 
                player.x + player.w > plat[i].left
            )
                {
                    player.x = plat[i].right + 8;
                }
        // onleft
        if  (
                player.x < plat[i].right && 
                player.y < plat[i].bottom - 16 && 
                player.y + player.h > plat[i].top && 
                player.x + player.w > plat[i].left - 8
            )
                {
                    player.x = plat[i].left - player.w - 8;
                }
    }

    player.y += GRAVITYFORCE;

    SDL_RenderPresent(renderer);                // This is what actually renders to the window
    SDL_Delay(1000 / FPS);                      // Limits the fps to a given value
}

SDL_DestroyRenderer(renderer);
SDL_DestroyWindow(window);
SDL_Quit();

return 0;
}