'''Crie um código que solicite uma frase à pessoa usuária e
imprima a mesma frase com todas as consoantes “s” trocadas pelo caractere “$'''

frase = input("Digite sua frase")
frase = frase.replace('s', '$')
print (frase)