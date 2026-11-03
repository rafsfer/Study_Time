'''Uma empresa de e-commerce está interessada em analisar as vendas dos seus produtos.
 Os dados das vendas foram armazenados em um dicionário:
 {'Produto A': 300, 'Produto B': 80, 'Produto C': 60,
 'Produto D': 200, 'Produto E': 250, 'Produto F': 30}

 Escreva um código que calcule o total de vendas e o produto mais vendido.
'''

produtos = {'Produto A': 300, 
            'Produto B': 80, 
            'Produto C': 60,
            'Produto D': 200,
            'Produto E': 250,
            'Produto F': 30}

total = 0
maior_valor = max(produtos.values())

for valor in produtos.values():
    total += valor  # equivale a: total = total + valor
    print(valor)

print('Total:', total)
print(maior_valor)

