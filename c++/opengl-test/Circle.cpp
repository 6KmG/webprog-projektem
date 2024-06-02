#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <math.h>

#include "Init.cpp"

typedef struct Circle{
    GLfloat radius;
    GLfloat data[(36 + 1) * 6];
    GLuint indices[36 * 3];
} Circle;

Circle createCircle(
    GLFWwindow* window, GLfloat x, GLfloat y, GLfloat radius, 
    GLfloat r, GLfloat g, GLfloat b
    ){
    GLuint numSegments = 36;
    GLfloat widthHeightMul = widthHeightMultiplier(window);

    // (x, y, r, g, b) for each vertex
    Circle circleVerticesAndColor; 

    circleVerticesAndColor.radius = radius;

    for (int i = 0; i <= numSegments; ++i) {
        GLfloat theta = (2.0f * M_PI * (GLfloat)(i)) / (GLfloat)(numSegments);
        circleVerticesAndColor.data[i * 6] = (x + radius * cosf(theta)) * (widthHeightMul);
        circleVerticesAndColor.data[i * 6 + 1] = y + radius * sinf(theta);
        circleVerticesAndColor.data[i * 6 + 2] = r;
        circleVerticesAndColor.data[i * 6 + 3] = g;
        circleVerticesAndColor.data[i * 6 + 4] = b;
        circleVerticesAndColor.data[i * 6 + 5] = 0.0f;
    }

    for (int i = 0; i < numSegments; ++i) {
        circleVerticesAndColor.indices[i * 3] = i;
        circleVerticesAndColor.indices[i * 3 + 1] = (i + 1) % (numSegments + 1);
        circleVerticesAndColor.indices[i * 3 + 2] = numSegments; // Center vertex
    }

    return circleVerticesAndColor;
}

void moveCircleHorizontal(Circle *circle, GLfloat value){
    for(int i = 0; i < 37; i++){
        circle->data[i*6] += value;
    }
}

void moveCircleVertical(Circle *circle, GLfloat value){
    for(int i = 0; i < 37; i++){
        circle->data[i*6 + 1] += value;
    }
}

void drawCircle(GLuint vertexBufferObject, GLuint elementBufferObject, Circle circle){
    GLuint numSegments = 36;
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat) * (numSegments + 1) * 6, 
                    circle.data, GL_STATIC_DRAW
                );

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementBufferObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLuint) * numSegments * 3, 
                    circle.indices, GL_STATIC_DRAW
                );

    glDrawElements(GL_TRIANGLES, numSegments * 3, GL_UNSIGNED_INT, 0);
}