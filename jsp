import pygame
import sys
import random
import math
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

def grid_list():
    list=[
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0]]
    reccur=0
    while reccur<10:
        reccur=0
        ln=random.randint(0,8)
        rw=random.randint(0,8)
        list[rw][ln]='B'
        for j in range(len(list)):
            reccur+=list[j].count('B')
    return list

def bomb_score():
    #LINE
    pygame.draw.rect(screen,WHITE,(300,25,175,75),1)

def bomb_sqr(ligne,col):
    #LINE
    pygame.draw.rect(screen,RED,((25+50*ligne),(125+50*col),cellsize,cellsize),1)
    pygame.draw.circle(screen,RED, [50+50*ligne, 150+50*col], 15, 15)

def flag_sqr(mouse_position):
    #LINE
    pygame.draw.rect(screen,RED,((25+50*mouse_position[0]),(125+50*mouse_position[1]),cellsize,cellsize),1)
    pygame.draw.rect(screen, WHITE, (40+50*mouse_position[0], 130+50*mouse_position[1], 3, 40))
    pygame.draw.polygon(screen, RED, [(40+mouse_position[0]*50 + 3, 130+mouse_position[1]*50), (40+mouse_position[0]*50 + 25, 130+mouse_position[1]*50 + 10), (40+mouse_position[0]*50 + 3, 130+mouse_position[1]*50 + 20)])

def num_sqr(mouse_position,color):
    #LINE
    num = 0
    i = math.floor((mouse_position[0]-25)/50)
    j = math.floor((mouse_position[1]-125)/50)
    for k in range(3):
        for l in range(3):
            if list[j+l][i+k] == 'B':
                num += 1
    font_size = 50
    font = pygame.font.SysFont(None, font_size)
    pygame.draw.rect(screen,WHITE,((25+50*mouse_position[0]),(125+50*mouse_position[1]),cellsize,cellsize),1)
    number_1 = font.render(num, True, color)
    number_1_rect = number_1.get_rect(center=(50+50*mouse_position[0], 150+50*mouse_position[1]))
    screen.blit(number_1,number_1_rect)

def screen_grid(list):
    #LINE
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

list = grid_list()

image = pygame.image.load('logo_noir.png')
image = pygame.transform.scale(image, (275, 125))
image_rect = image.get_rect(center=(150, 60))

def logo_sqr():
    pygame.draw.rect(screen,WHITE,(25,15,250,95),1)


running = True
while running:      
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        elif event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
            mouse_position = pygame.mouse.get_pos()
            if list == 'B':
                print(list)
                print('Vous avez perdu !')
                pygame.display.flip()
            else:
                num_sqr(mouse_position,'\uabcd')
                pygame.display.flip()

        elif event.type == pygame.MOUSEBUTTONDOWN and event.button == 3:
            mouse_position = pygame.mouse.get_pos()
            flag_sqr(mouse_position)
            pygame.display.flip()

                
    
    
    screen.fill(BLACK)
    screen.blit(image, image_rect.topleft)
    flag_sqr((0,0))
    bomb_score()
    screen_grid(list)


    pygame.display.flip()

pygame.quit()
