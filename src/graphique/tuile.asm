tuile:
    LD HL, tuile_data
    LD IX, masque_tuile
    LD A, 30
    
tuile_boucle_ligne:
    PUSH AF
    LD B, 10
tuile_boucle_colonne:
    LD A,(DE)         ; lire écran
    AND (IX)          ; masque
    OR (HL)           ; sprite
    LD (DE),A         ; écrire
    INC HL
    INC IX
    INC DE
    DEC B
    JR NZ, tuile_boucle_colonne

    EX DE, HL
    LD BC, #07F6
    ADD HL, BC
    JP NC, continue_tuile
    
    LD BC, #C050
    ADD HL, BC
continue_tuile:
    EX DE, HL
    POP AF
    DEC A
    OR A : JR NZ, tuile_boucle_ligne
    RET

