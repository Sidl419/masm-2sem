include console.inc 
.data 
        C db ?
        Y db "YES", 0
        N db "NO", 0
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 3 (block 1) "Bracket balance"'
        outstr "Enter a sequence of symbols (dot in the end) "
        mov EAX, 0
        mov EDX, offset N
L:      inchar C
        cmp C, '('
        jNE incr 
        inc EAX
incr:   cmp C, ')'
        jNE decr
        dec EAX 
        cmp EAX, 0
        jL res
decr:   cmp C, '.'
        jNE L
        ;end of cycle
        cmp EAX, 0
        jNE res
        mov EDX, offset Y
res:    outstr EDX
        pause
        exit
end start