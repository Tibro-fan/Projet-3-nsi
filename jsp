import pygame
import sys
pygame.init()

largeur = 500
hauteur = 600
screen = pygame.display.set_mode((largeur, hauteur))
pygame.display.set_caption("Game")

BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GRAY = (200, 200, 200)
RED = (255, 0, 0)

box = 9
cellsize = (largeur-50) // box

def sqr(screen,color,x,y,size,width):
    pygame.draw.rect(screen,color,(x,y,size,size),width)

def grid(largeur,hauteur,screen,color,width):
    for line in range(box):
        for col in range(box):
            rectangle=pygame.draw.rect(screen,color,((25+line*50),(125+col*50),cellsize,cellsize),width)

def bomb_score():
    pygame.draw.rect(screen,WHITE,(300,25,175,75),1)

def bomb_sqr(ligne,col):
    ligne-=1
    col-=1
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.circle(screen,RED, [50+50*ligne, 150+150*col], 15, 15)

def flag_sqr(ligne,col):
    ligne-=1
    col-=1
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.rect(screen, WHITE, (40+50*ligne, 130+50*col, 3, 40))
    pygame.draw.polygon(screen, RED, [(40+ligne*50 + 3, 130+col*50), (40+ligne*50 + 25, 130+col*50 + 10), (40+ligne*50 + 3, 130+col*50 + 20)])

def one_sqr(num,ligne,col,color):
    ligne-=1
    col-=1
    font_size = 50
    font = pygame.font.SysFont(None, font_size)
    pygame.draw.rect(screen,WHITE,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    number_1 = font.render(num, True, color)
    number_1_rect = number_1.get_rect(center=(50+50*ligne, 150+50*col))
    screen.blit(number_1,number_1_rect)


running = True
while running:      
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill(BLACK)
    grid()
    one_sqr("2",1,1,RED)

    pygame.display.flip()

pygame.quit()
