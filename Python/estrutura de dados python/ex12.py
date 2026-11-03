'''Uma pesquisa de mercado foi feita para decidir qual design de marca infantil 
mais agrada as crianças.
 A pesquisa foi feita e o votos computados podem ser observados abaixo:
 Tabela de votos da marca
Design 1 - 1334 votos
Design 2 - 982 votos
Design 3 - 1751 votos
Design 4 - 210 votos
Design 5 - 1811 votos

Adapte os dados fornecidos para uma estrutura de dicionário. 
A partir dele, informe o design vencedor e a porcentagem de votos recebidos.
 '''

votos = votos = {
    'Design 1': 1334,
    'Design 2': 982,
    'Design 3': 1751,
    'Design 4': 210,
    'Design 5': 1811
}

maior_valor = max(votos.values())
soma = sum(votos.values())

chave_do_maior = None

for chave in votos.keys():
    valor = votos[chave] #aqui fica armazenado o valor da minha chave e depois vai descendo

    if valor > maior_valor:
        maior_valor = valor
        chave_do_maior = chave

print(chave_do_maior, maior_valor)


