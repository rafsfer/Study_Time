'''{'Área Norte': [2819, 7236],
 'Área Leste': [1440, 9492],
 'Área Sul': [5969, 7496],
 'Área Oeste': [14446, 49688],
 'Área Centro': [22558, 45148]}

 Escreva um código para calcular a média de espécies por área e 
 identificar a área com a maior diversidade biológica. Dica: use as funções built-in sum() e len()
'''

areas = {'Área Norte': [2819, 7236],
 'Área Leste': [1440, 9492],
 'Área Sul': [5969, 7496],
 'Área Oeste': [14446, 49688],
 'Área Centro': [22558, 45148]
}


maior_media = 0 
chave = None

for c, i in areas.items():
    valor = i
    tamanho = len(valor)
    media = sum(valor) / tamanho
    print(c, media)

    if media > maior_media:
        maior_media = media
        chave = c

print(f'\nÁrea com maior diversidade: {chave} ({maior_media})')


