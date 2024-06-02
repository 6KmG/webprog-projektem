#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "Init.cpp"

typedef struct Square{
    GLfloat size;
    GLfloat data[24];
    GLuint indices[6];
} Square;

Square createSquare(
    GLFWwindow* window, GLfloat x, GLfloat y, GLfloat size, 
    GLfloat r, GLfloat g, GLfloat b
    ){
    GLfloat widthHeightMul = widthHeightMultiplier(window);

    Square squareVerticesAndColor;

    squareVerticesAndColor.size = size;

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

void moveSquareHorizontal(Square *square, GLfloat value){
    square->data[0] += value;
    square->data[6] += value;
    square->data[12] += value;
    square->data[18] += value;
}

void moveSquareVertical(Square *square, GLfloat value){
    square->data[1] += value;
    square->data[7] += value;
    square->data[13] += value;
    square->data[19] += value;
}

GLfloat getSquareTopLeftX(Square square){
    return square.data[0];
}
GLfloat getSquareTopLeftY(Square square){
    return square.data[1];
}
GLfloat getSquareBottomLeftX(Square square){
    return square.data[6];
}
GLfloat getSquareBottomLeftY(Square square){
    return square.data[7];
}
GLfloat getSquareBottomRightX(Square square){
    return square.data[12];
}
GLfloat getSquareBottomRightY(Square square){
    return square.data[13];
}
GLfloat getSquareTopRightX(Square square){
    return square.data[18];
}
GLfloat getSquareTopRightY(Square square){
    return square.data[19];
}

void drawSquare(
    GLuint vertexBufferObject, GLuint elementBufferObject, 
    Square square
    ){
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat) * 24, square.data, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementBufferObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLuint) * 6, square.indices, GL_STATIC_DRAW);

    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
}