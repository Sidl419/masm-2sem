include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 6 (Block 1) "Quinary number"'
        mov EAX, 0
        mov EBX, 0
        mov EDI, 5
L:      inchar BL 
        cmp BL, " "
        jE fin
        mul EDI
        sub BL, "0"
        add EAX, EBX
        jmp L
fin:    outword EAX
        pause
        exit
end start