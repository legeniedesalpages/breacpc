mech:
    LD A, 24 ; hauteur du mech (24 pixels)

mech_boucle_ligne:
    PUSH AF
    LD B, 7 ; largeur du mech (7 * 4 bits = 28 pixels)

mech_boucle_colonne:
    LD A,(DE)         ; lire écran
    AND (IX)          ; masque
    OR (HL)           ; sprite
    LD (DE),A         ; écrire
    INC HL
    INC IX
    INC DE
    DEC B
    JR NZ, mech_boucle_colonne

    EX DE, HL
    LD BC, #07F9
    ADD HL, BC
    JP NC, continue_mech

    LD BC, #C050
    ADD HL, BC

continue_mech:
    EX DE, HL

    POP AF
    DEC A : OR A : JR NZ, mech_boucle_ligne

RET

