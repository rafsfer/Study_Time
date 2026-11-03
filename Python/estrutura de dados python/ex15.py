'''{'Setor A': [22, 26, 30, 30, 35, 38, 40, 56, 57, 65],
 'Setor B': [22, 24, 26, 33, 41, 49, 50, 54, 60, 64],
 'Setor C': [23, 26, 26, 29, 34, 35, 36, 41, 52, 56],
 'Setor D': [19, 20, 25, 27, 34, 39, 42, 44, 50, 65]}

Sabendo que cada setor tem 10 colaboradores(as), construa um código que calcule a média de idade
 de cada setor, a idade média geral entre todos os setores e quantas pessoas
 estão acima da idade média geral.'''

setor = {'Setor A': [22, 26, 30, 30, 35, 38, 40, 56, 57, 65],
 'Setor B': [22, 24, 26, 33, 41, 49, 50, 54, 60, 64],
 'Setor C': [23, 26, 26, 29, 34, 35, 36, 41, 52, 56],
 'Setor D': [19, 20, 25, 27, 34, 39, 42, 44, 50, 65]
}


# Etapa 1: média de cada setor
for c, i in setor.items():
    media_setor = sum(i) / len(i)
    print(c, media_setor)

# Etapa 2: média geral de TODAS as pessoas (não média das médias)
todas_idades = []
for i in setor.values():
    todas_idades.extend(i)

media_geral = sum(todas_idades) / len(todas_idades)
print('\nMédia geral:', media_geral)

# Etapa 3: agora que media_geral está PRONTA, conta quem está acima dela
acima_media = 0
for idade in todas_idades:
    if idade > media_geral:
        acima_media += 1

print('Pessoas acima da média geral:', acima_media)