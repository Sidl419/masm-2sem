include console.inc
.data 
        DIG db 9 dup(0)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 4 (block 2) "Unsign hex"'
        mov             ECX,            8
        mov             ESI,            16
        inint           EAX
@@:     mov             EDX,            0
        div             ESI
        cmp             DL,             9
        jA              next
        add             DL,             "0"
        jmp             fin
next:   add             DL,             "A" - 10
fin:    mov             DIG[ECX - 1],   DL
        loop          @B
        ;lea             EDX,            DIG[ECX]
        outstr          offset DIG
        pause
        exit
end start