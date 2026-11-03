'''Com os mesmos dados da questão anterior, defina quantas compras foram realizadas 
acima de 3000 reais e calcule a porcentagem quanto ao total de compras.
[2172.54, 3701.35, 3518.09, 3456.61, 3249.38, 2840.82, 3891.45, 3075.26, 2317.64, 3219.08]'''

gastos = [2172.54, 3701.35, 3518.09, 3456.61, 3249.38, 2840.82, 3891.45, 3075.26, 2317.64, 3219.08]
qtd = 0
somatoria = sum(gastos)
lista = []


for i in gastos:
    if i > 3000:
        qtd += 1
        lista.append(i)
        
total = len(gastos)
porcentagem = (qtd * 100) / total

print (qtd)
print (porcentagem,'%')