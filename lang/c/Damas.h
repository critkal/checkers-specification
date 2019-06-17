#ifndef _Damas_h
#define _Damas_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Jogadores.h"
#include "Tabuleiro.h"

/* Clause INCLUDES */
#include "Pecas.h"

/* Clause IMPORTS */
#include "Pecas.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Damas__sim,
    Damas__nao
    
} Damas__RESPOSTA;
#define Damas__RESPOSTA__max 2

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Damas__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Damas__move(int32_t linha, int32_t coluna);
extern void Damas__movimentos_validos(int32_t peca, int32_t *opcoes);
extern void Damas__comer_peca(int32_t peca, int32_t alvo);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Damas_h */
