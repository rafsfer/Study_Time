'''Crie um programa que solicite à pessoa usuária digitar dois 
números inteiros e calcular a potência do 1º número elevado ao 2º.'''
import matplotlib.pyplot as plt
from math import pow

num1 = int(input('Digite o primeiro numero:'))
num2 = int(input('Digite o segundo numero:'))

potencia = pow(num1,num2)
print(potencia)