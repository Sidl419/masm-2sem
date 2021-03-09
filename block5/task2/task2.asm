include console.inc 
.data 
        DIG db "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 2 (block 5) "Hexadecimal Input/Output"'
        outstr "Enter hexadecimal number (8 digits or less, space in the end): "
        xor EAX, EAX
        xor EDX, EDX
L:      inchar BL
        xor DL, DL
        cmp BL, " "
        jE fin
        cmp BL, "0"
        jL let
        cmp BL, "9"
        jA let
        sub BL, "0"
        jmp skip
let:    sub BL, "A"
        add BL, 10
        mov ECX, 4
skip:   shl EAX, 4
        or AL, BL
        jmp L
fin:    mov ECX, 8
        outstr "Same number: "
L1:     xor DL, DL
        rol EAX, 4
        mov DL, AL
        and DL, 1111b
        cmp DL, 0
        loopz L1
        jECXZ res
L2:     outchar DIG[EDX]
        xor DL, DL
        rol EAX, 4
        mov DL, AL
        and DL, 1111b
        loop L2
res:    outchar DIG[EDX]
        pause
        exit
end start