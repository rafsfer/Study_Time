'''Escreva um programa para calcular quantos dias levará para a colônia de uma bactéria 
 ultrapassar ou igualar a colônia de uma bactéria B, com base nas taxas
 de crescimento de 3% e 1,5% respectivamente. 
Considere que a colônia A inicia com 4 elementos e a B com 10.'''

a = 4
b = 10
dias = 0

while a < b: #a condição de parada compara um 0contador de dias com o tamanho da colônia B. Deveria ser a < b (enquanto A não alcança B).
    a = a * 1.03      # crescimento de 3% ao dia
    b = b * 1.015     # crescimento de 1,5% ao dia
    dias += 1
    print(dias, round(a, 2), round(b, 2))

print(f"\nA colônia A ultrapassa ou iguala a colônia B em {dias} dias.")