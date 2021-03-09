include console.inc 
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 4 (block 4)'
        inint EAX
        push EAX
        call MaxDig
        outword EAX
        pause
        exit

MaxDig proc 
        push EBP
        mov EBP, ESP
        push ESI
        push EDX
        mov EAX, [EBP + 8]
        mov ESI, 10
        cmp EAX, 10
        jL @fin
        xor EDX, EDX
        div ESI
        push EAX
        call MaxDig
        cmp EDX, EAX
        jNA @fin
        mov EAX, EDX 
@fin:   pop EDX
        pop ESI
        pop EBP
        ret 4
MaxDig endp

end start