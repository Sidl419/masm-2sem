include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 5 (Block 1) "Senior and junior"'
        mov ESI, 10
        inint EAX
        mov EDX, 0
        div ESI
        mov EDI, EDX
L:      cmp EAX, 0
        jNE single
        mov EBP, EDX
        jmp res
single: mov EDX, 0
        div ESI
        jmp L 
res:    mov EAX, EDI
        mul EBP
        outint EAX
        pause
        exit
end start