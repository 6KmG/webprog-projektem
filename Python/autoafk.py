import time
import pyautogui
import random

counter = 7

while True:
    a = random.choice(['w','a','s','d'])
    time.sleep(3)
    
    pyautogui.keyDown(a)
    time.sleep(0.5)
    pyautogui.keyUp(a)

    time.sleep(0.5)

    pyautogui.press('f5') 
    time.sleep(0.25)
    
    pyautogui.press('f5')
    time.sleep(0.25)
    
    counter += 1
    
    if counter % 8 == 0:
        pyautogui.moveTo(640, 10, 0.5)
        pyautogui.click()

        pyautogui.moveTo(160, 250, 0.5)
        pyautogui.click()

        pyautogui.moveTo(300, 50, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640, 640, 0.5)
        pyautogui.click()

        pyautogui.moveTo(420, 620, 0.5)
        pyautogui.click()
        
        pyautogui.moveTo(360, 620, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640, 540, 0.5)
        pyautogui.click()
        