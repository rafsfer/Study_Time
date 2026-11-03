'''Desenvolva um programa que leia um conjunto indeterminado de temperaturas em Celsius
 e informe a média delas. A leitura deve ser encerrada ao ser enviado o valor -273°C.'''

temperatura = 0

while temperatura != -273:
    temperatura = int(input ('digite a temperatura:'))
    print(temperatura)
