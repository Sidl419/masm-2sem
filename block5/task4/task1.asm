include console.inc 
.data
        L equ 5
        R equ 155
        S db (R-L)/8+1 dup(0)
.code 
start:  clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 4 (block 5)'
        mov DH, 8
        xor AH, AH
H:      
        inchar BL
        cmp BL, "+"
        jNE next1

        inint AL
        sub AL, L
        div DH
        mov BH, 10000000b
        mov CL, AH
        ror BH, CL
        or S[EAX], BH
        jmp H 

next1:  cmp BL, "-"
        jNE next3

        xor AH, AH
        inint AL
        sub AL, L
        div DH
        mov BH, 01111111b
        mov CL, AH
        ror BH, CL 
        and S[EAX], BH
        jmp H

next3:  cmp BL, "?"
        jNE next4

        xor AH, AH
        inint AL
        sub AL, L
        div DH
        mov BH, 10000000b
        mov CL, AH
        ror BH, CL
        mov DL, S[EAX];?
        and DL, CL
        cmp DL, 0
        jNE skip 
        outstrln "NO"
        jmp @F
skip:   outstrln "YES"
@@:     jmp H

next4:  cmp BL, "="
        jNE next5

        xor DL, DL
        mov ECX, (R-L)/8+1
        xor EDI, EDI
LL:     mov AH, 1
L1:     mov BH, S[EDI]
        and BH, AH
        add DL, BH
        shl AH, 1
        cmp AH, 128
        jNE L1
        inc EDI
        loop LL 
        outwordln DL
        jmp H

next5:  cmp BL, ":"
        jNE next6
        
        mov AL, L
        mov ECX, (R-L)/8+1
        xor EDI, EDI
LLL:    mov AH, 1
LL1:    mov BH, S[EDI]
        and BH, AH
        cmp BH, 0
        jE @F 
        outword AL,, " "
@@:     inc AH
        shl AH, 1
        cmp AH, 128
        jNE LL1
        inc EDI
        loop LLL 
        newline
        jmp H

next6:  

        pause
        exit
end start