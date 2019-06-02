/* Jogadores
 * Author: Gabriel Azevedo
 * Creation date: 6/2/2019
 */
MACHINE
    Jogadores
SETS
    JOGADORES = {J1, J2}; RESPOSTA = {sim, nao}   
VARIABLES
    pecasj1, pecasj2, damasj1, damasj2
INVARIANT
    pecasj1 <: (0..11) & 
    pecasj2 <: (0..11) & 
    damasj1 <: pecasj1 & 
    damasj2 <: pecasj2
INITIALISATION
    pecasj1, pecasj2, damasj1, damasj2 := (0..11),(0..11), {}, {}
OPERATIONS
    //Operacao para recuperar o vencedor
    vv <-- declarar_vencedor =
    PRE
        //Algum dos jogadores tem que estar sem peças
        card(pecasj1) = 0 or card(pecasj2) = 0
    THEN
        IF
            card(pecasj1) = 0 
        THEN
            vv := J2
        ELSE
            IF
                card(pecasj2) = 0
            THEN
                vv := J1
            END
        END
    END;
    
    remover_peca(peca, jogador) = 
    PRE
        jogador : JOGADORES &
        peca : (0..11) &
        peca /: damasj1 &
        peca /: damasj2
    THEN
        IF 
            jogador = J1
        THEN
            pecasj1 := pecasj1 - {peca}
        ELSE
            pecasj2 := pecasj2 - {peca}
        END
    END;
    
    remover_dama(dama, jogador) = 
    PRE
        jogador : JOGADORES &
        dama : (0..11) &
        (dama : damasj1 or dama : damasj2)
    THEN
        IF
            jogador = J1 &
            dama : damasj1
        THEN
            damasj1 := damasj1 - {dama} ||
            pecasj1 := pecasj1 - {dama}
        ELSE 
            damasj2 := damasj2 - {dama} ||
            pecasj2 := pecasj2 - {dama}
        END
    END;
    
    criar_dama(peca, jogador) = 
    PRE
        peca:(0..11) & 
        jogador : JOGADORES
    THEN
        IF
            jogador = J1 &
            peca /: damasj1
        THEN
            damasj1 := damasj1 \/ {peca}
        ELSE
            damasj2 := damasj2 \/ {peca}
        END
    END;            
        
END
