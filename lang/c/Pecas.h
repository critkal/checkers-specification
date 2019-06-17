#ifndef _Pecas_h
#define _Pecas_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Jogadores.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Pecas__sim,
    Pecas__nao
    
} Pecas__RESPOSTA;
#define Pecas__RESPOSTA__max 2

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Pecas__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Pecas__declarar_vencedor(Jogadores__JOGADORES *vv);
extern void Pecas__remover_peca(int32_t peca, Jogadores__JOGADORES jogador);
extern void Pecas__remover_dama(int32_t dama, Jogadores__JOGADORES jogador);
extern void Pecas__criar_dama(int32_t peca, Jogadores__JOGADORES jogador);
extern void Pecas__verifica_dama(int32_t peca, Jogadores__JOGADORES jogador, Pecas__RESPOSTA *eh_dama);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Pecas_h */
