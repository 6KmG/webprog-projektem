import time
import pyautogui
import ctypes

user32 = ctypes.windll.user32
user32.SetProcessDPIAware()

x = user32.GetSystemMetrics(0) / 1280
y = user32.GetSystemMetrics(1) / 720

while True:
    pyautogui.moveTo(630 * x, 675 * y, 0.5)
    pyautogui.click()
    
    pyautogui.moveTo(475 * x, 675 * y, 0.5)
    pyautogui.click()
    
    pyautogui.moveTo(800 * x, 600 * y, 0.5)
    pyautogui.click()
    
    time.sleep(3)