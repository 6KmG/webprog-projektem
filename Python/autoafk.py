import time
import pyautogui
import random
import ctypes

counter = 7

user32 = ctypes.windll.user32
user32.SetProcessDPIAware()

x = user32.GetSystemMetrics(0) / 1280
y = user32.GetSystemMetrics(1) / 720

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
        pyautogui.moveTo(640 * x, 10 * y, 0.5)
        pyautogui.click()

        pyautogui.moveTo(150 * x, 200 * y, 0.5)
        pyautogui.click()

        pyautogui.moveTo(300 * x, 50 * y, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640 * x, 640 * y, 0.5)
        pyautogui.click()

        pyautogui.moveTo(420 * x, 620 * y, 0.5)
        pyautogui.click()
        
        pyautogui.moveTo(360 * x, 620 * y, 0.5)
        pyautogui.click()

        pyautogui.moveTo(640 * x, 540 * y, 0.5)
        pyautogui.click()
        