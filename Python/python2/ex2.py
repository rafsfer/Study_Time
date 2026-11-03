'''Crie um programa que leia a seguinte 
lista de números e escolha um número desta aleatoriamente.'''

import matplotlib.pyplot as plt
from random import choice
lista = [8, 12, 54, 23, 43, 1, 90, 87, 105, 77]

lista_aleatoria = choice(lista)
print(lista_aleatoria)