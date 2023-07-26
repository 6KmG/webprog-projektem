wwwimport time
import pyautogui
import random

keys = ['w','a','s','d']

while True:
    a = random.choice(keys)
    pyautogui.keyDown(a)
    time.sleep(0.5)
    pyautogui.keyUp(a)