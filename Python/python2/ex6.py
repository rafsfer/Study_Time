''' Você recebeu uma demanda para 
gerar números de token para acessar o aplicativo 
de uma empresa. O token precisa ser par e variar de 1000 até 9998.
Escreva um código que solicita à pessoa usuária o seu nome e exibe 
uma mensagem junto a esse token gerado aleatoriamente.

"Olá, [nome], o seu token de acesso é [token]! Seja bem-vindo(a)!"'''

import matplotlib.pyplot as plt
from random import randrange

nome = input('Digite seu nome:')
numero = randrange(1000, 9998)
par = 0

if numero % 2 == 0:
    par = numero
    print(f'Olá {nome}, seu token de acesso é {par}')

