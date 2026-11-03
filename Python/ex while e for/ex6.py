'''screva um programa que gere a tabuada de um número inteiro de 1 a 10, de acordo com 
a escolha da pessoa usuária. 
Como exemplo, para o número 2, a tabuada deve ser mostrada no seguinte formato:'''

tabuada = int(input('Digite um numero para sua tabuada'))
contador = 1
conta = 0

while contador <= 10:
    conta = tabuada * contador
    print(conta)
    contador += 1
    
