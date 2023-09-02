#include <windows.h>

#define WIDTH 800
#define HEIGHT 600
#define TITLE "The title of the window"

const char className[] = "class69";

// Step 4: the Window Procedure
int __stdcall WndProc(
    HWND hwnd, 
    unsigned int msg, 
    unsigned int wParam, 
    int *lParam)
{
    switch(msg)
    {
        case WM_CLOSE:
            DestroyWindow(hwnd);
        break;
        case WM_DESTROY:
            PostQuitMessage(0);
        break;
        default:
            return DefWindowProcA(hwnd, msg, wParam, lParam);
    }
    return 0;
}

int __stdcall WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
    char* lpCmdLine, int nCmdShow)
{
    WNDCLASSEXA wc;
    HWND hwnd;
    MSG Msg;

    //Step 1: Registering the Window Class
    wc.cbSize        = sizeof(WNDCLASSEX);
    wc.style         = 0;
    wc.lpfnWndProc   = WndProc;
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = className;
    wc.hbrBackground = (HBRUSH)(17);
    wc.hIconSm       = LoadIconA(NULL, IDI_APPLICATION);

    RegisterClassExA(&wc);

    // Step 2: Creating the Window
    hwnd = CreateWindowExA(
        0,
        className,
        TITLE,
        WS_OVERLAPPEDWINDOW,
        0, 0, 
        WIDTH, HEIGHT,
        0, 0, hInstance, NULL);

    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

    // Step 3: The Message Loop
    while(GetMessageA(&Msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&Msg);
        DispatchMessageA(&Msg);
    }
}