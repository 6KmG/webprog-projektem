#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>

#define FPS 60

void render(GLFWwindow *window, ){
    glClear(GL_COLOR_BUFFER_BIT);
    // Render here
    
    if(frameCounter > 30){
        drawSquare(
            vertexBufferObject, 
            elementBufferObject, 
            createSquare(
                window, 
                squarepos[frameCounter - 3][0], 
                squarepos[frameCounter - 3][1], 
                SNAKE_SIZE, 
                SNAKE_COLOR
                ).data, 
            square.indices
            );
        drawSquare(
            vertexBufferObject, 
            elementBufferObject, 
            createSquare(
                window, 
                squarepos[frameCounter - 7][0], 
                squarepos[frameCounter - 7][1], 
                SNAKE_SIZE, 
                SNAKE_COLOR
                ).data, 
            square.indices
            );
    }
            
    drawSquare(vertexBufferObject, elementBufferObject, square.data, square.indices);
    drawCircle(vertexBufferObject, elementBufferObject, circle.data, circle.indices);

    glClearColor(BACKGROUND_COLOR);

    // Rendering is done
    glfwSwapBuffers(window);
    glfwPollEvents();
}