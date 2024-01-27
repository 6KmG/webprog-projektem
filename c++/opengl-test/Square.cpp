#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>

typedef struct Square{
    GLfloat data[24];
    GLuint indices[6];
} Square;

Square createSquare(GLFWwindow* window, GLfloat x, GLfloat y, GLfloat size, 
                    GLfloat r, GLfloat g, GLfloat b
                    ){
    int window_width;
    int window_height;
    glfwGetWindowSize(window, &window_width, &window_height);
    GLfloat widthHeightMul = (GLfloat)window_height / window_width;

    Square squareVerticesAndColor;

    squareVerticesAndColor.data[0] = widthHeightMul * x;
    squareVerticesAndColor.data[1] = y;
    squareVerticesAndColor.data[2] = r; // color
    squareVerticesAndColor.data[3] = g; 
    squareVerticesAndColor.data[4] = b;
    squareVerticesAndColor.data[5] = 0.0f;
    squareVerticesAndColor.data[6] = widthHeightMul * x;
    squareVerticesAndColor.data[7] = y - size;
    squareVerticesAndColor.data[8] = r; // color
    squareVerticesAndColor.data[9] = g; 
    squareVerticesAndColor.data[10] = b;
    squareVerticesAndColor.data[11] = 0.0f;
    squareVerticesAndColor.data[12] = (x + size) * widthHeightMul;
    squareVerticesAndColor.data[13] = y - size;
    squareVerticesAndColor.data[14] = r; // color
    squareVerticesAndColor.data[15] = g; 
    squareVerticesAndColor.data[16] = b;
    squareVerticesAndColor.data[17] = 0.0f;
    squareVerticesAndColor.data[18] = (x + size) * widthHeightMul;
    squareVerticesAndColor.data[19] = y;
    squareVerticesAndColor.data[20] = r; // color
    squareVerticesAndColor.data[21] = g; 
    squareVerticesAndColor.data[22] = b;
    squareVerticesAndColor.data[23] = 0.0f;

    squareVerticesAndColor.indices[0] = 0;
    squareVerticesAndColor.indices[1] = 1;
    squareVerticesAndColor.indices[2] = 2;
    squareVerticesAndColor.indices[3] = 0;
    squareVerticesAndColor.indices[4] = 2;
    squareVerticesAndColor.indices[5] = 3;

    return squareVerticesAndColor;
}

void moveSquareHorizontal(GLfloat squareData[], GLfloat value){
    squareData[0] += value;
    squareData[6] += value;
    squareData[12] += value;
    squareData[18] += value;
}

void moveSquareVertical(GLfloat squareData[], GLfloat value){
    squareData[1] += value;
    squareData[7] += value;
    squareData[13] += value;
    squareData[19] += value;
}

void drawSquare(GLuint vertexBufferObject, GLuint elementBufferObject, 
                GLfloat* square, GLuint* indices
                ){
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat) * 24, square, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementBufferObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLuint) * 6, indices, GL_STATIC_DRAW);

    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
}