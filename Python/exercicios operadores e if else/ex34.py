'''Um estabelecimento está vendendo combustíveis com descontos variados. 
Para o etanol, se a quantidade comprada for até 15 litros, o desconto será de 2% por litro.
Caso contrário, será de 4% por litro. Para o diesel, se a quantidade comprada for até 15 litros,
 o desconto será de 3% por litro. Caso contrário, será de 5% por litro.
 O preço do litro de diesel é R$ 2,00 e o preço do litro de etanol é R$ 1,70. 
 Escreva um programa que leia a quantidade de litros vendidos e o tipo de combustível 
 (E para etanol e D para diesel) e calcule o valor a ser pago pelo cliente. Tenha em mente algumas dicas:
O do valor do desconto será a multiplicação entre preço do litro, quantidade de litros e o valor do desconto.
O valor a ser pago por um cliente será o resultado da multiplicação
 do preço do litro pela quantidade de litros menos o valor de desconto resultante do cálculo.'''

litros = float(input("Digite a quantidade de litros:"))
valore = 1.70
valord = 2.00
opcao = int(input("Digite qual o tipo de combustivel:"))


if opcao == 1:
    if litros <= 15:
        desc = (valore * litros) * 0.02
        totale = (valore * litros) - desc
        print(f'o valor total a ser pago é {totale}')
    else:
        desc = (valore * litros) * 0.04
        totale = (valore * litros) - desc
        print(f'o valor total a ser pago é {totale}')
elif opcao == 2:
    if litros <= 15:
        desc = (valord * litros) * 0.03
        totald = (valord * litros) - desc
        print(f'o valor total a ser pago é {totald}')
    else:
        desc = (valord * litros) * 0.05
        totald = (valord * litros) - desc
        print(f'o valor total a ser pago é {totald}')

