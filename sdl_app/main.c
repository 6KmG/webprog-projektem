#include "SDL.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "myfunctions.h"

#define true 1
#define false 0
#define bool char

#define WIDTH 800
#define HEIGHT 480
#define SPEED 300
#define BACKGROUNDCOLOR 101,154,210,255

int main(int argc, char *argv[]){
    int mouseX, mouseY;

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
        SDL_SetRenderDrawColor(renderer, BACKGROUNDCOLOR);
        SDL_RenderClear(renderer); 

        SDL_Rect myrect = drawRect(renderer, 200, 200, 100, 50, 255, 255, 255, 255);

        SDL_GetMouseState(&mouseX, &mouseY);

        if(SDL_PollEvent(&event)){
            switch(event.type){
                case SDL_QUIT:
                    running = false;
                    break;
                case SDL_MOUSEBUTTONDOWN:
                    if(event.button.button == SDL_BUTTON_LEFT){
                        if(mouseX > myrect.x && mouseY > myrect.y && mouseX < myrect.x + myrect.w && mouseY < myrect.y + myrect.h){
                            printf("%d - %d\n",mouseX,mouseY);
                        }
                    }
            }
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(64);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    return 0;
}