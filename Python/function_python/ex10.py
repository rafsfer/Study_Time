cidades = ["Salvador", "Fortaleza", "Natal", "Aracaju"]
distancias = [850, 800, 300, 550]   # km, só ida
passeios_dia = [200, 400, 250, 300] # R$ por dia

DIARIA_HOTEL = 150
KM_POR_LITRO = 14
PRECO_LITRO = 5

def gasto_hotel(dias):
    return DIARIA_HOTEL * dias

def gasto_gasolina(distancia_ida):
    distancia_total = distancia_ida * 2   # ida e volta
    litros = distancia_total / KM_POR_LITRO
    return litros * PRECO_LITRO

def gasto_passeio(gasto_diario, dias):
    return gasto_diario * dias

# Teste: 3 dias em Salvador
dias = 3
i = cidades.index("Salvador")

hotel = gasto_hotel(dias)
gasolina = gasto_gasolina(distancias[i])
passeio = gasto_passeio(passeios_dia[i], dias)
total = hotel + gasolina + passeio

print(f"Hotel: R$ {hotel:.2f}")
print(f"Gasolina: R$ {gasolina:.2f}")
print(f"Passeio e alimentação: R$ {passeio:.2f}")
print(f"Total: R$ {total:.2f}")