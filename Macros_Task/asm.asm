        push EBP
        mov EBp, ESP
        push ESi  
        push ECX 
        push EDX 
        push EDI
        push EBX 
        push EAX

        mov ESI, [EBP + 8]
        mov EDX, [EBP + 12]
        mov ECX, [EBP + 16]

        mov EDI, ECX
        dec EDI
        mov EBX, 0
        mov EAX, ESI 
@LL:    cmp EDi, 0
        jG @fin 
        mov ESI, [EBP + 8]
@LLL:   mov ESi, [ESi + EDI]
        cmp [EAX + EDI], ESi 
        jAE @F 
        mov EAX, ESi 
@@:     ADD ESi, ECX
        inc EBX 
        cmp EBX, EDX 
        jb @LLL 
        dec EDI 
        mov EBX, 0
        jmp @LL 
@fin:   push ECX 
        push EAX 
        call Out_word 

        pop EAX
        pop EBX 
        pop EDI 
        pop EDX 
        pop ECX
        pop ESi