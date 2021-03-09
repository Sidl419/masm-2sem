include console.inc 
.data 
        X dd ?
.code 
start:
        inint X
        push offset X
        call Calc
        outword X
        pause
        exit

        Calc proc 
        push EBP
        mov EBP, ESP
        push ESI
        push EAX
        push EBX
        push ECX
        mov ESI, [EBP + 8]
        mov EAX, [ESI]
        mov EBX, [ESI]
        shr EAX, 3
        and EBX, 111111b
        lea ECX, [EBX + EAX]
        mov EAX, ECX
        shl ECX, 3
        mov EBX, ECX
        lea ECX, [EBX + EAX]
        mov EBX, 12345
        mov EAX, ECX
        lea ECX, [EAX + EBX]
        mov [ESI], ECX
        pop ECX
        pop EBX
        pop EAX
        pop ESI
        pop EBP
        ret 4
Calc endp

end start