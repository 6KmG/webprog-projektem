import pygame
import math

WIDTH, HEIGHT = 640, 480
FPS = 60

# Initialize Pygame
pygame.init()
screen = pygame.display.set_mode((WIDTH, HEIGHT))
clock = pygame.time.Clock()

# Color definitions
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Player class
class Player(pygame.sprite.Sprite):
    def __init__(self, x, y):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((50, 50))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.rect.centerx = x
        self.rect.centery = y
        self.speed_x = 0
        self.speed_y = 0

    def update(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y

    def shoot(self, mouse_x, mouse_y):
        shoot_x = mouse_x - self.rect.centerx
        shoot_y = mouse_y - self.rect.centery
        magnitude = math.sqrt(shoot_x**2 + shoot_y**2)
        shoot_x /= magnitude
        shoot_y /= magnitude
        return (shoot_x, shoot_y)

# Bullet class
class Bullet(pygame.sprite.Sprite):
    def __init__(self, x, y, direction_x, direction_y):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((10, 10))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.rect.centerx = x
        self.rect.centery = y
        self.speed_x = direction_x * 5
        self.speed_y = direction_y * 5

    def update(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y

# Villain class
class Villain(pygame.sprite.Sprite):
    def __init__(self, x, y):
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((100, 100))
        self.image.fill(WHITE)
        self.rect = self.image.get_rect()
        self.rect.centerx = x
        self.rect.centery = y

    def update(self):
        pass

# Initialize sprite groups
all_sprites = pygame.sprite.Group()
bullets = pygame.sprite.Group()

# Add player and villain to sprite groups
player = Player(WIDTH/2, HEIGHT/2)
all_sprites.add(player)
villain = Villain(WIDTH/2, HEIGHT/4)
all_sprites.add(villain)
running = True
while running:
    # Handle events
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP:
                player.speed_y = -5
            if event.key == pygame.K_DOWN:
                player.speed_y = 5
            if event.key == pygame.K_LEFT:
                player.speed_x = -5
            if event.key == pygame.K_RIGHT:
                player.speed_x = 5
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_UP:
                player.speed_y = 0
            if event.key == pygame.K_DOWN:
                player.speed_y = 0
            if event.key == pygame.K_LEFT:
                player.speed_x = 0
            if event.key == pygame.K_RIGHT:
                player.speed_x = 0
        if event.type == pygame.MOUSEBUTTONDOWN:
            direction = player.shoot(*pygame.mouse.get_pos())
            bullet = Bullet(player.rect.centerx, player.rect.centery, direction[0], direction[1])
            all_sprites.add(bullet)
            bullets.add(bullet)
    # Update sprites
    all_sprites.update()

    # Check for bullet-villain collision
    hits = pygame.sprite.spritecollide(villain, bullets, True)
    if len(hits) > 0:
        print("You win!")
        running = False

    # Clear screen
    screen.fill(BLACK)

    # Draw sprites
    all_sprites.draw(screen)

    # Update screen
    pygame.display.update()

    # Limit FPS
    clock.tick(FPS)
pygame.quit()