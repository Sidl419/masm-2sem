include console.inc 
public Power2

.code 
Power2 proc

        push EBP
        mov EBP, ESP

        push EAX 
        push EBX
        push ECX
        push ESI


        mov ESI, [EBP + 8]; X
        mov EBX, [EBP + 12]; offset Res

        mov ECX, 32
        mov EDX, 1
        mov AL, -1

@L:     xor ESI, EDX
        jZ @res
        xor ESI, EDX
        shl EDX, 1
        loop @L
        jmp @F

@res:   sub ECX, 32
        neg ECX
        mov AL, CL

@@:     mov byte ptr [EBX], AL

        pop ESI
        pop ECX
        pop EBX
        pop EAX 

        pop EBP 

        ret 4*2

Power2 endp
end