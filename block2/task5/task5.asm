include console.inc 
.data 
        N equ 30
        X dd N dup(?)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 5 (block 2) "Selection sort"'
        inint           ECX
        mov             EDX,            ECX
        mov             EBX,            0
L:      inint           X[4*EBX]
        inc             EBX
        loop            L 
        mov             ECX,            EDX
        dec             ECX
L1:     lea             EAX,            X
        mov             EBX,            1
L2:     mov             EDI,            [EAX]
        cmp             EDI,            X[4*EBX]
        jGE             next
        lea             EAX,            X[4*EBX]
next:   inc             EBX
        cmp             EBX,            ECX
        jBE              L2
        mov             EDI,            [EAX]
        Xchg            EDI,         X[4*ECX]
        mov             [EAX],          EDI
        dec             ECX
        jNZ             L1
        mov             EBX,            0
        mov             ECX,            EDX
outL:   outint          X[4*EBX]
        outchar         " "
        inc             EBX
        loop            outL 
        pause
        exit
end start