/* Tabuleiro
 * Author: sgmgamer
 * Creation date: 03/06/2019
 */
MACHINE
    Tabuleiro
SEES
    Pecas
CONSTANTS
    CASAS
PROPERTIES
    CASAS = (1..8)*(1..8) 
OPERATIONS
    movimento_valido(tabuleiro_completo, peca) =
    PRE
        tabuleiro_completo :  pecasj1 >-> CASAS &
        pecas : tabuleiro_completo
    THEN
        IF 
END