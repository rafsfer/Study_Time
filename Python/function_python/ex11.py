frase = input("Digite uma frase: ")

for pontuacao in [",", ".", "!", "?"]:
    frase = frase.replace(pontuacao, " ")

palavras = frase.split()
filtradas = list(filter(lambda p: len(p) >= 5, palavras))

print(filtradas)