include console.inc 
.code 
start:
        inint EAX
        push EAX
        call Replace_4_to_3
        outword EAX
        pause
        exit

Replace_4_to_3 proc 
        push EBP
        mov EBP, ESP
        push ESI
        push EDX 
        push EDI
        mov ESI, 10
        mov EAX, [EBP + 8]
        cmp EAX, 10
        jB @fin
        xor EDX, EDX
        div ESI
        cmp EDX, 4 
        jNE @F 
        mov EDX, 3
@@:     push EAX 
        call Replace_4_to_3
        mov EDI, EDX
        mul ESI
        add EAX, EDI
        jmp @F
@fin:   cmp EAX, 4
        jNE @F 
        mov EAX, 3
@@:     
        pop EDI
        pop EDX
        pop ESI
        pop EBP
        ret 4
Replace_4_to_3 endp

end start