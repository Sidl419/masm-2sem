include console.inc 
public In4, Out4
.code 
        In4 proc
        push EBP 
        mov EBP, ESP
        push EBX
        push EAX
        xor EAX, EAX
        xor EBX, EBX
@L:     inchar BL
        cmp BL, " "
        jE @fin
        sub BL, "0"
        shl EAX, 2
        or EAX, EBX
        jmp @L
@fin:   mov EBX, [EBP + 8]
        mov [EBX], EAX
        pop EAX
        pop EBX
        pop EBP
        ret 4
        In4 endp

        Out4 proc
        push EBP
        mov EBP, ESP 
        push EAX 
        push ECX
        push EBX
        mov ECX, 16
        mov EAX, [EBP + 8]
@L1:    rol EAX, 2
        mov EBX, 11b
        and EBX, EAX
        outword EBX
        loop @L1
        pop EBX
        pop ECX 
        pop EAX 
        pop EBP 
        ret 4
        Out4 endp
end
