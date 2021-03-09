include console.inc 
.data 
        LAT db 26 dup(0)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 1 (block 2) "First entrances"'
        mov             EBX,            0
        mov             EAX,            0
L:      inchar          BL
        cmp             BL,            "."
        jE             fin
        mov             AL,            BL
        sub             AL,            "A"
        cmp             LAT[EAX],       0
        jNE             L
        mov             LAT[EAX],       1
        outchar         BL
        jmp             L
fin:    pause
        exit
end start