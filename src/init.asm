; -- INIT VIDEO ---

init
    LD  A,1
    CALL #BC0E     ; SCR_SET_MODE

    ; configuration des couleurs
    LD BC,#7F00:OUT (C),C
    LD A,84:LD B,#7F:OUT (C),A ; encre 0 noir

    LD BC,#7F01:OUT (C),C
    LD A,87:LD B,#7F:OUT (C),A ; encre 1 bleu

    LD BC,#7F02:OUT (C),C
    LD A,86:LD B,#7F:OUT (C),A ; encre 2 vert

    LD BC,#7F03:OUT (C),C
    LD A,75:LD B,#7F:OUT (C),A ; encre 3 blanc

    LD BC,#7F10:OUT (C),C
    LD A,87:LD B,#7F:OUT (C),A ; bord noir
