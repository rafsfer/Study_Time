#tabuada

numero = int(input('Digite o numero para ver sua tabluada'))
calculo = 0
def tabuada (numero)->int:
    for num in range(1, 11):
       calculo = numero * num
       print(f'{numero}x{num}={calculo}')

tabuada(numero)