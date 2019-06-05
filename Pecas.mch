/* Pecas
 * Author: sgmgamer
 * Creation date: 03/06/2019
 */
MACHINE
    Pecas
SEES
    Jogadores
SETS
    RESPOSTA = {sim, nao}   
VARIABLES
    pecasj1, pecasj2, 
    damasj1, damasj2, 
    peca_atual
INVARIANT
    pecasj1 <: (0..11) & pecasj1 <: NAT &
    pecasj2 <: (0..11) & pecasj2 <: NAT &
    damasj1 <: pecasj1 & damasj2 <: pecasj2 &
    peca_atual : (-1..11)
INITIALISATION
    pecasj1, pecasj2, damasj1, damasj2, current_piece := (0..11),(0..11), {}, {}, -1
OPERATIONS
    //Operacao para recuperar o vencedor
    vv <-- declarar_vencedor =
    PRE
        card(pecasj1) = 0 or 
        card(pecasj2) = 0
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
    //remove uma peça que foi comida
    remover_peca(peca, jogador) = 
    PRE
        jogador : JOGADORES &
        peca : (0..11) & peca : NAT &
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
    //remove uma dama que foi comida
    remover_dama(dama, jogador) = 
    PRE
        jogador : JOGADORES &
        dama : (0..11) & dama : NAT &
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
    //transforma a peça numa dama
    criar_dama(peca, jogador) = 
    PRE
        peca : (0..11) & peca : NAT &
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
    //verifica se a peca é uma dama
    eh_dama <-- verifica_dama(peca, jogador)=
    PRE 
        peca:(0..11) & 
        jogador:JOGADORES 
    THEN
        IF 
            (jogador = J1 & peca:pecasj1 & peca:damasj1) or 
            (jogador = J2 & peca:pecasj2 & peca:damasj2)
        THEN 
            eh_dama := sim
        ELSE
            eh_dama := nao
        END 
    END;
END