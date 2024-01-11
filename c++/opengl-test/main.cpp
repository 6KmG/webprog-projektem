#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <unistd.h>

#define WIDTH 1280
#define HEIGHT 720
#define FPS 60

const char* const vertexShaderSource = R"(
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

void moveSquareHorizontal(GLfloat square[], float value){
        square[0] += value;
        square[6] += value;
        square[12] += value;
        square[18] += value;
}

void moveVertical(GLfloat square[], float value){
        square[1] += value;
        square[7] += value;
        square[13] += value;
        square[19] += value;
}

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

void setupBuffer(GLuint &vertexBufferObject, GLuint &vertexArrayObject, GLuint &elementBufferObject) {
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

GLfloat* createSquare(GLFWwindow* window, float x, float y, float size, float r, float g, float b) {
    int window_width;
    int window_height;
    glfwGetWindowSize(window, &window_width, &window_height);

    GLfloat* squareVerticesAndColor = new GLfloat[24];
    if (squareVerticesAndColor != NULL) {
        squareVerticesAndColor[0] = (float)window_height / window_width * 0.0f;
        squareVerticesAndColor[1] = 0.0f;
        squareVerticesAndColor[2] = r; // color
        squareVerticesAndColor[3] = g; 
        squareVerticesAndColor[4] = b;
        squareVerticesAndColor[5] = 0.0f;
        squareVerticesAndColor[6] = (float)window_height / window_width * 0.0f;
        squareVerticesAndColor[7] = -size;
        squareVerticesAndColor[8] = r; // color
        squareVerticesAndColor[9] = g; 
        squareVerticesAndColor[10] = b;
        squareVerticesAndColor[11] = 0.0f;
        squareVerticesAndColor[12] = (float)window_height / window_width * size;
        squareVerticesAndColor[13] = -size;
        squareVerticesAndColor[14] = r; // color
        squareVerticesAndColor[15] = g; 
        squareVerticesAndColor[16] = b;
        squareVerticesAndColor[17] = 0.0f;
        squareVerticesAndColor[18] = (float)window_height / window_width * size;
        squareVerticesAndColor[19] = 0.0f;
        squareVerticesAndColor[20] = r; // color
        squareVerticesAndColor[21] = g; 
        squareVerticesAndColor[22] = b;
        squareVerticesAndColor[23] = 0.0f;
    }
    return squareVerticesAndColor;
}

GLuint* connectSquare() {
    GLuint* indices = new GLuint[6];
    if (indices != NULL) {
        indices[0] = 0;
        indices[1] = 1;
        indices[2] = 2;
        indices[3] = 0;
        indices[4] = 2;
        indices[5] = 3;
    }
    return indices;
}
    
void drawSquare(GLuint vertexBufferObject, GLuint elementBufferObject, GLfloat* square, GLuint* indices){
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferObject);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat) * 24, square, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementBufferObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLuint) * 6, indices, GL_STATIC_DRAW);

    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
}

char movement[] = {0, 0, -1, 1}; // W, S, A, D
GLfloat* square;

void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    // Check if the key is pressed
    if (action == GLFW_PRESS || action == GLFW_REPEAT) {
        // Handle different keys for movement
        switch (key) {
            case GLFW_KEY_W:
                if(movement[0] != -1){
                    movement[0] = 1;
                    movement[1] = -1;
                    movement[2] = 0;
                    movement[3] = 0;
                }
                break;
            case GLFW_KEY_S:
                if(movement[1] != -1){
                    movement[0] = -1;
                    movement[1] = 1;
                    movement[2] = 0;
                    movement[3] = 0;
                }
                break;
            case GLFW_KEY_A:
                if(movement[2] != -1){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = 1;
                    movement[3] = -1;
                }
                break;
            case GLFW_KEY_D:
                if(movement[3] != -1){
                    movement[0] = 0;
                    movement[1] = 0;
                    movement[2] = -1;
                    movement[3] = 1;
                }
                break;
        // Add more cases for other keys if needed
        }
    }
}

int main() 
{
    if (!glfwInit()) 
    {
        return -1;
    }

    GLFWwindow* window;
    window = glfwCreateWindow(WIDTH, HEIGHT, "Pentagon Rendering", NULL, NULL);
    if (!window) 
    {
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    if (glewInit() != GLEW_OK) 
    {
        return -1;
    }

    if (!GLEW_ARB_vertex_array_object) {
        return -1;
    }
    

    square = createSquare(window, 0.0f, 0.0f, 0.125f, 1.0f, 0.3f, 0.3f);
    GLuint* squareIndices = connectSquare();

    GLfloat* square1 = createSquare(window, 0.0f, 0.0f, 0.125f, 0.0f, 0.3f, 0.3f);

    glfwSetKeyCallback(window, keyCallback);

    GLuint vertexShader, fragmentShader, shaderProgram;
    setupShader(vertexShader, fragmentShader, shaderProgram);

    GLuint vertexBufferObject, vertexArrayObject, elementBufferObject;
    setupBuffer(vertexBufferObject, vertexArrayObject, elementBufferObject);
    
    int window_width;
    int window_height;
    glfwGetWindowSize(window, &window_width, &window_height);
    float horizontalSpeedMultiplier = (float) window_height/window_width;
    float moveLeftSpeed = -0.01f * horizontalSpeedMultiplier;
    float moveRightSpeed = 0.01f * horizontalSpeedMultiplier;

    while (!glfwWindowShouldClose(window)) 
    {
        moveSquareHorizontal(square1, 0.001f);
        moveVertical(square1, 0.001f);

        if(movement[0] == 1) moveVertical(square, 0.01f);
        else if(movement[1] == 1) moveVertical(square, -0.01f);
        else if(movement[2] == 1) moveSquareHorizontal(square, moveLeftSpeed);
        else if(movement[3] == 1) moveSquareHorizontal(square, moveRightSpeed);

        glClear(GL_COLOR_BUFFER_BIT);
                
        drawSquare(vertexBufferObject, elementBufferObject, square, squareIndices);
        drawSquare(vertexBufferObject, elementBufferObject, square1, squareIndices);
        glClearColor(0.6f, 0.6f, 1.0f, 1.0f);

        glfwSwapBuffers(window);
        glfwPollEvents();

        usleep(1000000/FPS);
    }

    glDeleteVertexArrays(1, &vertexArrayObject);
    glDeleteBuffers(1, &vertexBufferObject);
    glDeleteBuffers(1, &elementBufferObject);

    delete[] square;
    delete[] squareIndices;
    delete[] square1;

    glfwTerminate();
    return 0;
}
