#include <stdio.h>
#include <malloc.h>

#define WHITE 0 
#define GRAY  1 
#define BLACK 2 


//  ---------   FILA -----------
typedef struct {
	int vizinho ;
	struct NoFila * proximo ;
} NoFila ;

typedef NoFila * fila ;

void enfileirar( fila * f, int viz ) {
	NoFila * aux = (NoFila *) malloc(sizeof(NoFila )) ;
	aux->vizinho = viz ;
	aux->proximo = NULL ;
	if ( *f == NULL)  // fila estava vazia
	      *f = aux ;
	else {
		NoFila * ultimo = *f ;
		while ( ultimo->proximo != NULL )
			ultimo = (NoFila *) ultimo->proximo ;
		ultimo->proximo = (struct NoFila *) aux ;
	}
}


int desenfileirar (fila *f) {
	if ( *f == NULL)  // fila estava vazia
		return -1 ;
	else {
		int retorno = (*f)->vizinho ;
		NoFila * aux = *f ;
		*f = (fila)   (*f)->proximo ;
		free(aux);
		return retorno ;
	}

}


void mostrarFila ( fila f ) {
   NoFila *  iterator = (NoFila *)  f ;
   while ( iterator != NULL ) {
	   printf("\t%d", iterator->vizinho) ;
	   iterator = (NoFila *)  iterator->proximo ;
   }
   printf("\n") ;
}

//  ---------   GRAFO -----------
typedef struct {
	int indice ;
	struct NoLista * prox ;
} NoLista ; 

typedef struct {
	char letra ;
	int  cor ;
	int  dist ; // distancia
	int  pred ; // predecessor
	NoLista * priviz ; // primeiro vizinho
} Vertice ;

typedef Vertice grafo[5] ;

void inserirVizinho ( grafo w, int pos, int viz ) {
   NoLista * aux = (NoLista *) malloc(sizeof(NoLista)) ;
   aux->indice = viz ;
   aux->prox = NULL ;
   if ( w[pos].priviz == NULL )  
	   w[pos].priviz = aux ;
   else { 
	   NoLista * ultimo = w[pos].priviz ;
	   while ( ultimo->prox != NULL )
		   ultimo = (NoLista *) ultimo->prox ;
	   ultimo->prox = (struct NoLista *) aux ;
   }
}

void mostrarGrafo ( grafo w ) {
	// TODO : mostrar cor, dist�ncia e predecessor
   int i,k ;
   NoLista * viz ;
   for (i=0; i < 5 ; i++) {
      printf("\n %c ( %2d, %2d, %2d ) ", w[i].letra,
 	w[i].cor, w[i].pred, w[i].dist  ) ;
      viz = w[i].priviz ;
      while ( viz != NULL ) {
	      k = viz->indice ;
              printf("\t --> %c ", w[k].letra) ;
	      viz = (NoLista *) viz->prox ;
      }
   }
   printf("\n");
}


void BFS (grafo w, int s ) {
  int u, k ;
  for (u=0; u< 5; u++ ) {
	  w[u].cor =  WHITE ;
	  w[u].pred = -1 ;
	  w[u].dist = 9999 ; // infinito
  };
  w[s].cor =  GRAY ;
  w[s].pred = -1 ;
  w[s].dist = 0; 
  // declara e inicializa a fila Q
  fila Q = NULL ; 
  enfileirar(&Q, s) ;
  while ( Q != NULL ) {
	int u = desenfileirar(&Q) ;
	NoLista * v = w[u].priviz ;
	 // k = v->indice ;    NO LUGAR ERRADO
	while ( v != NULL ) {
	   k = v->indice ;     // NO LUGAR CERTO 
	   if ( w[k].cor == WHITE ) {
  	      w[k].cor = GRAY; 
  	      w[k].dist = w[u].dist + 1; 
  	      w[k].pred = u ; 
  	      enfileirar(&Q, k) ;
	   }
	   v = ( NoLista *) v->prox ;
	}
  	w[u].cor = BLACK; 
  }
}


void main() {
   /*
   // teste da fila 
   int u ;
   fila doPao = NULL ;  // inicializar fila
   enfileirar(&doPao, 4) ;
   enfileirar(&doPao, 9) ;
   enfileirar(&doPao, 7) ;
   u = desenfileirar(&doPao) ;
   mostrarFila(doPao) ;
   */

   // ----   DECLARA��O DO GRAFO  -------- 
   grafo g = {
	{ 'A', 0,0,0, NULL }, { 'B',0,0,0,  NULL }, { 'C', 0,0,0, NULL },
	{ 'D',0,0,0,  NULL }, { 'E', 0,0,0, NULL }
	};
   inserirVizinho(g, 0, 1) ; 
   inserirVizinho(g, 0, 2) ; 
   inserirVizinho(g, 0, 4) ; 

   //inserirVizinho(g, 1, 0) ; 
   inserirVizinho(g, 1, 2) ; 
   inserirVizinho(g, 1, 3) ; 

   //inserirVizinho(g, 2, 0) ; 
   //inserirVizinho(g, 2, 1) ; 

   //inserirVizinho(g, 3, 1) ; 
   inserirVizinho(g, 3, 4) ; 

   //inserirVizinho(g, 4, 0) ; 
   //inserirVizinho(g, 4, 3) ; 
   // ---------------------------------------------------------------
   //
   mostrarGrafo(g) ;
   BFS(g, 0 ) ;  // executa BFS a partir do v�rtice 0
   mostrarGrafo(g) ;

}

