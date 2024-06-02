#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <stdlib.h>

#include "Init.cpp"
#include "Square.cpp"
#include "Circle.cpp"

#define COOLDOWN_LENGTH 5

typedef Square Snake;

void moveSnakeHorizontal(Snake *snake, GLfloat speed){
    moveSquareHorizontal(snake, speed);
}
void moveSnakeVertical(Snake *snake, GLfloat speed){
    moveSquareVertical(snake, speed);
}

int eat_cooldown = 0;
int move_cooldown = 0; // Yes, it is a global variable, I'm not proud of that.
char movement[] = {0, 0, -1, 1}; // W, S, A, D

void moveSnake(GLFWwindow* window, Snake *snake, GLfloat speed){
    if(movement[0] == 1) {
        moveSnakeVertical(snake, speed);
    } 
    else if(movement[1] == 1) {
        moveSnakeVertical(snake, -speed);
    }
    else if(movement[2] == 1) {
        moveSnakeHorizontal(snake, -speed * widthHeightMultiplier(window));
    }
    else if(movement[3] == 1) {
        moveSnakeHorizontal(snake, speed * widthHeightMultiplier(window));
    }
}

void keyCallback(
    GLFWwindow* window, GLint key, GLint scancode, 
    GLint action, GLint mods
    ){
    // cooldown is a global variable
    // Check if the key is pressed
    if (action == GLFW_PRESS || action == GLFW_REPEAT) {
        // Handle different keys for movement
        switch (key) {
            case GLFW_KEY_W:
                if(movement[0] != -1 && move_cooldown > COOLDOWN_LENGTH){
                    movement[0] = 1;
                    movement[1] = -1;
                    movement[2] = 0;
                    movement[3] = 0;
                    move_cooldown = 0;
                }
                break;
            case GLFW_KEY_S:
                if(movement[1] != -1 && move_cooldown > COOLDOWN_LENGTH){
                    movement[0] = -1;
                    movement[1] = 1;
                    movement[2] = 0;
                    movement[3] = 0;
                    move_cooldown = 0;
                }
                break;
            case GLFW_KEY_A:
                if(movement[2] != -1 && move_cooldown > COOLDOWN_LENGTH){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = 1;
                    movement[3] = -1;
                    move_cooldown = 0;
                }
                break;
            case GLFW_KEY_D:
                if(movement[3] != -1 && move_cooldown > COOLDOWN_LENGTH){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = -1;
                    movement[3] = 1;
                    move_cooldown = 0;
                }
                break;
        // Add more cases for other keys if needed
        }
    }
}

GLboolean snakeEats(GLFWwindow *window, Snake *snake, Circle *food){
    if(snake->data[12] > food->data[0] - food->radius){
        if(snake->data[13] < food->data[1] + food->radius){
            if(snake->data[0] < food->data[0]){
                if(snake->data[1] > food->data[1] - food->radius){
                    return true;
                }
            }
        }
    }
    return false;
}

GLboolean collisionWithTail(GLFWwindow *window, Snake *snake, GLuint &frameCounter, GLfloat squarepos[][2], int &i){
    GLfloat widthHeightMul = widthHeightMultiplier(window);
    if((getSquareTopLeftX(*snake) / widthHeightMul) > (squarepos[frameCounter - ((i + 1)*4) + 1][0])){
        if((getSquareTopLeftY(*snake) / widthHeightMul) < (squarepos[frameCounter - ((i + 1)*4) + 1][1]) + snake->size){
            if((getSquareTopLeftX(*snake) / widthHeightMul) < (squarepos[frameCounter - ((i + 1)*4) + 1][0]) + snake->size){
                return (getSquareTopLeftY(*snake) / widthHeightMul) > (squarepos[frameCounter - ((i + 1)*4) + 1][1]);
            }
        }
    }    
    return false;
}