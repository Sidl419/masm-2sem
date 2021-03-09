include console.inc 
.data 
        N dd ?
        P db "Prime", 0
        C db "Composite", 0
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 2 (block 1) "Prime Number"'
        mov EBX, offset C 
        mov ECX, 2
        inint N, "Enter a number greater than 1 "
        mov EDX, 0
        mov EAX, N
        div ECX
        mov ESI, EAX            ;ESI := N div 2
        cmp ESI, 1              ;ESI = 1 => prime
        jE prime
L:      cmp EDX, 0              ;N mod ESI = 0 => fin
        jE fin
        cmp ECX, ESI            ;ESI = N div 2 => prime
        jE prime
        inc ECX
        mov EDX, 0
        mov EAX, N
        div ECX
        jmp L
prime:  mov EBX, offset P 
fin:    outstr EBX
        pause
        exit
end start