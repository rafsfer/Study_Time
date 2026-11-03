'''Colete novamente 5 inteiros e imprima a lista em ordem inversa à enviada.'''

lista = []
num1 = int(input('Digite o numero:'))
num2 = int(input('Digite o numero:'))
num3 = int(input('Digite o numero:'))
num4 = int(input('Digite o numero:'))
num5 = int(input('Digite o numero:'))

lista.extend([num1,num2,num3,num4,num5])
lista.sort(reverse=True) #deixa decrescente
print(lista)