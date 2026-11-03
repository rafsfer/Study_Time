''' Em uma eleição para gerência em uma empresa com 20 pessoas colaboradoras, existem 
quatro candidatos(as). Escreva um programa que calcule o(a) vencedor(a) da eleição. 
A votação ocorreu da seguinte maneira:
Cada colaborador(a) votou em uma das quatro pessoas candidatas 
(que representamos pelos números 1, 2, 3 e 4).
Também foram contabilizados os votos nulos (representados pelo número 5) 
e os votos em branco (representados pelo número 6).
Ao final da votação, o programa deve exibir o número total de votos para cada candidato(a),
 os nulos e os votos em branco. Além disso, deve calcular e exibir a porcentagem de 
 votos nulos em relação ao total de votos e a porcentagem de votos em branco em 
 relação ao total de votos.'''

v1 = 0
v2 = 0
v3 = 0
v4 = 0
v5 = 0 

for i in range (1,21):
    voto = int(input("Digite seu voto de 1 a 5: 5 sendo Nulo"))
    if voto == 1:
        v1 +=1

    if voto == 2:
        v2 +=1
    
    if voto == 3:
        v3 += 1
    
    if voto == 4:
        v4 += 1
    
    if voto == 5:
        v5 += 1


    
print(v1, 'votos no 1')
print(v2, 'votos no 2')
print(v3, 'votos no 3')
print(v4, 'votos no 4')
print(v5, 'votos no 5')   