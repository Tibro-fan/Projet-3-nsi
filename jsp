import pygame
import sys
import random
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

grid_list=[
 [0,0,0,0,0,0,0,1,1],
 [1,1,0,0,0,0,1,2,'B'],
 ['B',2,0,0,0,0,2,'B',3],
 ['B',2,0,0,0,0,2,'B',2],
 [1,2,1,0,0,0,1,1,1],
 [1,2,'B',0,0,1,1,1,0],
 ['B',2,1,1,1,2,'B',1,0],
 [1,1,0,1,2,'B',2,1,0],
 [0,0,0,1,'B',2,0,0,0]]

def sqr(ligne,col,color):
    #LINE
    pygame.draw.rect(screen,color,((25+50*ligne),(125+50*col),cellsize,cellsize),1)

def grid():
    #LINE
    for line in range(box):
        for col in range(box):
            rectangle=pygame.draw.rect(screen,WHITE,((25+line*50),(125+col*50),cellsize,cellsize),1)

"""
def random_grid():
    #LINE
    grid()
    for i in range(10):
        line=random.randint(1,9)
        row=random.randint(1,9)
        if bomb_sqr(line,row) not in grid():
            bomb_sqr(line,row)
"""

def bomb_score():
    #LINE
    pygame.draw.rect(screen,WHITE,(300,25,175,75),1)

def bomb_sqr(ligne,col):
    #LINE
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.circle(screen,RED, [50+50*ligne, 150+50*col], 15, 15)

def flag_sqr(ligne,col):
    #LINE
    ligne+=1
    col+=1
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.rect(screen, WHITE, (40+50*ligne, 130+50*col, 3, 40))
    pygame.draw.polygon(screen, RED, [(40+ligne*50 + 3, 130+col*50), (40+ligne*50 + 25, 130+col*50 + 10), (40+ligne*50 + 3, 130+col*50 + 20)])

def num_sqr(num,ligne,col,color):
    #LINE
    font_size = 50
    font = pygame.font.SysFont(None, font_size)
    pygame.draw.rect(screen,WHITE,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    number_1 = font.render(num, True, color)
    number_1_rect = number_1.get_rect(center=(50+50*ligne, 150+50*col))
    screen.blit(number_1,number_1_rect)

def screen_grid(list):
    num=[1,2,3,4,5,6,7,8]
    for line in range(9):
        for row in range(9):
            t=list[row][line]
            for i in range(len(num)):
                if t not in num:
                    if t==0:
                        sqr(line,row,WHITE)
                    elif t=='B':
                        bomb_sqr(line,row) 
                else:
                    num_sqr(str(t),line,row,WHITE) 



running = True
while running:      
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill(BLACK)
    screen_grid(grid_list)
    

    pygame.display.flip()

pygame.quit()

def sqr(color,x,y,size,width):
    pygame.draw.rect(screen,color,(x,y,size,size),width)

def grid(color,width):
    for line in range(box):
        for col in range(box):
            rectangle=pygame.draw.rect(screen,color,((25+line*50),(125+col*50),cellsize,cellsize),width)

def bomb_score():
    pygame.draw.rect(screen,WHITE,(300,25,175,75),1)

def bomb_sqr(ligne,col):
    ligne-=1
    col-=1
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.circle(screen,RED, [50+50*ligne, 150+50*col], 15, 15)

def flag_sqr(ligne,col):
    ligne-=1
    col-=1
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.rect(screen, WHITE, (40+50*ligne, 130+50*col, 3, 40))
    pygame.draw.polygon(screen, RED, [(40+ligne*50 + 3, 130+col*50), (40+ligne*50 + 25, 130+col*50 + 10), (40+ligne*50 + 3, 130+col*50 + 20)])

def num_sqr(num,ligne,col,color):
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
    grid(WHITE,1)
    bomb_sqr(6,9)

    pygame.display.flip()

pygame.quit()
