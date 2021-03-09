include console.inc 
.data 
        Max_Len equ 20
        X dd Max_Len dup(?)
.code 
start:
        push offset X 
        call InArr
        mov EBX, EAX
        push EBX
        push offset X 
        call OutArr
        push EBX
        push offset X 
        call IsSame
        cmp AL, 0
        jE skip
        push EBX
        push offset X 
        call Invert
        push EBX
        push offset X 
        call OutArr
        jmp nee
skip:   push EBX
        push offset X 
        call Div64
nee:    
        pause
        exit

InArr proc
        push EBP
        mov EBP, ESP
        push ESI
        push EDX
        mov ESI, [EBP + 8]
        xor EAX, EAX
@L:     inint EDX
        cmp EDX, 0
        jE @fin
        mov [ESI + 4*EAX], EDX
        inc EAX
        jmp @L 
@fin:   pop EDX
        pop ESI
        pop EBP
        ret 4
InArr endp

OutArr proc
        push EBP
        mov EBP, ESP
        push ESI
        push EDI
        push ECX
        mov ESI, [EBP + 8]
        xor EDI, EDI
        newline
        mov ECX, [EBP + 12]
@L1:    outword [ESI + 4*EDI],," "
        inc EDI
        loop @L1
        pop ECX
        pop EDI
        pop ESI
        pop EBP
        ret 4*2
OutArr endp

IsSame proc
        push EBP
        mov EBP, ESP

        push ESI
        push EDI
        push EDX
        push ECX
        push EBX
        mov ESI, [EBP + 8]
        xor EDI, EDI
        xor AL, AL
        newline
        mov ECX, [EBP + 12]
@L21:   mov EBX, ECX
        mov EDX, [ESI + 4*EDI]
        push EDI
@L22:   inc EDI
        cmp EDX, [ESI + 4*EDI]
        jE @res
        dec EBX
        cmp EBX, 0
        jNZ @L22
        pop EDI
        inc EDI
        loop @L21
        jmp @F
@res:   pop EDI
        inc AL
@@:     
        
        pop EBX
        pop ECX
        pop EDX
        pop EDI
        pop ESI

        pop EBP
        ret 4*2
IsSame endp

Invert proc
        push EBP
        mov EBP, ESP
        push EDI
        push ESI
        push EAX
        push ECX
        push EDX
        mov EDI, [EBP + 8]
        xor ESI, ESI
@L52:   mov ECX, [EBP + 12]
        sub ECX, ESI
        sub ECX, 1
        mov EDX, [EDI + 4*ECX]
        Xchg [EDI + 4*ESI], EDX
        mov [EDI + 4*ECX], EDX
        inc ESI
        mov EAX, [EBP + 12]
        mov ECX, 2
        xor EDX, EDX
        div ECX
        cmp ESI, EAX
        jNE @L52
        pop EDX
        pop ECX
        pop EAX
        pop ESI
        pop EDI
        pop EBP
        ret 2 * 4
Invert endp

Div64 proc
        push EBP
        mov EBP, ESP
        push ESI
        push EDI
        push ECX
        mov ESI, [EBP + 8]
        xor EDI, EDI
        newline
        mov ECX, [EBP + 12]
@L71:   test dword ptr [ESI + 4*EDI], 63
        jNZ @sss
        outword [ESI + 4*EDI],," "
@sss:   inc EDI
        loop @L71
        pop ECX
        pop EDI
        pop ESI
        pop EBP
        ret 4*2
Div64 endp

end start