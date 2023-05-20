#pragma once
#include "SDL2/SDL.h"

void drawCircle(
    SDL_Renderer *renderer, 
    short x, short y, 
    short radius, 
    char r, char g, char b, char a
    )
{
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    for (short w = 0; w < radius * 2; w++)
    {
        for (short h = 0; h < radius * 2; h++)
        {
            short dx = radius - w;
            short dy = radius - h;
            if ((dx*dx + dy*dy) <= (radius * radius))
            {
                SDL_RenderDrawPoint(renderer, x + dx, y + dy);
            }
        }
    }
}

SDL_Rect drawRect(
    SDL_Renderer* renderer, 
    short x, short y, 
    short w, short h, 
    char r, char g, char b, char a
    )
{
    SDL_Rect rect;
    rect.x = x;
    rect.y = y;
    rect.w = w;
    rect.h = h;
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
    SDL_RenderFillRect(renderer, &rect);

    return rect;
}