    .pc $1000
lbl1:
    NOP
    JMP [lbl1]                  ; jumps to $1000
lbl2:   
    BEQ [lbl2]                  ; jumps -1 ($fe)

    
