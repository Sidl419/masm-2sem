include console.inc 
.data 
        N equ 100
        S db N dup(?)
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 1 (block 4)'
        push offset S 
        call ReadText

        push EAX 
        push offset S
        call MaxLet

        outchar AL
        
        pause
        exit

ReadText proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX

        mov EBX, [EBP + 8]
        xor EAX, EAX 
@L:     inchar CL 
        cmp CL, "."
        jE @fin
        mov [EBX + EAX], CL
        inc EAX
        jmp @L

@fin:   pop ECX
        pop EBX
        pop EBP
        ret 4
ReadText endp

MaxLet proc
        push EBP
        mov EBP, ESP
        sub ESP, 28
        push ECX
        push EBX
        push ESI
        push EDX

        mov EBX, [EBP + 8]
        mov ECX, 26
        xor ESI, ESI
@L1:    mov [EBP - 28 + ESI], 0
        inc ESI
        loop @L1
        mov ECX, [EBP + 12]
        xor ESI, ESI
        xor EDX, EDX
@L2:    mov DL, [EBX + ESI]
        cmp DL, "a"
        jB @skip
        cmp DL, "z"
        jA @skip
        sub DL, "a"
        inc byte ptr [EBP - 28 + EDX]
@skip:  inc ESI
        loop @L2
        mov ECX, 26
        xor ESI, ESI
@L3:    mov DL, byte ptr [EBP - 29 + ECX]
        cmp EDX, ESI
        jNA @gre
        mov ESI, EDX
        mov AL, CL 
        sub AL, 1
@gre:   loop @L3
        add AL, "a"

        pop EDX
        pop ESI
        pop EBX
        pop ECX
        
        mov ESP, EBP
        pop EBP
        ret 2 * 4
MaxLet endp

end start