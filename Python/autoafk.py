import time
import pyautogui

counter = 0
mytext = "https://snakegm.rf.gd/ (check it out!)"

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

    pyautogui.moveTo(720, 620, 1)
    pyautogui.click()

    pyautogui.moveTo(640, 540, 1)
    pyautogui.click()
    
    counter+=1
    if counter >= 30:
        pyautogui.press('Enter')
        pyautogui.typewrite(mytext)
        pyautogui.press('Enter')
        counter = 0
