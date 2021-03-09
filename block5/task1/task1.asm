include console.inc
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 1 (block 5) "Binary Input/Output"'
        outstr "Enter binary number (32 digits or less, space in the end): "
        xor EAX, EAX
L:      inchar DL
        cmp DL, " "
        jE fin
        sub DL, "0"
        shl EAX, 1
        or AL, DL
        jmp L
fin:    mov ECX, 32
        outstr "Same number: "
L1:     xor DL, DL
        shl EAX, 1
        adc DL, 0
        cmp DL, 0
        loopz L1
        jECXZ res
L2:     outword DL
        xor DL, DL
        shl EAX, 1
        adc DL, 0
        loop L2
res:    outword DL
        pause
        exit
end start