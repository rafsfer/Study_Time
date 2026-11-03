'''Para crias Listas utilizo
lista = ['string', decimal, float ...]
para verificar qual o dado da minha lista utilizo
lista[0] de acordo cm a minha posição
listas sao capazes de serem lidas elemento por elemento
utilizanddo o for
for elemento in lista:
    print(elemento)
    para substituição de valores aramzenados na lista
    utilizo lista[0] = novo valor
    
Mesmo assim, é possível transformar uma string em uma lista através do método split(). Esse método separa a string em uma lista de strings, usando um delimitador especificado entre parênteses. Esse delimitador precisa ser uma string. Como exemplo, vamos transformar a string em lista separando-a cada vez que aparece o ponto de interrogação 
duvida = 'Quem veio antes? O ovo? Ou foi a serpente?'
lista_palavras = duvida.split('?')
print(lista_palavras)

O contrário também acontece, pois podemos transformar uma lista em uma string através do método join(). Para usar a função, precisamos definir o caractere unificador que será utilizado para unir os elementos da lista, formando a string. Em seguida, usamos o método join passando a lista como argumento. Vamos fazer um exemplo com uma lista contendo o resultado de algumas misturas de cores primárias em tintas:
misturas = ['Tintas: vermelho, azul e amarelo',

            'Verde: mistura de azul e amarelo',

            'Laranja: mistura de vermelho e amarelo',

            'Roxo: mistura de vermelho e azul']
unificador = '. '
string_misturas = unificador.join(misturas)
print(string_misturas)'''