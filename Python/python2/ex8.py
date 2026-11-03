'''Você recebeu um desafio de calcular a raiz quadrada 
de uma lista de números, identificando
quais resultaram em um número inteiro. A lista é a seguinte:
numeros = [2, 8, 15, 23, 91, 112, 256]'''

import matplotlib.pyplot as plt
import math

numeros = [2, 8, 15, 23, 91, 112, 256]
raizes = []

for i in range(len(numeros)):
    i = math.sqrt(i)
    raizes.append(i)
print(raizes)

for r in raizes:
    if r // 1 == r:
        print(f'{r} é um numero inteiro!')
    else: 
        print(f'{r} nao é um numero inteiro!')





