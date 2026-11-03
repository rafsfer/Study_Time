'''Faça um código que colete em uma 
lista 5 números inteiros quaisquer e imprima a lista. Exemplo: [1,4,7,2,4]'''

lista = []
num1 = int(input('Digite o numero:'))
num2 = int(input('Digite o numero:'))
num3 = int(input('Digite o numero:'))
num4 = int(input('Digite o numero:'))
num5 = int(input('Digite o numero:'))

lista.extend([num1,num2,num3,num4,num5])

print(lista)