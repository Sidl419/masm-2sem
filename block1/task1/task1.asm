include console.inc 
.code
start:  
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) Task 1 (Block 1) "Power of three"'
        inintln EAX, "Enter a number greater or equal than 1 "
        mov ECX, 3
        mov EBX, 0      ;K := 0
L:      mov EDX, 0
        cmp EAX, 1      ;N = 1 => fin
        jE fin
        div ECX         ;N div 3
        cmp EDX, 0      ;N mod 3 = 0 => next
        jNE next 
        inc EBX         ;K := K + 1
        jmp L
next:   mov EBX, -1     ; K := -1
fin:    outint EBX,, "Entered number is a power "
        pause
        exit
end start