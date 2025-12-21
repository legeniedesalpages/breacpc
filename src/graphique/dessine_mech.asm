; ---------------------------------------------------------------------------------
; Dessine le mech :
;
; Dans HL l'adresse du sprite du mech
; Dans IX l'adresse du masque du mech
; Dans DE l'adresse de l'écran où dessiner le mech
; ---------------------------------------------------------------------------------
dessine_mech:
    LD A, 24 ; hauteur du mech (24 pixels)

    dessine_mech_boucle_ligne:
        PUSH AF
        LD B, 7 ; largeur du mech (7 * 4 bits = 28 pixels)

    dessine_mech_boucle_colonne:
        LD A,(DE)         ; lire écran
        AND (IX)          ; masque
        OR (HL)           ; sprite
        LD (DE),A         ; écrire
        INC HL
        INC IX
        INC DE
        DEC B
        JR NZ, dessine_mech_boucle_colonne

        EX DE, HL
        LD BC, #07F9
        ADD HL, BC
        JP NC, continue_dessine_mech

        LD BC, #C050
        ADD HL, BC

    continue_dessine_mech:
        EX DE, HL

        POP AF
        DEC A : OR A : JR NZ, dessine_mech_boucle_ligne

    RET

; ---------------------------------------------------------------------------------
; Efface le mech :
;
; Dans DE l'adresse de l'écran où effacer le mech
; ---------------------------------------------------------------------------------
efface_mech:
    
    RET

; ----------------------------------------------------------------------------------
; Constantes
; ----------------------------------------------------------------------------------

mech_prime_data:
    INCBIN "../../assets/prime.bin"
masque_prime_data:
    INCBIN "../../assets/prime_masque.bin"