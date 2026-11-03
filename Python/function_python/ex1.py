notas = [8.5,9.0,6.0,10.0]


def media ():
    somatoria = 0
    medias = 0
    for nota in notas:
        somatoria += nota
    medias = somatoria / len(notas)
    medias = round(medias, 1)
    print(medias)

media()

'''ou 
def media(lista)
calculo = sum(lista) / len(lista)
return calculo -> retorno o resultado em uma variavel


resultado = media(notas)




'''