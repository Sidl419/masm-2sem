include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 10 (Block 1)'
        mov EAX, 0
        outstr "  |"
L:      outint EAX, 3
        inc EAX 
        cmp EAX, 10
        jNE L
        newline
        outstrln "---------------------------------"
        mov EBX, 0
L1:     mov ECX, 0
        mov EAX, 0
        outint EBX 
        outstr " |"
L2:     outint EAX, 3
        add EAX, EBX
        inc ECX
        cmp ECX, 10
        jNE L2
        newline
        inc EBX
        cmp EBX, 10
        jNE L1       
        pause
        exit
end start