plateau:
    LD HL, ScreenLineTable
    LD BC, 0 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 35 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 22 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 30 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 44 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 25 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 66 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 20 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 88 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 15 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 110 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 10 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 132 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 5 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 154 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 0 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    RET