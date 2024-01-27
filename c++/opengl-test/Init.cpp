#pragma once

#include <GL/glew.h>
#include <GLFW/glfw3.h>

const char* vertexShaderSource = R"(
    #version 330 core
    layout (location = 0) in vec2 aPos;
    layout (location = 1) in vec3 aColor; // Color attribute

    uniform mat4 modelMatrix;
    out vec3 vertexColor;

    void main()
    {
        gl_Position = vec4(aPos.x, aPos.y, 0.0, 1.0);  // Use 0.0 as the z-coordinate
        vertexColor = aColor; // Pass the color to the fragment shader
    }
)";

const char* fragmentShaderSource = R"(
    #version 330 core
    
    out vec4 FragColor;
    in vec3 vertexColor; // Color received from the vertex shader

    void main()
    {
        FragColor = vec4(vertexColor, 1.0);
    }

)";

void setupShader(GLuint vertexShader, GLuint fragmentShader, GLuint shaderProgram){
    vertexShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
    glCompileShader(vertexShader);

    fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
    glCompileShader(fragmentShader);

    shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);
    glUseProgram(shaderProgram);
}

void setupBuffer(GLuint &vertexBufferObject, GLuint &vertexArrayObject, GLuint &elementBufferObject){
    glGenBuffers(1, &vertexBufferObject);
    glGenVertexArrays(1, &vertexArrayObject);
    glGenBuffers(1, &elementBufferObject);

    glBindVertexArray(vertexArrayObject);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementBufferObject);

    glBufferData(GL_ARRAY_BUFFER, sizeof(float) * 24, nullptr, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);

    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(float), (void*)(2 * sizeof(float)));
    glEnableVertexAttribArray(1);
}