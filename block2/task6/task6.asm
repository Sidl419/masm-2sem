include console.inc 
.data 
        N equ 30
        X dd N dup(?)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 6 (block 2) "Bubble sort"'
        inint           ECX
        mov             EDX,            ECX
        mov             EBX,            0
L:      inint           X[4*EBX]
        inc             EBX
        loop            L 
        mov             ECX,            EDX
        dec             ECX
L1:     mov             ESI,            0
        mov             EBX,            0
L2:     mov             EDI,            X[4*EBX]
        cmp             EDI,            X[4*EBX + 4]
        jLE             next
        mov             ESI,            1
        Xchg            EDI,            X[4*EBX + 4]
        mov             X[4*EBX],       EDI
next:   inc             EBX
        cmp             EBX,            ECX
        jB              L2
        cmp             ESI,            0
        jE              fin
        dec             ECX
        jNZ             L1
fin:    mov             EBX,            0
        mov             ECX,            EDX
outL:   outint          X[4*EBX]
        outchar         " "
        inc             EBX
        loop            outL 
        pause
        exit
end start