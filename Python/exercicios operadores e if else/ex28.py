'''Escreva um programa que pergunte sobre o preço de três
 produtos e indique qual é o produto mais barato para comprar.'''

valor1 = float(input("Digite o valor item 1:"))
valor2 = float(input("Digite o valor item 2:"))
valor3 = float(input("Digite o valor item 3:"))

if valor1 < valor2 and valor1 < valor3:
    print(f'{valor1} é o menor valor')
elif valor2 < valor1 and valor2 < valor3:
    print(f'{valor2} é o menor valor')
else:
     print(f'{valor3} é o menor valor')