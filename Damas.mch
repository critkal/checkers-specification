/* Damas
 * Author: sgmgamer
 * Creation date: 03/06/2019
 */
MACHINE
    Damas
INCLUDES
    Pecas
SEES
    Jogadores, Tabuleiro
VARIABLES
    posicoes1, posicoes2, jogador_da_vez
INVARIANT
    posicoes1 : pecasj1 >-> CASAS & 
    posicoes2 : pecasj2 >-> CASAS &
    jogador_da_vez : JOGADORES
INITIALISATION
    posicoes1, posicoes2 := 
        {0 |-> (1,1), 1 |-> (1,3), 2 |-> (1,5), 3 |-> (1,7),
        4 |-> (2,2), 5 |-> (2,4), 6 |-> (2,6), 7 |-> (2,8),
        8 |-> (3,1), 9 |-> (3,3), 10 |-> (3,5), 11 |-> (3,7)},
        {0 |-> (8,2), 1 |-> (8,4), 2 |-> (8,6), 3 |-> (8,8),
        4 |-> (7,1), 5 |-> (7,3), 6 |-> (7,5), 7 |-> (7,7),
        8 |-> (6,2), 9 |-> (6,4), 10 |-> (6,6), 11 |-> (6,8)} ||
    jogador := J1
OPERATIONS
    mover_peca(peca, jogador, posicao) =
    PRE 
        jogador : JOGADORES &
        peca : (0..11) &
        peca : pecasj1 or peca: pecasj2 &
        posicao : CASAS
    THEN
        IF 
            jogador = J1 & peca : pecasj1
        THEN
            //todo
        END
    END
END
