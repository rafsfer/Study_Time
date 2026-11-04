/* Programa criado em 22/set/2026 para a 1a
 * aula de ORI sobre GRAFOS.
 * Vamos implementar um grafo, usando listas
 * de adjacência
 * implementar DFS
 * 1 : 2,5
 * 2 : 1,3,4,5
 * onde ->3 : 2,4
 * 4 : 2,3,5
 * 5 : 1,2,4
 * */

#include <stdio.h>
#include <malloc.h>

#define QTD 5
#define BRANCO 0
#define CINZA 1
#define PRETO 2

int cor[QTD + 1];
int pi[QTD + 1];
int d[QTD + 1];
int f[QTD + 1];
int tempo;

typedef struct {
   int numero ;
   struct NoLisViz * prox ;   // proximo
} NoLisViz ;

typedef NoLisViz * grafo[QTD+1] ;

void initGrafo( grafo g ) {
  int i ;
  for (i = 1; i <= QTD ; i++ )
	  g[i] = NULL ;
}

// insere vizinho na posição onde do grafo g
void insertViz ( grafo g, int onde, int viz ) {
  NoLisViz * vizinho = (NoLisViz *) malloc(sizeof(NoLisViz))  ;
  vizinho->numero = viz ;
  vizinho->prox  = NULL ;
  if ( g[onde] == NULL ) 
     g[onde] = vizinho ;
  else {
	NoLisViz * ultimo = (NoLisViz *) g[onde] ;
	while ( ultimo->prox != NULL )
		ultimo = (NoLisViz *) ultimo->prox ;
	ultimo->prox = (struct NoLisViz *) vizinho ;
  }
}

void showGrafo ( grafo g) {
  int i ;
  for (i = 1; i <= QTD ; i++ ) {
	printf("\nVértice %d : ", i) ;
	NoLisViz * v = g[i] ;
	while ( v != NULL )  {
	   printf("\t %d", v->numero) ;
	   v = (NoLisViz *) v->prox ;
	}
  }
  printf("\n");
}

void dfs_visit(grafo g, int u) {
    tempo = tempo + 1;
    d[u] = tempo;
    cor[u] = CINZA;

    NoLisViz *v = g[u];
    while (v != NULL) {
        if (cor[v->numero] == BRANCO) {
            pi[v->numero] = u;
            dfs_visit(g, v->numero);
        }
        v = (NoLisViz *) v->prox;
    }

    cor[u] = PRETO;
    tempo = tempo + 1;
    f[u] = tempo;
}

void dfs(grafo g) {
    int u;
    for (u = 1; u <= QTD; u++) {
        cor[u] = BRANCO;
        pi[u] = 0; // NIL
    }
    tempo = 0;
    for (u = 1; u <= QTD; u++) {
        if (cor[u] == BRANCO) {
            dfs_visit(g, u);
        }
    }
}


void main() {
   grafo jambalaya ;
   initGrafo (jambalaya) ;
   insertViz (jambalaya,1,2) ;
   insertViz (jambalaya,1,5) ;
   insertViz (jambalaya,2,1) ;
   insertViz (jambalaya,2,3) ;
   insertViz (jambalaya,2,4) ;
   insertViz (jambalaya,2,5) ;
   insertViz (jambalaya,3,2) ;
   insertViz (jambalaya,3,4) ;
   insertViz (jambalaya,4,2) ;
   insertViz (jambalaya,4,3) ;
   insertViz (jambalaya,4,5) ;
   insertViz (jambalaya,5,1) ;
   insertViz (jambalaya,5,2) ;
   insertViz (jambalaya,5,4) ;
   showGrafo (jambalaya) ;
}