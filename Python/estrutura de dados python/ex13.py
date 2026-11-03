''' vão receber um abono correspondente a 10% do salário 
lista com os salários que receberão o abono: 
[1172, 1644, 2617, 5130, 5532, 6341, 6650, 7238, 7685, 7782, 7903]
não pode ser inferior a 200. Em código, transforme cada um dos salários em chaves de
 um dicionário e o abono de cada salário no elemento. Depois, informe o total de gastos com o abono,
 quantos(as) colaboradores(as) receberam o abono mínimo e qual o maior valor de abono fornecido.'''

'''Colaboradores(as) vão receber um abono correspondente a 10% do salário.
Lista com os salários que receberão o abono:
[1172, 1644, 2617, 5130, 5532, 6341, 6650, 7238, 7685, 7782, 7903]
O abono não pode ser inferior a 200. Transforme cada um dos salários em chaves de
um dicionário e o abono de cada salário no elemento. Depois, informe o total de gastos com o abono,
quantos(as) colaboradores(as) receberam o abono mínimo e qual o maior valor de abono fornecido.'''

salarios_lista = [1172, 1644, 2617, 5130, 5532, 6341, 6650, 7238, 7685, 7782, 7903]

abonos = {}          # dicionário: chave = salário, valor = abono
total_gastos = 0
minimo = 0

for salario in salarios_lista:
    abono = salario * 0.10

    if abono < 200:
        abono = 200          # aplica o piso mínimo garantido
        minimo += 1

    abonos[salario] = round(abono, 2) #Essa linha abonos[1172] = 200 significa, literalmente: "no dicionário abonos, crie (ou substitua) a chave 1172, e coloque o valor 200 nela".
    total_gastos += abono
    print(f'Salário: {salario} -> Abono: {round(abono, 2)}')

maior_abono = max(abonos.values())

print(f'\nO maior abono foi de: {round(maior_abono, 2)}')
print(f'O total gasto com abonos foi de: {round(total_gastos, 2)}')
print(f'{minimo} pessoa(s) receberam o abono mínimo de 200')
print(f'\nDicionário completo: {abonos}')