/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Pecas.h"

/* Clause SEES */
#include "Jogadores.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool Pecas__pecasj1_i[12];
static bool Pecas__pecasj2_i[12];
static bool Pecas__damasj1_i[12];
static bool Pecas__damasj2_i[12];
static bool Pecas__winner[3];
/* Clause INITIALISATION */
void Pecas__INITIALISATION(void)
{
    
    {
        int32_t indice;
        
        indice = 0;
        while((indice) <= (11))
        {
            Pecas__pecasj1_i[indice] = true;
            Pecas__pecasj2_i[indice] = true;
            Pecas__damasj1_i[indice] = false;
            Pecas__damasj2_i[indice] = false;
            indice = indice+1;
        }
    }
    Pecas__winner[0] = true;
    Pecas__winner[1] = false;
    Pecas__winner[2] = false;
}

/* Clause OPERATIONS */

void Pecas__declarar_vencedor(Jogadores__JOGADORES *vv)
{
    (*vv) = Jogadores__NOBODY;
    {
        int32_t ij1;
        int32_t ij2;
        bool v1;
        bool v2;
        
        ij1 = 0;
        ij2 = 0;
        v1 = Pecas__winner[1];
        v2 = Pecas__winner[2];
        while(((ij1) < (12)) &&
        (v1 == false))
        {
            {
                bool tt;
                
                tt = Pecas__pecasj1_i[ij1];
                if(tt == true)
                {
                    Pecas__winner[1] = true;
                }
            }
            ij1 = ij1+1;
        }
        if(v1 == false)
        {
            (*vv) = Jogadores__J2;
            Pecas__winner[2] = true;
            Pecas__winner[0] = false;
        }
        else
        {
            while((((ij2) < (12)) &&
                (v2 == false)))
            {
                {
                    bool rr;
                    
                    rr = Pecas__pecasj2_i[ij2];
                    if(rr == true)
                    {
                        Pecas__winner[2] = true;
                    }
                }
                ij2 = ij2+1;
            }
            if(v2 == false)
            {
                (*vv) = Jogadores__J1;
                Pecas__winner[1] = true;
                Pecas__winner[0] = false;
            }
            else
            {
                Pecas__winner[1] = false;
                Pecas__winner[2] = false;
            }
        }
    }
}

void Pecas__remover_peca(int32_t peca, Jogadores__JOGADORES jogador)
{
    {
        bool dama1;
        bool dama2;
        
        dama1 = Pecas__damasj1_i[peca];
        dama2 = Pecas__damasj2_i[peca];
        if((((((peca) >= (0)) &&
                    ((peca) <= (11))) &&
                (dama1 == false)) &&
            (dama2 == false)) &&
        (((jogador == Jogadores__J1) ||
                (jogador == Jogadores__J2))))
        {
            if(jogador == Jogadores__J1)
            {
                Pecas__pecasj1_i[peca] = false;
            }
            else
            {
                Pecas__pecasj2_i[peca] = false;
            }
        }
    }
}

void Pecas__remover_dama(int32_t dama, Jogadores__JOGADORES jogador)
{
    {
        bool dama1;
        bool dama2;
        
        dama1 = Pecas__damasj1_i[dama];
        dama2 = Pecas__damasj2_i[dama];
        if((((((dama) >= (0)) &&
                    ((dama) <= (11))) &&
                (dama1 == false)) &&
            (dama2 == false)) &&
        (((jogador == Jogadores__J1) ||
                (jogador == Jogadores__J2))))
        {
            if(jogador == Jogadores__J1)
            {
                Pecas__damasj1_i[dama] = false;
            }
            else
            {
                Pecas__damasj2_i[dama] = false;
            }
        }
    }
}

void Pecas__criar_dama(int32_t peca, Jogadores__JOGADORES jogador)
{
    if((((peca) >= (0)) &&
        ((peca) <= (11))) &&
    (((jogador == Jogadores__J1) ||
            (jogador == Jogadores__J2))))
    {
        {
            bool peca1;
            bool peca2;
            bool dama1;
            bool dama2;
            
            peca1 = Pecas__pecasj1_i[peca];
            dama1 = Pecas__damasj1_i[peca];
            peca2 = Pecas__pecasj2_i[peca];
            dama2 = Pecas__damasj2_i[peca];
            if(((jogador == Jogadores__J1) &&
                (peca1 == true)) &&
            (dama1 == false))
            {
                Pecas__damasj1_i[peca] = true;
                Pecas__pecasj1_i[peca] = false;
            }
            else
            {
                if(((jogador == Jogadores__J2) &&
                    (peca2 == true)) &&
                (dama2 == false))
                {
                    Pecas__damasj2_i[peca] = true;
                    Pecas__pecasj2_i[peca] = false;
                }
            }
        }
    }
}

void Pecas__verifica_dama(int32_t peca, Jogadores__JOGADORES jogador, Pecas__RESPOSTA *eh_dama)
{
    (*eh_dama) = Pecas__nao;
    if((((peca) >= (0)) &&
        ((peca) <= (11))) &&
    (((jogador == Jogadores__J1) ||
            (jogador == Jogadores__J2))))
    {
        {
            bool peca1;
            bool peca2;
            bool dama1;
            bool dama2;
            
            peca1 = Pecas__pecasj1_i[peca];
            peca2 = Pecas__pecasj2_i[peca];
            dama1 = Pecas__damasj1_i[peca];
            dama2 = Pecas__damasj2_i[peca];
            if(((((jogador == Jogadores__J1) &&
                        (peca1 == true)) &&
                    (dama1 == true))) ||
            ((((jogador == Jogadores__J2) &&
                        (peca2 == true)) &&
                    (dama2 == true))))
            {
                (*eh_dama) = Pecas__sim;
            }
            else
            {
                (*eh_dama) = Pecas__nao;
            }
        }
    }
}

