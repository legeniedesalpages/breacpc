; Routine pour afficher un message pointé par HL
; il faut qu'il y ait au moins un caractère dans le tableau pointé par HL

affiche_message
    EX HL, DE
    CALL #BB75 ; vecteur système pour positionner le curseur
    EX HL, DE
    LD A,(HL) ; récupére le premier caractère

boucle_message
    INC HL ; fait avancer le tableau
    CALL #BB5A ; vecteur système pour afficher le caractère
    LD A,(HL) ; copie le caractère suivant a l'adresse du tableau
    OR A : JR NZ, boucle_message ; si le caratère n'est pas 0 alors on reboucle, sinon on continue notre chemin
    RET
