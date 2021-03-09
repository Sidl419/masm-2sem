include console.inc 
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 3 (block 4)'
        inint EAX
        inint BL
        call OUTD1
        newline
        call OUTD2
        pause
        exit

OUTD1 proc
        push EBP
        mov EBP, ESP
        push ESI
        push EDX 
        push ECX
        push EDI
        movzx ESI, BL
        mov EDI, EAX
        xor ECX, ECX
@L:     xor EDX, EDX
        div ESI
        push EDX
        inc ECX
        cmp EAX, ESI 
        jAE @L
        outword EAX
@@:     pop EDX
        outword EDX
        loop @B
        mov EAX, EDI
        pop EDI
        pop ECX
        pop EDX
        pop ESI
        pop EBP
        ret 0
OUTD1 endp

OUTD2 proc 
        push EBP
        mov EBP, ESP
        push ESI
        push EDX
        movzx ESI, BL
        cmp EAX, ESI 
        jL @fin
        xor EDX, EDX
        div ESI
        call OUTD2
        outword EDX
        jmp @F
@fin:   outword EAX
@@:     pop EDX
        pop ESI
        pop EBP
        ret 0
OUTD2 endp

end start