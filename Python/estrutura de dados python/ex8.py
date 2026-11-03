'''Para uma seleção de produtos alimentícios, precisamos separar o 
conjunto de IDs dados por números inteiros sabendo que os produtos com ID par 
são doces e os com ID ímpar são amargos. Monte um código que colete 10 IDs.
 Depois, calcule e mostre a quantidade de produtos doces e amargos.'''

lista_doce = []
lista_salgada = []
lista = []

id1 = int(input('Digite os id:'))
id2 = int(input('Digite os id:'))
id3 = int(input('Digite os id:'))
id4 = int(input('Digite os id:'))
id5 = int(input('Digite os id:'))
id6 = int(input('Digite os id:'))
id7 = int(input('Digite os id:'))
id8 = int(input('Digite os id:'))
id9 = int(input('Digite os id:'))
id10 = int(input('Digite os id:'))

lista.extend([id1,id2,id3,id4,id5,id6,id7,id8,id9,id10])

for i in lista:
    if i % 2 == 0:
        lista_doce.append(i)
        
    else:
        lista_salgada.append(i)
        

print(f'Lista de Doces:{lista_doce}')
print(f'Lista de Salgados: {lista_salgada}')