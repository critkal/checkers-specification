/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Damas.h"

/* Clause SEES */
#include "Jogadores.h"
#include "Tabuleiro.h"

/* Clause IMPORTS */
#include "Pecas.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Damas__linhaj1[12];
static int32_t Damas__colunaj1[12];
static int32_t Damas__linhaj2[12];
static int32_t Damas__colunaj2[12];
static int32_t Damas__peca_atual;
static int32_t Damas__array_atual[4];
static Jogadores__JOGADORES Damas__jogador_atual;
/* Clause INITIALISATION */
void Damas__INITIALISATION(void)
{
    
    unsigned int i = 0;
    Pecas__INITIALISATION();
    Damas__jogador_atual = Jogadores__J1;
    for(i = 0; i <= 3;i++)
    {
        Damas__array_atual[i] = 0;
    }
    Damas__peca_atual = -1;
    {
        int32_t pc;
        int32_t ll;
        int32_t cc;
        int32_t llm;
        int32_t ccm;
        int32_t ii;
        
        pc = 0;
        ll = 1;
        cc = 1;
        llm = -1;
        ccm = -1;
        ii = 0;
        while(((ll) <= (3)) &&
        ((pc) < (12)))
        {
            cc = 1;
            while(((cc) <= (8)) &&
            ((pc) < (12)))
            {
                llm = ll % 2;
                ccm = cc % 2;
                if((((llm == 0) &&
                        (ccm == 0))) ||
                (((llm == 1) &&
                        (ccm == 1))))
                {
                    Damas__linhaj1[pc] = ll;
                    Damas__colunaj1[pc] = cc;
                    pc = pc+1;
                }
                cc = cc+1;
            }
            ll = ll+1;
        }
        pc = 0;
        ll = 8;
        cc = 1;
        while(((ll) >= (6)) &&
        ((pc) < (12)))
        {
            cc = 1;
            while(((cc) <= (8)) &&
            ((pc) < (12)))
            {
                llm = ll % 2;
                ccm = cc % 2;
                if((((llm == 0) &&
                        (ccm == 0))) ||
                (((llm == 1) &&
                        (ccm == 1))))
                {
                    Damas__linhaj2[pc] = ll;
                    Damas__colunaj2[pc] = cc;
                    pc = pc+1;
                }
                cc = cc+1;
            }
            ll = ll-1;
        }
    }
}

/* Clause OPERATIONS */

void Damas__move(int32_t linha, int32_t coluna)
{
    unsigned int i = 0;
    {
        if(((((linha) >= (1)) &&
                ((linha) <= (8))) &&
            ((coluna) >= (1))) &&
        ((coluna) <= (8)))
        {
            for(i = 0; i <= 3;i++)
            {
                Damas__array_atual[i] = 0;
            }
            if(((Damas__jogador_atual == Jogadores__J1) &&
                ((Damas__peca_atual) >= (0))) &&
            ((Damas__peca_atual) <= (11)))
            {
                Damas__linhaj1[Damas__peca_atual] = linha;
                Damas__colunaj1[Damas__peca_atual] = coluna;
                Damas__jogador_atual = Jogadores__J2;
                if(linha == 8)
                {
                    Pecas__criar_dama(Damas__peca_atual, Damas__jogador_atual);
                }
            }
            else
            {
                if(((Damas__jogador_atual == Jogadores__J2) &&
                    ((Damas__peca_atual) >= (0))) &&
                ((Damas__peca_atual) <= (11)))
                {
                    Damas__linhaj2[Damas__peca_atual] = linha;
                    Damas__colunaj2[Damas__peca_atual] = coluna;
                    Damas__jogador_atual = Jogadores__J1;
                    if(linha == 1)
                    {
                        Pecas__criar_dama(Damas__peca_atual, Damas__jogador_atual);
                    }
                }
            }
            Damas__peca_atual = -1;
        }
    }
}

void Damas__movimentos_validos(int32_t peca, int32_t *opcoes)
{
    unsigned int i = 0;
    {
        for(i = 0; i <= 3;i++)
        {
            opcoes[i] = 0;
        }
        ;
    }
}

void Damas__comer_peca(int32_t peca, int32_t alvo)
{
    ;
}

