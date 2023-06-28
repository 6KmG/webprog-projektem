import time
import pyautogui
import random

counter = 0

while True:
    a = random.choice(['w','a','s','d'])
    time.sleep(3)
    
    pyautogui.keyDown(a)
    
    time.sleep(0.5)

    pyautogui.keyUp(a)
    
    time.sleep(0.5)

    if counter % 2 == 0:
        pyautogui.press('tab')
        pyautogui.click(button='right')

    counter += 1
    
    if counter >= 60:
        pyautogui.press('esc')
        pyautogui.press('down')
        pyautogui.press('down')
        pyautogui.press('down')
        pyautogui.press('down')
        pyautogui.press('enter')
        pyautogui.press('esc')
        pyautogui.press('esc')
        counter = 0
        