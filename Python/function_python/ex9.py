gols_marcados = [2, 1, 3, 1, 0]
gols_sofridos = [1, 2, 2, 1, 3]

def calcula_pontos(gols_marcados, gols_sofridos):
    pontos = 0
    for marcados, sofridos in zip(gols_marcados, gols_sofridos):
        if marcados > sofridos:
            pontos += 3
        elif marcados == sofridos:
            pontos += 1
        # derrota: soma 0, não precisa de else

    pontos_maximos = 3 * len(gols_marcados)
    aproveitamento = pontos / pontos_maximos * 100
    return pontos, aproveitamento

pontos, aproveitamento = calcula_pontos(gols_marcados, gols_sofridos)
print(f"Pontos: {pontos} | Aproveitamento: {aproveitamento:.2f}%")