import time
import pyautogui
import sys

# WINDOW_WIDTH, WINDOW_HEIGHT = 800, 480

running = True

def exitbutton():
    # global running
    # for run in pygame.event.get():
    #     if run.type == pygame.KEYDOWN:
    #         if run.key == pygame.K_ESCAPE:  #Key "esc"
    #             sys.exit()
    #             running = False
    time.sleep(0.75)


# pygame.init()
# window = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT),pygame.SHOWN)

while running:
    time.sleep(1)

    pyautogui.keyDown('w')
    time.sleep(0.86)
    pyautogui.keyUp('w')
    time.sleep(0.79)

    pyautogui.keyDown('f5')
    time.sleep(0.25)
    pyautogui.keyUp('f5')
    
    time.sleep(0.25)

    pyautogui.keyDown('f5')
    time.sleep(0.25)
    pyautogui.keyUp('f5')

    time.sleep(0.25)

    pyautogui.keyDown('f5')
    time.sleep(0.25)
    pyautogui.keyUp('f5')
    
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