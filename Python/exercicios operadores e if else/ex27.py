'''Escreva um programa que leia valores médios de preços de um modelo de carro por 3 anos 
consecutivos e exiba o valor mais alto e mais baixo entre esses três anos.'''

valor1 = float(input("Digite o valor medio do preço do carro 1:"))
valor2 = float(input("Digite o valor medio do preço do carro 2:"))
valor3 = float(input("Digite o valor medio do preço do carro 3:"))

if valor1 > valor2 and valor1 > valor3:
    print(f'{valor1} é o maior valor')
elif valor2 > valor1 and valor2 > valor3:
    print(f'{valor2} é o maior valor')
else:
     print(f'{valor3} é o maior valor')