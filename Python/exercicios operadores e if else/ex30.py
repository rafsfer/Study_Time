'''Escreva um programa que peça um número inteiro à pessoa usuária e determine se ele é par ou ímpar.'''

num = int(input("Digite um numero e verifique se ele é impar ou par:"))

if num % 2 == 0:
    print('PAR')
else:
    print('IMPAR')