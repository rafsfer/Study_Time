'''Vamos entender a distribuição de idades de pensionistas de uma empresa de previdência. 
Escreva um programa que leia as idades de uma quantidade não informada de clientes e mostre
 a distribuição em intervalos de [0-25], [26-50], [51-75] e [76-100]. 
 Encerre a entrada de dados com um número negativo.'''

idade = int(input('Digite sua idade:'))
contador_025 = 0
contador_2650 = 0
contador_5175 = 0
contador_76100 = 0

while idade >= 0:
    if idade <=25:
        contador_025 +=1
    if idade >=26 and idade <= 50:
        contador_2650 +=1
    if idade >=51 and idade <=75:
        contador_5175 +=1
    if idade >=76 and idade <=100:
        contador_76100 +=1

    idade = int(input('Digite sua idade: ')) #coloco mais uma vez aqui para repetir a info e n travar

print(contador_025)
print(contador_2650)
print(contador_5175)
print(contador_76100)