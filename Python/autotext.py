import time
import pyautogui

mytext = "💀a"

while True:
    time.sleep(3)
    pyautogui.press('Enter')
    pyautogui.typewrite(mytext)
    pyautogui.press('Enter')