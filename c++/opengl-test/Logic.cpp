#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <stdlib.h>

#include "Init.cpp"
#include "Square.cpp"

// Returns a float number in between -1 and 1
GLfloat randomPos(){
    srand(time(0));
    return (-1.0 + 2.0 * (float)rand() / RAND_MAX);
}

bool collisionWithWindowBorder(Square square){
    if(square.data[0] < -1.0f - square.size){ // left wall
        return true;
    }
    else if(square.data[0] > 1.0f){   // right wall
        return true;    
    }
    else if(square.data[1] < -1.0f - square.size){ // bottom wall
        return true;    
    }
    else if(square.data[1] > 1.0f + square.size){ // top wall
        return true;    
    }
    return false;
}