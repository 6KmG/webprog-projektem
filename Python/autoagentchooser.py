# Welcome to the auto agent generator script!
# Press q to quit
# This script runs on 2 threads

import os
import time
import pyautogui
import ctypes
import threading
import keyboard

user32 = ctypes.windll.user32
user32.SetProcessDPIAware()

def agentChooser():
    print("The auto agent generator is running! \nPress 'q' to quit.")

    # This is the resolution multiplier for both axis so the script should work on every resolution in general
    x = user32.GetSystemMetrics(0) / 1920
    y = user32.GetSystemMetrics(1) / 1080

    tiles = [
            [625, 840],     [710, 840],     [795, 840],     [880, 840],     [965, 840],     [1050, 840],    [1135, 840],    [1220, 840],    [1305, 840],
            [625, 925],     [710, 925],     [795, 925],     [880, 925],     [965, 925],     [1050, 925],    [1135, 925],    [1220, 925],    [1305, 925],
            [625, 1010],    [710, 1010],    [795, 1010],    [880, 1010],    [965, 1010],    [1050, 1010],   [1135, 1010],   [1220, 1010],   [1305, 1010],
            ]

    omen = tiles[13]
    skye = tiles[18]
    yoru = tiles[21]

    while True: 
        time.sleep(20)
        
        pyautogui.moveTo(yoru[0] * x, yoru[1] * y, 0.5)
        pyautogui.click()
        
        pyautogui.moveTo(skye[0] * x, skye[1] * y, 0.5)
        pyautogui.click()
        
        pyautogui.moveTo(omen[0] * x, omen[1] * y, 0.5)
        pyautogui.click()

def exitOnKeyPress(key : str):
    while True:
        if(keyboard.is_pressed(key)):
            os._exit(0)
        time.sleep(0.5)

if __name__ == "__main__":

    agentChooserThread = threading.Thread(target = agentChooser)
    exitOnKeyPressThread = threading.Thread(target = exitOnKeyPress, args = "q")

    agentChooserThread.start()
    exitOnKeyPressThread.start()

    agentChooserThread.join()
    exitOnKeyPressThread.join()