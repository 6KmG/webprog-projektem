import time
import pyautogui

while True:
    time.sleep(5)
    
    pyautogui.keyDown('w')
    time.sleep(0.5)
    pyautogui.keyUp('w')

    time.sleep(0.5)

    pyautogui.press('f5')
    time.sleep(0.25)
    
    pyautogui.press('f5')
    time.sleep(0.25)
    
    pyautogui.moveTo(640, 10, 0.5)
    pyautogui.click()

    pyautogui.moveTo(160, 220, 0.5)
    pyautogui.click()

    pyautogui.moveTo(460, 60, 0.5)
    pyautogui.click()

    pyautogui.moveTo(640, 650, 0.5)
    pyautogui.click()

    pyautogui.moveTo(360, 620, 0.5)
    pyautogui.click()

    pyautogui.moveTo(640, 540, 0.5)
    pyautogui.click()