;--------------------
; imports
;--------------------
INCLUDE "tuile.asm"

; ---------------------------------------------------------------------------------
; Génère le plateau de jeu
; - construit 8 x 8 tuiles a partir de la matrice_plateau
; - sauvegarde le fond du plateau dans fond_plateau
; ---------------------------------------------------------------------------------
generer_plateau:

    LD A, 0; huit tuiles par colonnes en ordre croissant
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
        
        LD A, 8 ; huit tuiles par lignes en ordre décroissant
        plateau_boucle_colonne:
            PUSH AF

            LD A, C

            LD HL, DE
            LD BC, 20
            ADD HL, BC
            LD BC, HL
            PUSH BC

            ; Dans HL l'adresse de la ligne d'écran et dans BC la colonne
            LD HL, adresse_ligne_ecran
            ADD HL, BC : LD E, (HL) : LD BC, 1 : ADD HL, BC : LD D, (HL) : EX HL,DE ; dans HL adresse de la ligne

            SUB A, 5
            LD D, 0 : LD E, A

            PUSH DE 
            ADD HL, DE : EX HL,DE

            EX AF, AF'

            LD HL, matrice_plateau
            LD B, 0 : LD C, A
            ADD HL, BC
            INC A
            EX AF, AF'

            LD A, (HL)

            CP A, 1 : JP Z, montagne
            CP A, 2 : JP Z, eau
            CP A, 3 : JP Z, ville

            herbe:
                LD HL, tuile_herbe_data
                LD IX, masque_herbe_data
                JP affiche_tuile_plateau

            montagne:
                LD HL, tuile_montagne_data
                LD IX, masque_montagne_data
                JP affiche_tuile_plateau

            eau:
                LD HL, tuile_eau_data
                LD IX, masque_eau_data
                JP affiche_tuile_plateau

            ville:
                LD HL, tuile_ville_data
                LD IX, masque_ville_data
                JP affiche_tuile_plateau

            affiche_tuile_plateau:
                CALL tuile

            POP BC
            POP DE
            POP AF
            DEC A : OR A : JP NZ, plateau_boucle_colonne

    POP AF
    INC A : CP A, 8 : JP NZ, plateau_boucle_ligne
    
sauvegarde_fond_plateau:
    LD HL, #C000 
    LD DE, fond_plateau
    LD BC, 16000
    LDIR

RET

; ----------------------------------------------------------------------------------
; Constantes
; ----------------------------------------------------------------------------------

fond_plateau:
    DS 16000

matrice_plateau:
    DB 2,1,0,0,0,0,0,0   ; ligne 0
    DB 1,0,0,0,0,0,1,0   ; ligne 1
    DB 0,0,0,0,0,1,1,0   ; ligne 2
    DB 0,0,3,0,0,0,1,0   ; ligne 3
    DB 0,0,3,0,0,0,0,0   ; ligne 4
    DB 0,3,0,0,0,0,2,2   ; ligne 5
    DB 3,0,0,0,0,0,2,2   ; ligne 6
    DB 0,0,0,0,2,2,2,2   ; ligne 7

tuile_herbe_data:
    INCBIN "../../assets/tuile_herbe.bin"
masque_herbe_data:
    INCBIN "../../assets/tuile_herbe_masque.bin"
tuile_montagne_data:
    INCBIN "../../assets/tuile_montagne.bin"
masque_montagne_data:
    INCBIN "../../assets/tuile_montagne_masque.bin"
tuile_eau_data:
    INCBIN "../../assets/tuile_eau.bin"
masque_eau_data:
    INCBIN "../../assets/tuile_eau_masque.bin"
tuile_ville_data:
    INCBIN "../../assets/tuile_ville.bin"
masque_ville_data:
    INCBIN "../../assets/tuile_ville_masque.bin"