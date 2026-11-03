'''Crie um código que calcule e imprima 
a média ponderada dos números 5, 12, 20 e 15 com pesos
respectivamente iguais a 1, 2, 3 e 4.'''

n1 = int(input("Digite o primeiro número:"))
n2 = int(input("Digite o segundo número:"))
n3 = int(input("Digite o terceiro número:"))
n4 = int(input("Digite o quarto número:"))

n1_peso = 1
n2_peso = 2
n3_peso = 3
n4_peso = 4

media_ponderada = (n1*n1_peso+n2*n2_peso+n3*n3_peso+n4*n4_peso)/4

print('a media é',media_ponderada)