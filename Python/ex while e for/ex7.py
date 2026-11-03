''' Os números primos possuem várias aplicações dentro da Ciência
 de Dados em criptografia e segurança, por exemplo. Um número primo é aquele
   que é divisível apenas por um e por ele mesmo. Assim, faça um programa que 
   peça um número inteiro e determine se ele é ou não um número primo.'''


num = int(input('Digite um numero e veja se ele é primo:'))
primo = True

if num < 2:
    primo = False
else:
    for i in range(2,num):
        if num % i == 0:
            primo = False
            break

if primo:
    print(num, 'é número primo')
else:
    print(num, 'não é número primo')


