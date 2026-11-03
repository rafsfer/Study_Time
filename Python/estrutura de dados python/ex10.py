'''Um instituto de meteorologia deseja fazer um estudo de temperatura
 média de cada mês do ano. Para isso, você precisa fazer um código que colete e 
 armazene essas temperaturas médias em uma lista. Depois, calcule a média anual das
   temperaturas e mostre todas as temperaturas acima da média anual
 e em que mês elas ocorreram, mostrando os meses por extenso (Janeiro, Fevereiro, etc.)'''

lista = []

for i in range(12):
    temperatura = float(input(f'Digite a temperatura do mês {i + 1}: '))
    lista.append(temperatura)

meses = {
    1: 'Janeiro', 2: 'Fevereiro', 3: 'Março', 4: 'Abril',
    5: 'Maio', 6: 'Junho', 7: 'Julho', 8: 'Agosto',
    9: 'Setembro', 10: 'Outubro', 11: 'Novembro', 12: 'Dezembro'
}

qtd = len(lista)
somatoria = sum(lista)
media_anual = somatoria / qtd

print(f'\nMédia anual: {media_anual:.2f}°C\n')
print('Temperaturas acima da média:')

for indice, temperatura in enumerate(lista):
    if temperatura > media_anual:
        numero_do_mes = indice + 1          # índice 0 = mês 1 (Janeiro)
        nome_do_mes = meses[numero_do_mes]
        print(f'{nome_do_mes}: {temperatura}°C')