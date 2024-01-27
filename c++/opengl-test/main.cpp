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

#define WIDTH 1280
#define HEIGHT 720
#define FPS 60
#define SPEED 0.0375f
#define SNAKE_X -1.0f
#define SNAKE_Y 1.0f
#define SNAKE_SIZE 0.125f
#define SNAKE_COLOR 1.0f, 1.0f, 1.0f
#define COOLDOWN_DELAY 10
#define TITLE "Snake game | score: %d"
#define BACKGROUND_COLOR 0.6f,0.6f,1.0f,1.0f
#define FOOD_SIZE 0.09f
#define SNAKE_LENGTH 4

GLfloat generateRandomPosition(){
    srand(time(0));
    return (-1.0 + 2.0 * (float)rand() / RAND_MAX);
}

char movement[] = {0, 0, -1, 1}; // W, S, A, D
Square square;

int score = 0;
char title[64];

int cooldown = 0; // Yes, it is a global variable, I'm not proud of that.
void keyCallback(GLFWwindow* window, GLint key, GLint scancode, GLint action, GLint mods){
    // cooldown is a global variable
    // Check if the key is pressed
    if (action == GLFW_PRESS || action == GLFW_REPEAT) {
        // Handle different keys for movement
        switch (key) {
            case GLFW_KEY_W:
                if(movement[0] != -1 && cooldown > COOLDOWN_DELAY){
                    movement[0] = 1;
                    movement[1] = -1;
                    movement[2] = 0;
                    movement[3] = 0;
                    cooldown = 0;
                }
                break;
            case GLFW_KEY_S:
                if(movement[1] != -1 && cooldown > COOLDOWN_DELAY){
                    movement[0] = -1;
                    movement[1] = 1;
                    movement[2] = 0;
                    movement[3] = 0;
                    cooldown = 0;
                }
                break;
            case GLFW_KEY_A:
                if(movement[2] != -1 && cooldown > COOLDOWN_DELAY){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = 1;
                    movement[3] = -1;
                    cooldown = 0;
                }
                break;
            case GLFW_KEY_D:
                if(movement[3] != -1 && cooldown > COOLDOWN_DELAY){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = -1;
                    movement[3] = 1;
                    cooldown = 0;
                }
                break;
        // Add more cases for other keys if needed
        }
    }
}

int main(){
    if (!glfwInit()) {
        return -1;
    }

    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    GLFWwindow* window;
    window = glfwCreateWindow(WIDTH, HEIGHT, "Snake game | score: ", NULL, NULL);
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
    
    square = createSquare(window, SNAKE_X, SNAKE_Y, SNAKE_SIZE, SNAKE_COLOR);

    Circle food = createCircle(
        window, 
        generateRandomPosition(), 
        generateRandomPosition(), 
        FOOD_SIZE, 
        1.0f, 
        1.0f, 
        1.0f
    );

    glfwSetKeyCallback(window, keyCallback);

    GLuint vertexShader, fragmentShader, shaderProgram;
    setupShader(vertexShader, fragmentShader, shaderProgram);

    GLuint vertexBufferObject, vertexArrayObject, elementBufferObject;
    setupBuffer(vertexBufferObject, vertexArrayObject, elementBufferObject);
    
    GLint window_width;
    GLint window_height;
    glfwGetWindowSize(window, &window_width, &window_height);
    GLfloat widthHeightMultiplier = (GLfloat) window_height/window_width;
    GLfloat moveLeftSpeed = -SPEED * widthHeightMultiplier;
    GLfloat moveRightSpeed = SPEED * widthHeightMultiplier;

    GLfloat squarepos[100000][2];

    GLuint frameCounter = 0;
    GLboolean running = true;
    while (running) {
        squarepos[frameCounter][0] = square.data[0] / widthHeightMultiplier;
        squarepos[frameCounter][1] = square.data[1];

        if(glfwWindowShouldClose(window)){
            running = false;
        } 
        sprintf(title, TITLE, score);
        glfwSetWindowTitle(window, title);

        if(movement[0] == 1) {
            moveSquareVertical(square.data, SPEED);
        } 
        else if(movement[1] == 1) {
            moveSquareVertical(square.data, -SPEED);
        }
        else if(movement[2] == 1) {
            moveSquareHorizontal(square.data, moveLeftSpeed);
        }
        else if(movement[3] == 1) {
            moveSquareHorizontal(square.data, moveRightSpeed);
        }

        if(square.data[0] < -1.0f - SNAKE_SIZE){ // left wall
            running = false;
        }
        if(square.data[0] > 1.0f){   // right wall
            running = false;
        }
        if(square.data[1] < -1.0f - SNAKE_SIZE){ // bottom wall
            running = false;
        }
        if(square.data[1] > 1.0f + SNAKE_SIZE){ // top wall
            running = false;
        }


        if(
            square.data[12] > food.data[0] - FOOD_SIZE &&
            square.data[13] < food.data[1] + FOOD_SIZE &&
            square.data[0]  < food.data[0] &&
            square.data[1] > food.data[1] - FOOD_SIZE

        ){
            food = createCircle(
                window,
                generateRandomPosition(), 
                generateRandomPosition(), 
                FOOD_SIZE, 
                1.0f, 
                1.0f, 
                1.0f
            );
            score++;
        }

        glClear(GL_COLOR_BUFFER_BIT);
        // Render here
        
        // render tail
        if(frameCounter > 30){
            for(int i = 0; i < score + SNAKE_LENGTH; i++){
                drawSquare(
                    vertexBufferObject, 
                    elementBufferObject, 
                    createSquare(
                        window, 
                        squarepos[frameCounter - ((i + 1)*4) + 1][0], 
                        squarepos[frameCounter - ((i + 1)*4) + 1][1], 
                        SNAKE_SIZE, 
                        SNAKE_COLOR
                        ).data, 
                    square.indices
                );
                if(
                    square.data[12] > (squarepos[frameCounter - ((i + 1)*4) + 1][0] + SNAKE_SIZE / 2) * widthHeightMultiplier &&
                    square.data[13] < squarepos[frameCounter - ((i + 1)*4) + 1][1] - 0.03f &&
                    square.data[0] < (squarepos[frameCounter - ((i + 1)*4) + 1][0] + SNAKE_SIZE) * widthHeightMultiplier &&
                    square.data[1] > squarepos[frameCounter - ((i + 1)*4) + 1][1] - 0.06f
                ){
                    running = false;
                    printf("touch!");
                }
            }
        }
                
        drawSquare(vertexBufferObject, elementBufferObject, square.data, square.indices);
        drawCircle(vertexBufferObject, elementBufferObject, food.data, food.indices);

        glClearColor(BACKGROUND_COLOR);

        // Rendering is done
        glfwSwapBuffers(window);
        glfwPollEvents();

        frameCounter++;
        cooldown++;
        usleep(1000000/FPS);
    }

    glDeleteVertexArrays(1, &vertexArrayObject);
    glDeleteBuffers(1, &vertexBufferObject);
    glDeleteBuffers(1, &elementBufferObject);

    glfwTerminate();
    return 0;
}
