'''Faça um programa para uma loja que vende grama para jardins. 
Essa loja trabalha com jardins circulares e o preço do metro quadrado
 da grama é de R$ 25,00. Peça à pessoa usuária o raio da
 área circular e devolva o valor em reais do quanto precisará pagar.'''

import matplotlib.pyplot as plt
from math import pi, pow

raio = float(input('Digite o raio da área circular:'))
valor = 25.00
area = pi*(pow(raio,2))
total = area * valor

print(f'O total a pagar, sera de: R${round(total,2)}')