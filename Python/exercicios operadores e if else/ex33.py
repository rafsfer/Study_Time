'''Escreva um programa que peça à pessoa usuária três números
 que representam os lados de um triângulo. O programa deve informar 
 se os valores podem ser utilizados para formar um triângulo e, caso afirmativo, 
 se ele é equilátero, isósceles ou escaleno. Tenha em mente algumas dicas:

Três lados formam um triângulo quando a soma de quaisquer dois lados for maior que o terceiro;
Triângulo Equilátero: três lados iguais;
Triângulo Isósceles: quaisquer dois lados iguais;
Triângulo Escaleno: três lados diferentes.'''

lado1 = int(input('Digite lado 1:'))
lado2 = int(input('Digite lado 2:'))
lado3 = int(input('Digite lado 3:'))

if lado1 == lado2 and lado2 == lado3 and lado1 == lado3:
    print('Triangulo Equilatero')
elif lado1 == lado2 or lado2 == lado3 or lado1 == lado3:
    print ('Isoceles')
else:
    print('Escaleno')