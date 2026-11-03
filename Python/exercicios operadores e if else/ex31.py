'''Escreva um programa que peça um número à pessoa usuária e informe se ele é inteiro ou decimal.'''

num = float(input("Digite um numero:"))

if num % 1 == 0:
    print('Inteiro')
else:
    print('Decimal')
