import ctypes
import time
import pyautogui

#pyautogui.displayMousePosition()
user32 = ctypes.windll.user32
user32.SetProcessDPIAware()
x = user32.GetSystemMetrics(0) / 1280
y = user32.GetSystemMetrics(1) / 720

pyautogui.moveTo(650 * x, 300 * y, 0.5)