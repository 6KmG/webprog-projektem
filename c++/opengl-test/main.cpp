#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

#include "Square.cpp"
#include "Circle.cpp"
#include "Init.cpp"
#include "Logic.cpp"
#include "Snake.cpp"

#define WIDTH 1280
#define HEIGHT 720
#define FPS 60
#define SPEED 0.05f
#define SNAKE_X -1.0f
#define SNAKE_Y 1.0f
#define SNAKE_SIZE 0.125f
#define SNAKE_COLOR 1.0f, 1.0f, 1.0f
#define TITLE "Snake game | score: %d"
#define BACKGROUND_COLOR 0.6f,0.6f,1.0f,1.0f
#define FOOD_SIZE 0.09f
#define SNAKE_LENGTH 8
#define TAIL_RENDER_DELAY 60
#define TAIL_SEPARATION 3

int score = 0;
char title[64];
GLfloat squarePos[100000][2];
GLuint frameCounter = 0;

int main(){
    if (!glfwInit()) {
        return -1;
    }

    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    GLFWwindow* window = glfwCreateWindow(WIDTH, HEIGHT, "Snake game | score: ", NULL, NULL);

    if (!window) {
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    if (glewInit() != GLEW_OK) {
        return -1;
    }

    if (!GLEW_ARB_vertex_array_object) {
        return -1;
    }

    GLuint vertexShader, fragmentShader, shaderProgram;
    setupShader(vertexShader, fragmentShader, shaderProgram);

    GLuint vertexBufferObject, vertexArrayObject, elementBufferObject;
    setupBuffer(vertexBufferObject, vertexArrayObject, elementBufferObject);
    
    Snake snake = createSquare(window, SNAKE_X, SNAKE_Y, SNAKE_SIZE, SNAKE_COLOR);
    Circle food = createCircle(window, randomPos() * 1.75, randomPos(), FOOD_SIZE, 1.0f, 1.0f, 1.0f);
    GLfloat widthHeightMul = widthHeightMultiplier(window);

    glfwSetKeyCallback(window, keyCallback);

    GLboolean running = true;
    while(running){
        squarePos[frameCounter][0] = snake.data[0] / widthHeightMul;
        squarePos[frameCounter][1] = snake.data[1];

        glClear(GL_COLOR_BUFFER_BIT);
        // Render here

        drawSquare(vertexBufferObject, elementBufferObject, snake);
        drawCircle(vertexBufferObject, elementBufferObject, food);
                
        // render tail
        if(frameCounter > TAIL_RENDER_DELAY){
            int actualLength = score + SNAKE_LENGTH;
            for(int i = 0; i < actualLength; i++){
                int tailIndex = frameCounter - ((i + 1) * TAIL_SEPARATION) + 1;
                drawSquare(
                    vertexBufferObject, 
                    elementBufferObject, 
                    createSquare(
                        window, 
                        squarePos[tailIndex][0], 
                        squarePos[tailIndex][1], 
                        snake.size, 
                        SNAKE_COLOR
                    )
                );

                if(i > SNAKE_LENGTH && i < score){
                    if(collisionWithTail(window, &snake, frameCounter, squarePos, i)){
                        printf("touch!, %d, score: %d\n", i, score);
                        running = false;
                    }
                }
            }
        }

        glClearColor(BACKGROUND_COLOR);

        // Rendering is done
        glfwSwapBuffers(window);
        glfwPollEvents();

        if(glfwWindowShouldClose(window)){
            running = false;
        } 

        sprintf(title, TITLE, score);
        glfwSetWindowTitle(window, title);

        moveSnake(window, &snake, SPEED);
        
        if(snakeEats(window, &snake, &food) && eat_cooldown > COOLDOWN_LENGTH){
            food = createCircle(
                window, 
                randomPos()*1.5f, 
                randomPos()*0.75f, 
                food.radius, 
                1.0f, 1.0f, 1.0f
            );
            score++;
            eat_cooldown = 0;
        }

        if(collisionWithWindowBorder(snake)){
            running = false;
        }

        frameCounter++;
        eat_cooldown++;
        move_cooldown++;
        usleep(1000000/FPS);
    }

    glDeleteVertexArrays(1, &vertexArrayObject);
    glDeleteBuffers(1, &vertexBufferObject);
    glDeleteBuffers(1, &elementBufferObject);

    glfwTerminate();
    return 0;
}
