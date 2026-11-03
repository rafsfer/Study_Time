'''Em uma empresa de venda de imóveis você precisa criar um código que
 analise os dados de vendas anuais para ajudar a diretoria na tomada de decisão. 
 O código precisa coletar os dados de quantidade de venda durante os anos de 2022 e 2023 e 
 fazer um cálculo de variação percentual. A partir do valor da variação, deve ser enviada 
 às seguintes sugestões:

Para variação acima de 20%: bonificação para o time de vendas.
Para variação entre 2% e 20%: pequena bonificação para time de vendas.
Para variação entre 2% e -10%: planejamento de políticas de incentivo às vendas.
Para variação abaixo de -10%: corte de gastos.
 ((Valor Final - Valor Inicial) / Valor Inicial) × 100
'''

venda22 = int(input('Digite a quantidade de vendas em 2022:'))
venda23 = int(input('Digite a quantidade de vendas em 2023:'))

percentual = ((venda23 - venda22) / venda22) * 100

if percentual > 20:
    print(f'bonificação para o time de vendas. {percentual}')
elif percentual >= 2 and percentual <= 20:
    print(f'pequena bonificação para time de vendas.{percentual}')
elif percentual <= 2 and percentual >= -10:
    print(f'planejamento de políticas de incentivo às vendas.{percentual}')
elif percentual < -10:
    print(f'corte de gastos.{percentual}')
