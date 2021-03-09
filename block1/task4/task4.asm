include console.inc
.data 
        P dd ?
        Q dd ?
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 4 (Block 1) "Fraction P/Q"'
        mov EBX, 10
        mov EDX, 0
        inint P 
        inint Q
        mov EAX, P
        div Q
        outword EAX
        outchar ","
        mov ECX, 5
L:      mov EAX, EDX
        mov EDX, 0
        mul EBX
        div Q
        outword EAX
        loop L
        pause
        exit
end start