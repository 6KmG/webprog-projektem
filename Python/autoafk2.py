import time
import pyautogui

while True:
    time.sleep(5)
    
    pyautogui.keyDown('w')
    time.sleep(0.86)
    pyautogui.keyUp('w')
    
    time.sleep(0.79)

    pyautogui.press('f5')
    time.sleep(0.25)
    
    pyautogui.press('f5')
    time.sleep(0.25)