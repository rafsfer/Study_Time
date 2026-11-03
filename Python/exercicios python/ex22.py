'''Crie um código que solicite uma frase à pessoa usuária e imprima a 
mesma frase com todas as vogais “a” trocadas pela caractere “@”.'''

frase = input("Digite a sua frase:")
frase = frase.replace('a',chr(64))
print(frase)