''' Escreva um programa que peça uma data informando 
o dia, mês e ano e determine se ela é válida para uma análise.'''

lista = []

dia = int(input('Digite o dia:'))
mes = int(input('Digite o mes:'))
ano = int(input('Digite o ano:'))

if dia >=1 and dia <=31:
    lista.append(dia)
    if mes >=1 and mes <=12 :
        lista.append(mes)
    else: 
         print('mes nao correspondente')
         if ano <=2026:
             lista.append(ano)
                                    
print(lista)