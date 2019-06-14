/* Damas
 * Author: Gabriel Azevedo
 * Creation date: 03/06/2019
 */
MACHINE
    Damas
INCLUDES
    Pecas
SEES
    Jogadores, Tabuleiro
VARIABLES
    posicoes1, posicoes2, 
    jogador_da_vez, 
    array_auxiliar, 
    peca_atual
INVARIANT
    posicoes1 : pecasj1 >-> (LINHAS * COLUNAS) & 
    posicoes2 : pecasj2 >-> (LINHAS * COLUNAS) &
    jogador_da_vez : JOGADORES &
    array_auxiliar : (0..3) --> (0..8)  &
    peca_atual : (-1..11)
INITIALISATION
    posicoes1, posicoes2 := 
        {0 |-> (1,1), 1 |-> (1,3), 2 |-> (1,5), 3 |-> (1,7),
        4 |-> (2,2), 5 |-> (2,4), 6 |-> (2,6), 7 |-> (2,8),
        8 |-> (3,1), 9 |-> (3,3), 10 |-> (3,5), 11 |-> (3,7)},
        {0 |-> (8,2), 1 |-> (8,4), 2 |-> (8,6), 3 |-> (8,8),
        4 |-> (7,1), 5 |-> (7,3), 6 |-> (7,5), 7 |-> (7,7),
        8 |-> (6,2), 9 |-> (6,4), 10 |-> (6,6), 11 |-> (6,8)} ||
        jogador_da_vez, peca_atual := J1, -1 ||
        array_auxiliar := (0..3) * {0}
OPERATIONS
    move(linha,coluna) =
    PRE peca_atual : (0..11) & linha : (1..8) & coluna : (1..8) & (linha = array_auxiliar(0) or linha = array_auxiliar(2)) & (coluna = array_auxiliar(1) or coluna = array_auxiliar(3))
    THEN  array_auxiliar := (0..3) * {0} ||
        IF jogador_da_vez = J1 & peca_atual : pecasj1
        THEN posicoes1 := posicoes1 <+ { peca_atual |-> (linha,coluna)} || jogador_da_vez := J2 ||
            IF linha = 8
            THEN criar_dama(peca_atual, jogador_da_vez) 
            END
        ELSIF jogador_da_vez = J2 & peca_atual : pecasj2
        THEN posicoes2 := posicoes2 <+ { peca_atual |-> (linha,coluna)} || jogador_da_vez := J1 ||
            IF linha = 1
            THEN criar_dama(peca_atual, jogador_da_vez) 
            END
        END ||
        peca_atual := -1  
    END;

    opcoes <-- movimentos_validos(peca) =
    PRE peca : (0..11)
    THEN 
        peca_atual := peca ||
        ANY xx, yy 
        WHERE 
            xx = posicoes1(peca) &
            yy = posicoes2(peca)
        THEN
            //Se for o jogador 1
            IF 
                jogador_da_vez = J1 &
                peca /: damasj1 &
                peca : pecasj1
            THEN
                ANY auxiliar 
                WHERE auxiliar : (0..3) --> (0..8) &
                    (
                        (prj2(NAT, NAT)(xx) = 1 &                                                     
                        (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1) &      
                        (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2) &   
                        auxiliar = {0|->0, 1|->0, 2|->(prj1(NAT, NAT)(xx) + 1), 3|->(prj2(NAT, NAT)(xx) + 1)}) or           
                        (prj2(NAT, NAT)(xx) = 8 & 
                        (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes1) & 
                        (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes2) & 
                        auxiliar = {0|->(prj1(NAT, NAT)(xx) + 1), 1|->(prj2(NAT, NAT)(xx) - 1), 2|->0, 3|->0}) or          
                        (prj2(NAT, NAT)(xx):(2..7)                                                  
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1)     
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) /: ran(posicoes1)      
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2)     
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) /: ran(posicoes2)      
                        & auxiliar = {0|->(prj1(NAT, NAT)(xx) + 1), 1|->(prj2(NAT, NAT)(xx) - 1), 2|->(prj1(NAT, NAT)(xx) + 1), 3|->(prj2(NAT, NAT)(xx) + 1)})or 
                        (prj2(NAT, NAT)(xx):(2..7)                                                  
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1)     
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2)     
                        & ((prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) : ran(posicoes1)      
                            or (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) : ran(posicoes2)) 
                        & auxiliar = {0|->0, 1|->0, 2|->(prj1(NAT, NAT)(xx) + 1), 3|->(prj2(NAT, NAT)(xx) + 1)})or 
                        (prj2(NAT, NAT)(xx):(2..7)                                                  
                        & ((prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) : ran(posicoes1)     
                            or (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) : ran(posicoes2))
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) /: ran(posicoes1)      
                        & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx)- 1) /: ran(posicoes2)      
                        & auxiliar = {0|->(prj1(NAT, NAT)(xx) + 1), 1|->(prj2(NAT, NAT)(xx) - 1), 2|->0, 3|->0})or 
                        (not(
                            (prj2(NAT, NAT)(xx) = 1                                                       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2)) or   
                            (prj2(NAT, NAT)(xx) = 8                                                       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes2)) or   
                            (prj2(NAT, NAT)(xx):(2..7)                                                    
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes2)) or      
                            (prj2(NAT, NAT)(xx):(2..7)                                                    
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) /: ran(posicoes2)       
                            & ((prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) : ran(posicoes1)       
                                or (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) : ran(posicoes2))) or  
                            (prj2(NAT, NAT)(xx):(2..7)                                                    
                            & ((prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) : ran(posicoes1)       
                                or (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) + 1) : ran(posicoes2))  
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes1)        
                            & (prj1(NAT, NAT)(xx) + 1, prj2(NAT, NAT)(xx) - 1) /: ran(posicoes2))       
                            )
                            & auxiliar = {0|->0, 1|->0, 2|->0, 3|->0}) 
                    )
                    
                THEN opcoes := auxiliar || array_auxiliar := auxiliar
                END
                //Se for o jogador 2
            ELSIF jogador_da_vez = J2 & peca /: damasj2 & peca : pecasj2
            THEN
                ANY auxiliar 
                WHERE 
                    auxiliar : (0..3) --> (0..8) &
                    (
                        (prj2(NAT, NAT)(yy) = 1                                                          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)          
                        & auxiliar = {0|->0, 1|->0, 2|->(prj1(NAT, NAT)(yy) - 1), 3|->(prj2(NAT, NAT)(yy) + 1)}) or  
                        (prj2(NAT, NAT)(yy) = 8                                                          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2)          
                        & auxiliar = {0|->(prj1(NAT, NAT)(yy) - 1), 1|->(prj2(NAT, NAT)(yy) - 1), 2|->0, 3|->0}) or   
                        (prj2(NAT, NAT)(yy):(2..7)                                                       
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)          
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2)          
                        & auxiliar = {0|->(prj1(NAT, NAT)(yy) - 1), 1|->(prj2(NAT, NAT)(yy) - 1), 2|->(prj1(NAT, NAT)(yy) - 1), 3|->(prj2(NAT, NAT)(yy) + 1)}) or  
                        (prj2(NAT, NAT)(yy):(2..7)                                                      
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)         
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)         
                        & ((prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) : ran(posicoes1)         
                            or (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) : ran(posicoes2))    
                        & auxiliar = {0|->0, 1|->0, 2|->(prj1(NAT, NAT)(yy) - 1), 3|->(prj2(NAT, NAT)(yy) + 1)}) or 
                        (prj2(NAT, NAT)(yy):(2..7)                                                      
                        & ((prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) : ran(posicoes1)         
                            or (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) : ran(posicoes2))    
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)         
                        & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2)         
                        & auxiliar = {0|->(prj1(NAT, NAT)(yy) - 1), 1|->(prj2(NAT, NAT)(yy) - 1), 2|->0, 3|->0}) or 
                        (not(
                            (prj2(NAT, NAT)(yy) = 1                                                       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)) or   
                            (prj2(NAT, NAT)(yy) = 8                                                       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2)) or   
                            (prj2(NAT, NAT)(yy):(2..7)                                                    
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2)) or   
                            (prj2(NAT, NAT)(xx):(2..7)                                                    
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) /: ran(posicoes2)       
                            & ((prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) : ran(posicoes1)       
                                or (prj1(NAT, NAT)(yy) + 1, prj2(NAT, NAT)(yy) - 1) : ran(posicoes2))) or  
                            (prj2(NAT, NAT)(yy):(2..7)                                                    
                            & ((prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) : ran(posicoes1)       
                                or (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) + 1) : ran(posicoes2))  
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes1)       
                            & (prj1(NAT, NAT)(yy) - 1, prj2(NAT, NAT)(yy) - 1) /: ran(posicoes2))      
                        )     
                        &  auxiliar = {0|->0, 1|->0, 2|->0, 3|->0}) 
                    )
                    
                THEN 
                    opcoes := auxiliar || 
                    array_auxiliar := auxiliar 
                END
            END
        END
    END;
    
    comer_peca(peca, alvo) =
    PRE  
        peca:(0..11) & 
        alvo:(0..11) & 
        ((peca : pecasj1 & alvo : pecasj2) or (peca : pecasj2 & alvo : pecasj1))
    THEN
        //Se for o jogador 1
        IF 
            jogador_da_vez = J1 & 
            peca : pecasj1 & 
            alvo : pecasj2
        THEN
            IF (prj1(NAT, NAT)(posicoes1(peca)) + 1, prj2(NAT, NAT)(posicoes1(peca)) - 1) = (prj1(NAT, NAT)(posicoes2(alvo)), prj2(NAT, NAT)(posicoes2(alvo)))
            THEN
                IF (prj1(NAT, NAT)(posicoes2(alvo)) + 1, prj2(NAT, NAT)(posicoes2(alvo)) - 1) /: (ran(posicoes2) \/ ran(posicoes1)) 
                THEN
                    posicoes1 := posicoes1 <+ { peca |-> (prj1(NAT, NAT)(posicoes1(peca)) + 2 , prj2(NAT, NAT)(posicoes1(peca)) - 2)} || jogador_da_vez := J2 ||
                    remover_peca(alvo,J2) ||
                    posicoes2 := {alvo} <<| posicoes2
                END
            ELSIF (prj1(NAT, NAT)(posicoes1(peca)) + 1, prj2(NAT, NAT)(posicoes1(peca)) + 1) = (prj1(NAT, NAT)(posicoes2(alvo)), prj2(NAT, NAT)(posicoes2(alvo)))
            THEN
                IF (prj1(NAT, NAT)(posicoes2(alvo)) + 1, prj2(NAT, NAT)(posicoes2(alvo)) + 1) /: (ran(posicoes2) \/ ran(posicoes1)) 
                THEN
                    posicoes1 := posicoes1 <+ { peca |-> (prj1(NAT, NAT)(posicoes1(peca)) + 2 , prj2(NAT, NAT)(posicoes1(peca)) + 2)} || 
                    jogador_da_vez := J2 ||
                    remover_peca(alvo,J2) ||
                    posicoes2 := {alvo} <<| posicoes2
                END
            END
            //Se for o jogador 2
        ELSIF 
            jogador_da_vez = J2 & 
            peca : pecasj2 & 
            alvo : pecasj1
        THEN
            
            IF (prj1(NAT, NAT)(posicoes2(peca)) - 1, prj2(NAT, NAT)(posicoes2(peca)) - 1) = (prj1(NAT, NAT)(posicoes1(alvo)), prj2(NAT, NAT)(posicoes1(alvo)))
            THEN
                IF (prj1(NAT, NAT)(posicoes1(alvo)) - 1, prj2(NAT, NAT)(posicoes1(alvo)) - 1) /: (ran(posicoes2) \/ ran(posicoes1)) 
                THEN
                    posicoes2 := posicoes2 <+ { peca |-> (prj1(NAT, NAT)(posicoes2(peca)) - 2 , prj2(NAT, NAT)(posicoes2(peca)) - 2)} || jogador_da_vez := J1 ||
                    remover_peca(alvo,J1) ||
                    posicoes1 := {alvo} <<| posicoes1 
                END
            ELSIF (prj1(NAT, NAT)(posicoes2(peca)) - 1, prj2(NAT, NAT)(posicoes2(peca)) + 1) = (prj1(NAT, NAT)(posicoes1(alvo)), prj2(NAT, NAT)(posicoes1(alvo)))
            THEN
                IF (prj1(NAT, NAT)(posicoes1(alvo)) - 1, prj2(NAT, NAT)(posicoes1(alvo)) + 1) /: (ran(posicoes2) \/ ran(posicoes1)) 
                THEN
                    posicoes2 := posicoes2 <+ { peca |-> (prj1(NAT, NAT)(posicoes2(peca)) - 2 , prj2(NAT, NAT)(posicoes2(peca)) + 2)} || 
                    jogador_da_vez := J1 ||
                    remover_peca(alvo,J1) ||
                    posicoes1 := {alvo} <<| posicoes1
                END
            END   
        END
END
END
