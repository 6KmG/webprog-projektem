import time
import pyautogui

counter = 7

while True:
    time.sleep(3)
    
    pyautogui.keyDown('w')
    time.sleep(0.5)
    pyautogui.keyUp('w')

    time.sleep(0.5)

    pyautogui.press('f5')
    time.sleep(0.25)
    
    pyautogui.press('f5')
    time.sleep(0.25)
    
    counter += 1
    
    if counter >= 8:
        pyautogui.moveTo(640, 10, 0.5)
        pyautogui.click()

        pyautogui.moveTo(160, 220, 0.5)
        pyautogui.click()

        pyautogui.moveTo(360, 60, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640, 650, 0.5)
        pyautogui.click()

        pyautogui.moveTo(420, 620, 0.5)
        pyautogui.click()
        
        pyautogui.moveTo(360, 620, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640, 540, 0.5)
        pyautogui.click()
        
        counter = 0
        