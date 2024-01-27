import os
import time
import pyautogui
import ctypes
import threading
import keyboard

user32 = ctypes.windll.user32
user32.SetProcessDPIAware()

def autoaccept():
    x = user32.GetSystemMetrics(0) / 1024
    y = user32.GetSystemMetrics(1) / 768

    while True:
        time.sleep(18)
        
        pyautogui.moveTo(650 * x, 300 * y, 0.5)
        pyautogui.click()

def exitOnKeyPress(key : str):
    while True:
        if(keyboard.is_pressed(key)):
            os._exit(0)
        time.sleep(0.5)

if __name__ == "__main__":
    agentChooserThread = threading.Thread(target = autoaccept)
    exitOnKeyPressThread = threading.Thread(target = exitOnKeyPress, args = "q")

    agentChooserThread.start()
    exitOnKeyPressThread.start()

    agentChooserThread.join()
    exitOnKeyPressThread.join()