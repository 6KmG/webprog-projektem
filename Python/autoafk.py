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
    
    if counter >= 8:
        pyautogui.moveTo(640, 10, 0.5)
        pyautogui.click()

        pyautogui.moveTo(160, 220, 0.5)
        pyautogui.click()

        pyautogui.moveTo(370, 60, 0.5)
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
        