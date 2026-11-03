'''Faça um programa que, ao inserir um número qualquer,
 cria uma lista contendo todos os números primos entre 1 e o número digitado.'''

lista = []
num1 = int(input('Digite o número: '))

for candidato in range(2, num1 + 1):  # testa cada número de 2 até num1
    primo = True  # reseta a cada novo candidato
    
    for i in range(2, candidato):  # testa se "candidato" é divisível por algo
        if candidato % i == 0:
            primo = False
            break
    
    if primo:
        lista.append(candidato)

print(f"Números primos entre 1 e {num1}: {lista}")
    
