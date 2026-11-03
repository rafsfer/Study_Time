notas = []

def calcula_nota_media(notas)->list:
    for i in range(1, 6):
        nota = float(input('Digite a uma nota'))
        notas.append(nota)  
    notas.remove(max(notas))
    notas.remove(min(notas))
    print(notas)
    for i in notas:
        somatoria = sum(notas)
        qtd = len(notas)
        media = somatoria / qtd
    print(f'a média entre as notas {notas} é {media}')
    
calcula_nota_media(notas)