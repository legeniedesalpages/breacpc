
generer_plateau:
    LD A, 0; huit tuiles par colonnes

    plateau_boucle_ligne:
        PUSH AF
        
        LD H, 0 : LD L, A ; ligne de départ : tout en haut (A = 0 pour la première boucle)
        ADD HL, HL : ADD HL, HL ; HL * 4
        LD DE, HL ; dans BC => A * 4
        LD H, 0 : LD L, A
        ADD HL, HL : ADD HL, HL : ADD HL, HL : ADD HL, HL ; dans HL => A * 16
        ADD HL, DE ; dans HL A * 16 + A * 4 = A * 20
        LD DE, HL ; dans DE la ligne (qui va de de 0 à 199)

        LD HL, 40 ; colonne de départ : milieu de l'écran
        LD C, A
        ADD A, A : ADD A, A ; A * 4
        ADD A, C ; A * 4 + A = A * 5
        LD B, 0 : LD C, A
        ADD HL, BC ; 40 + A * 5
        LD BC, HL ; dans BC la colonne (qui va de de 0 à 79 => 4 bits par colonne => 319)
        
        LD A, 8 ; huit tuiles par lignes
        
        plateau_boucle_colonne:
            PUSH AF

            LD A, C

            LD HL, DE
            LD BC, 20
            ADD HL, BC
            LD BC, HL
            PUSH BC

            ; Dans HL l'adresse de la ligne d'écran et dans BC la colonne
            LD HL, ScreenLineTable
            ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne

            SUB A, 5
            LD D, 0 : LD E, A

            PUSH DE 
            ADD HL, DE : EX HL,DE : CALL tuile

            POP BC
            POP DE
            POP AF
            DEC A : OR A : JP NZ, plateau_boucle_colonne

    POP AF
    INC A : CP A, 8 : JP NZ, plateau_boucle_ligne
    
RET
