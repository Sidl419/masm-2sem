include console.inc 
.data 

.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 2 (block 3) "Max/MinB"'
        mov EAX, 0
L:      inchar AL
        cmp AL, "."
        jE res
        cmp AL, "M"
        jE stack
        cmp AL, "m"
        jE stack
        cmp AL, "0"
        jB skip
        cmp AL, "9"
        jA skip
stack:  push  EAX
        jmp L
skip:   cmp AL, ")"
        jNE L
        pop EBX
        pop ESI
        pop ECX
        cmp CL, "M"
        jNE other
        cmp EBX, ESI
        jA first
        mov EBX, ESI
first:  push EBX
        jmp L
other:  cmp EBX, ESI
        jB second
        mov EBX, ESI
second: push EBX
        jmp L
res:    pop EAX
        outchar AL
        pause
        exit
end start