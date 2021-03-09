include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 8 (Block 1)'
        mov EAX, 0
        mov EBX, 0
        inchar BL 
        sub BL, "0"
        mov EAX, EBX
L:      inchar BL 
        cmp BL, "."
        jE fin
        cmp BL, "+"
        jNE @F
        inchar BL 
        sub BL, "0"
        add EAX, EBX
        jmp L
@@:     inchar BL
        sub BL, "0"
        sub EAX, EBX
        jmp L
fin:    outint EAX
        pause
        exit
end start