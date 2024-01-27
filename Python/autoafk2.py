import os
import threading
import time
import keyboard
import pyautogui
import random

def exitOnKeyPress(key : str):
    while True:
        if(keyboard.is_pressed(key)):
            os._exit(0)
        time.sleep(0.5)
        
def autoafk2():
    keys = ['w','a','s','d']
    while True:
        a = random.choice(keys)
        pyautogui.keyDown(a)
        time.sleep(0.5)
        pyautogui.keyUp(a)

if __name__ == "__main__":
    exitOnKeyPressThread = threading.Thread(target = exitOnKeyPress, args= "q")
    autoafk2Thread = threading.Thread(target = autoafk2)

    exitOnKeyPressThread.start()
    autoafk2Thread.start()

    exitOnKeyPressThread.join()
    autoafk2Thread.join()