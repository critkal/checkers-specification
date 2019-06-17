#ifndef _Jogadores_h
#define _Jogadores_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Jogadores__J1,
    Jogadores__J2,
    Jogadores__NOBODY
    
} Jogadores__JOGADORES;
#define Jogadores__JOGADORES__max 3

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Jogadores__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Jogadores_h */
