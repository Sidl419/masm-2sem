include console.inc 
.data 

.code 
start:
        inint EBX
        mov EAX, EBX
        mov EDX, 0
        mov EDI, 100
        mov ECX, 4
        div EDI
        cmp EDX, 0
        jE check
        mov EDX, 0
        mov ESI, EAX
        mov EAX, EBX
        div ECX
        cmp EDX, 0
        jE res
        mov EDX, 0
        outstr "NO"
        jmp fin
check:  mov EAX, ESI
        div ECX
        cmp EDX, 0
        jE res
        outstr "NO"
        jmp fin
res:    outstr "YES"
fin:    pause
        exit
end start