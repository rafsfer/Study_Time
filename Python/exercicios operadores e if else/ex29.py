'''Escreva um programa que leia três números e os exiba em ordem decrescente.'''
n1 = int(input("Digite um numero:"))
n2 = int(input("Digite um numero:"))
n3 = int(input("Digite um numero:"))

if n1 > n2 and n2 > n3:
    print(f'{n1,n2,n3}')
elif n2 > n1 and n2 > n3:
    print(f'{n2,n1,n3}')
else:
    print(f'{n3,n2,n1}')