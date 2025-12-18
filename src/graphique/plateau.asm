plateau:
    LD HL, ScreenLineTable
    LD BC, 0 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 35 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 20 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 30 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 40 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 25 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 60 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 20 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 80 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 15 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 100 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 10 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 120 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 5 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 140 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 0 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    LD HL, ScreenLineTable
    LD BC, 20 ; ligne
    ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne
    LD DE, 40 ; colonne
    ADD HL, DE : EX HL,DE : CALL tuile

    RET