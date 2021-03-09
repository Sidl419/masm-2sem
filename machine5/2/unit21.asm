include console.inc 

public In_text, Out_text, Find_min_word

.code 

In_word proc
        push EBP
        mov EBP, ESP

        push ESI
        push ECX 
        push EAX

        mov ESI, [EBP + 8]; Elem_of_Arr
        mov ECX, [EBP + 12]; K

@L1:    inchar AL
        and AL, 11011111b
        mov [ESI], AL
        inc ESI
        loop @L1 

        pop EAX
        pop ECX
        pop ESI

        pop EBP 

        ret 4*2
In_word endp

In_text proc 
        push EBP
        mov EBP, ESP

        push ESI
        push ECX 

        mov ESI, [EBP + 8]; Arr_of_words
        mov ECX, [EBP + 12]; N

@L2:    push dword ptr [EBP + 16]
        push ESI
        call In_word
        add ESI, [EBP + 16]
        loop @L2

        pop ECX
        pop ESI

        pop EBP 

        ret 4*3
In_text endp

Out_word proc
        push EBP
        mov EBP, ESP

        push ESI
        push ECX 
        push EAX

        mov ESI, [EBP + 8]; Elem_of_Arr
        mov ECX, [EBP + 12]; K

@L3:    mov AL, [ESI]
        outchar AL
        inc ESI
        loop @L3 
        newline

        pop EAX
        pop ECX
        pop ESI

        pop EBP 

        ret 4*2
Out_word endp

Out_text proc 
        push EBP
        mov EBP, ESP

        push ESI
        push ECX 

        mov ESI, [EBP + 8]; Arr_of_words
        mov ECX, [EBP + 12]; N

@L4:    push dword ptr [EBP + 16]
        push ESI
        call Out_word
        add ESI, [EBP + 16]
        loop @L4

        pop ECX
        pop ESI

        pop EBP 

        ret 4*3
Out_text endp

Find_min_word proc
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
        jB @LLL 
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

        pop EBP 

        ret 4*3
Find_min_word endp

end 