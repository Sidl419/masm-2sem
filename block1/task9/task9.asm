include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 9 (Block 1)'
        mov EDI, 0
L1:     inchar AL 
        mov BH, AL
L2:     inchar BL 
        cmp BL, ","
        jE fin2
        cmp BL, "."
        jE fin1
        mov BH, BL
        jmp L2
fin2:   cmp AL, BH 
        jNE @F 
        inc EDI 
@@:     jmp L1
fin1:   cmp AL, BH 
        jNE @F 
        inc EDI 
@@:     outword EDI
        pause
        exit
end start