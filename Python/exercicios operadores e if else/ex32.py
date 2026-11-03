'''Um programa deve ser escrito para ler dois números e, em seguida, 
perguntar à pessoa usuária qual operação ele deseja realizar. O resultado da operação deve incluir
 informações sobre o número - se é par ou ímpar, positivo ou negativo e inteiro ou decimal.'''

num1 = float(input("Digite o primeiro numero:"))
num2 = float(input("Digite o segundo numero:"))
opcao = int(input("1 - divisao / 2- multiplicao / 3- soma / 4- sub"))

if opcao == 1:
    resultado = num1 / num2
elif opcao == 2:
    resultado = num1 * num2
elif opcao == 3:
    resultado = num1 + num2
elif opcao == 4:
    resultado = num1 - num2

print(f"Resultado: {resultado}")

if resultado > 0:
    print("Positivo")
else:
    print("Negativo")

if resultado % 2 == 0:
    print("É par")
else:
    print("É impar")

if resultado % 1 == 0:
    print("É inteiro")
else:
    print("É decimal")