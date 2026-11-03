'''Crie um programa que solicite dois valores numéricos, um
numerador e um denominador, e retorne o resto da divisão 
entre os dois valores. Deixe claro que o valor do denominador não pode ser 0.'''

n1 = int(input("Digite o primeiro número:"))
n2 = int(input("Digite o segundo número:"))
div = n1 % n2
print('a divisão entre', n1, 'e', n2, 'é', div)