include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 7 (Block 1)'
        inint ESI
        mov EDI, 7
L:      mov EAX, ESI
        mov EDX, 0
        div EDI
        cmp EDX, 4
        jL @F 
        inc ESI 
        jmp L
@@:     cmp EDX, 0
        jE fin
        dec ESI
        jmp L
fin:    outword ESI
        pause
        exit
end start