#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define WHITE 0
#define GRAY 1
#define BLACK 2

typedef struct NoLista {
	int indice; //num vertice vizinho
	struct NoLista * prox; //ponteiro pro prox da lista
}NoLista;

typedef struct {
	char letra; //nome vertice
	int cor, dist, pred; //atributos bfs: cor, distancia do inicio e quem descobriu
	NoLista * priviz; // guarda o endereco da proxima celula 
}Vertice;

typedef Vertice grafo[5]; //grafo eh array fixo de 5 vertices

typedef struct NoFila {
	int vizinho; 
	struct NoFila * proximo;
}NoFila;

typedef NoFila * fila;

void enfileirar(fila * f, int viz) {
	NoFila * aux = (NoFila *) malloc(sizeof(NoFila)); //aloca memoria
	aux->vizinho = viz;
	aux->proximo = NULL;
	
	//se a fila esta vazia, o novo no eh o inicio
	if (*f == NULL) {
		*f = aux;
	} else {
		NoFila * ultimo = *f;
		while (ultimo->proximo != NULL) {
			ultimo = (NoFila *) ultimo->proximo;
		}
	}
}

int desenfileirar(fila *f) {
	if (*f == NULL) {
		return -1;
	}
	
	int retorno = (*f)->vizinho;
	NoFila * aux = *f;
	
	*f = (*f)->proximo; //move o inicio da fila pro segundo elemento
	
	free(aux);
	return retorno;
}

void inserirVizinho(grafo w, int pos, int viz) {
	NoLista * aux = (NoLista *) malloc(sizeof(NoLista)); //aloca memoria
	aux->indice = viz; //guarda num do vizinho novo
	aux->prox = w[pos].priviz; //o prox do novo vizinho is quem tava no inicio da lista
	w[pos].priviz = aux; // o inicio agora aponta pro novo vizinho
}

void eliminarVizinho(grafo w, int pos, int viz) {
	NoLista * atual = w[pos].priviz; //comeca pelo primeiro vizino
	NoLista * anterior = NULL; //acompanha no anterior pra "religar" a lista pq se apagar so o no do meio a "corrente" quebra
	
	//enquanto atual nao eh nulo, e o indice eh diferente do vizinho, faz a procura
	while (atual != NULL && atual->indice != viz) {
		anterior = atual; //guarda o anterior antes de pular
		atual = atual->prox; //pula pro proximo endereco na memoria
	}
	
	//se encontrou o vizinho
	if (atual != NULL) {
		if (anterior == NULL) { //se for o primeiro da lista
			w[pos].priviz = atual->prox;
		} else { // se for no meio ou fim
			anterior->prox = atual->prox; // pula o atual, liga o anterior no proximo
		}
		free(atual); //desaloca a memoria
	}
}

//funcao gerar script python
void gerarScriptDesenho(grafo w) {
	FILE *f = fopen("desenhar.py", "w");
	fprintf(f, "import networkx as nx\nimport matplotlib.pyplot as plt\nG = nx.DiGraph()\n");
	for(int i=0; i<5; i++) {
		NoLista * v = w[i].priviz;
		while(v) {
			fprintf(f, "G.add_edge('%c', '%c')\n", w[i].letra, w[v->indice].letra);
			v = v->prox;
		}
	}
	fprintf(f, "nx.draw(G, with_labels=True, node_color='lightblue'); plt.show()");
	fclose(f);
	printf("[Python] Script 'desenhar.py' feito agr rodar com: python desenhar.py\n");
}

int distanciaEntre(grafo w, int origem, int destino) {
	for(int i=0; i<5; i++) {
		w[i].cor = WHITE; w[i].dist = 9999;
	}
	
	fila Q = NULL;
	w[origem].cor = GRAY;
	w[origem].dist = 0;
	enfileirar(&Q, origem);
	
	while (Q != NULL) {
		int u = desenfileirar(&Q);
		NoLista * v = w[u].priviz;
		while(v != NULL) {
			if (w[v->indice].cor == WHITE) {
				w[v->indice].cor = GRAY;
				w[v->indice].dist = w[u].dist + 1;
				enfileirar(&Q, v->indice);
			}
			v = v->prox;
		}
		w[u].cor = BLACK;
	}
	return w[destino].dist;
}

void salvarGrafo(grafo w, int tam) {
	FILE *f = fopen("grafo.csv", "w"); //abre arquivo pra escrever por isso o w de writing
	for(int i=0; i<tam; i++) {
		fprintf(f, "%c", w[i].letra); //salva letra do vertice com printf de arquivo(file) fprintf
		NoLista * v = w[i].priviz; //comeca a percorrer a lista
		while(v) {
			fprintf(f, ";%d", v->indice); //salva vizinhos separados por virgula
			v = v->prox;
		}
		fprintf(f, "\n"); //nova linha pro prox vertice
	}
	fclose(f); //fecha arquivo pra salvar as mudancas
}

void mostrarGrafo(grafo w) {
	for (int i=0; i < 5; i++) {
		printf("\nVertice %c:", w[i].letra);
		NoLista * viz = w[i].priviz;
		while (viz != NULL) {
			printf(" --> %d ", viz->indice);
			viz = viz->prox;
		}
	}
	printf("\n");
}

void desenharGrafo(grafo w) {
	printf("Feche a janela para continuar");
	system("python desenhar.py");
	system("cls");
}

void menorDistanciaMenu(grafo w){
	int origem, destino, distancia;
	
	printf("---Menor Distancia entre 2 Vertices ---\n");
	printf("\nPonto Origem: ");
	scanf("%d",&origem);
	printf("Ponto Destino: ");
	scanf("%d",&destino);
	distancia = distanciaEntre(w,origem,destino);
	printf("\nA distancia entre os pontos eh: %d\n\n", distancia);
	fflush(stdin);
	printf("\nPressione [Enter] para continuar");
	getchar();
	system("cls");
}

void inserirVizinhoMenu(grafo w) {
	int pos, viz;
	printf("--- Inserir vizinho ---\n\n");
	printf("Posicao: ");
	scanf("%d",&pos);
	printf("Vizinho: ");
	scanf("%d",&viz);
	inserirVizinho(w, pos, viz);
	system("cls");
};

void eliminarVizinhoMenu(grafo w) {
	int pos, viz;
	printf("--- Eliminar vizinho ---\n\n");
	printf("Posicao: ");
	scanf("%d",&pos);
	printf("Vizinho: ");
	scanf("%d",&viz);
	eliminarVizinho(w, pos, viz);
	system("cls");
}

void menu(grafo w){
	int opc;
	while(1) {
		printf("--- Selecione uma opcao ---\n");
		printf("\t1. Inserir Vizinho\n");
		printf("\t2. Eliminar Vizinho\n");
		printf("\t3. Salvar Grafo em Disco\n");
		printf("\t4. Apresentar o Grafo na Tela\n");
		printf("\t5. Desenhar o Grafo\n");
		printf("\t6. Menor Distancia entre 2 Vertices\n");
		printf("\t7. Sair\n");
		printf("\n<1/2/3/4/5/6/7>: ");
		scanf("%d",&opc);
		system("cls");
		fflush(stdin);
	switch (opc)
	{
	case 1:
		inserirVizinhoMenu(w);
		break;
	case 2:
		eliminarVizinhoMenu(w);
		break;
	case 3: // Fazer isso funfar pq n ta.
		// salvarGrafo(w,sizeof(w));
		printf("Grafo Salvo\nPressione [Enter] para continuar");
		getchar();
		system("cls");
		break;
	case 4:
		mostrarGrafo(w);
		printf("\nPressione [Enter] para continuar");
		getchar();
		system("cls");
		break;
	case 5:
		desenharGrafo(w);
		break;
	case 6: // Mostrar quando não tem conexão.
		menorDistanciaMenu(w);
		break;
	case 7:
		return;		
	default:
		printf("Opcao Invalida\n");
		break;
	}
	}
}

int main() {
	grafo g = {
	{'A', 0, 9999, -1, NULL}, 
	{'B', 0, 9999, -1, NULL}, 
	{'C', 0, 9999, -1, NULL},
	{'D', 0, 9999, -1, NULL},
	{'E', 0, 9999, -1, NULL}
	};
	
	// inserirVizinho(g, 0, 1); // a -> b
	// inserirVizinho(g, 0, 2); // a -> c
	// inserirVizinho(g, 2, 4); // c -> e
	
	// printf("--- grafo ---");
	// mostrarGrafo(g);
	
	// printf("\nDistancia de A(0) ate E(4): %d", distanciaEntre(g, 0, 4));
	
	// mostrarGrafo(g);
	// salvarGrafo(g, 5);
	// gerarScriptDesenho(g);
	// system("python desenhar.py");

	// return 0;
	menu(g);
}
