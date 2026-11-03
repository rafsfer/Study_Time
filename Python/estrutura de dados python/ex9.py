''''Desenvolva um programa que informa a nota de um(a) aluno(a) de acordo com suas respostas. 
Ele deve pedir a resposta desse(a) aluno(a) para cada questão e é preciso verificar se a resposta 
foi igual ao gabarito. Cada questão vale um ponto e existem as alternativas A, B, C ou D.
01 - D
02 - A
03 - C
04 - B
05 - A
06 - D
07 - C
08 - C
09 - A
10 - B'''

id1 = (input('Digite os id:'))
id2 = (input('Digite os id:'))
id3 = (input('Digite os id:'))
id4 = (input('Digite os id:'))
id5 = (input('Digite os id:'))
id6 = (input('Digite os id:'))
id7 = (input('Digite os id:'))
id8 = (input('Digite os id:'))
id9 = (input('Digite os id:'))
id10 = (input('Digite os id:'))

lista = []

lista.extend([id1,id2,id3,id4,id5,id6,id7,id8,id9,id10])

gabarito = {
    '1': 'D',
    '2': 'A',
    '3': 'C',
    '4': 'B',
    '5': 'A',
    '6': 'D',
    '7': 'C',
    '8': 'C',
    '9': 'A',
    '10': 'B'
}


pontos = 0

for n in gabarito.values() :
   for i in lista:
      if n == i:
         pontos+=1
      break

print(f'Sua nota é: {pontos}')