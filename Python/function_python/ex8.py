nomes = ["joão", "MaRia", "JOSÉ"]
sobrenomes = ["SILVA", "souza", "Tavares"]

nome = list(map(str.upper,nomes)) #upper para é para cada string
sobrenome =list(map(str.upper,sobrenomes))

resultado = list(map(lambda n, s: n + " " + s, nome,sobrenome))
print(resultado)