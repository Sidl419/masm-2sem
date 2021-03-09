include console.inc
.data 
        DIG db 11 dup(0)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 3 (block 2) "Sign decimal"'
        mov             ECX,            10
        mov             ESI,            10
        inint           EAX
        cmp             EAX,            0
        jG @F
        outchar         "-"
        neg             EAX
@@:     mov             EDX,            0
        div             ESI
        add             DL,             "0"
        mov             DIG[ECX - 1],   DL
        cmp             EAX,            0
        loopne          @B
        lea             EDX,            DIG[ECX]
        outstr          EDX
        pause
        exit
end start