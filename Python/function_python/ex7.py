notas = []

def situacao_aluno(notas)->list:
    for i in range (1,5):
        nota = int(input('Digite as suas notas'))
        notas.append(nota)
    maior = max(notas)
    menor = min(notas)
    media = sum(notas) / len(notas)
    print(f'as notas sao {notas}, a maior sendo {maior}, a menor {menor}, e a média {media}')
    if media >= 6:
        print('Aprovado!')
    else:
        print('Reprovado!')
    

situacao_aluno(notas)