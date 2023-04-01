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

    pyautogui.moveTo(160, 220, 1)
    pyautogui.click()

    pyautogui.moveTo(460, 60, 1)
    pyautogui.click()

    pyautogui.moveTo(640, 650, 1)
    pyautogui.click()

    pyautogui.moveTo(800, 620, 1)
    pyautogui.click()

    pyautogui.moveTo(640, 540, 1)
    pyautogui.click()