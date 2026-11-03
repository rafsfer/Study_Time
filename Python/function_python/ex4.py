lista = [97, 80, 94, 88, 80, 1, 16, 53, 62, 32, 24, 99]


def multiplo(lista)->list:
    nova_lista = []
    for i in lista:
        if i % 3 == 0:
            nova_lista.append(i)
    print(nova_lista)
    return nova_lista

multiplo(lista)