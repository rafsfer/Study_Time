''' Escreva um programa que solicite o percentual de crescimento de produção de uma empresa e informe
 se houve um crescimento (porcentagem positiva) ou decrescimento (porcentagem negativa).'''

percentual = float(input("Digite o percentual de crescimento:"))

if percentual > 0:
    print('Crescimento')
else:
    print ('Déficit')