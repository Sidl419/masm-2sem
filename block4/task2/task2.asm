include console.inc 
.data 
        MaxSize equ 150
        n db ?
        m db ?
        X dw MaxSize dup (?)
.code 
start:
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 2 (block 4) points 1) to 5)'
L:      clrscr
        inint n, "Enter size "
        inint m
        mov EAX, dword ptr n
        mul m 
        cmp EAX, MaxSize
        jNA fin
        outstrln "Matrix is too big. Would you like to enter another values? (Y/N) "
        inchar DL
        cmp DL, "Y"
        jNE last 
        jmp L
fin:    flush
        xor EDX, EDX
        xor EBX, EBX
L1:     xor DL, DL
L2:     mov EAX, EBX
        mul m 
        add EAX, EDX
        inint X[4*EAX]
        inc DL
        cmp DL, m
        jNE L2
        inc EBX
        cmp BL, n 
        jNE L1
        xor EAX, EAX
        xor EBX, EBX
        mov AL, m 
        mov BL, n
        push EAX 
        push EBX 
        push offset X 
        call WriteMatrix
        push EAX
        push EBX
        push offset X
        call AboveOrEq
        push EAX
        push EBX
        push offset X
        call Symm
        push EAX
        push EBX
        push offset X
        call SameColumn
        cmp AL, BL
        jNE last 
        push EBX
        push offset X 
        call MainDiag
        push EBX
        push offset X 
        call AddDiag
        newline
        outstr "Would you like to enter another matrix? (Y/N) "
        inchar DL
        cmp DL, "Y"
        jE L 
last:   
        pause
        exit

WriteMatrix proc ;(X, n, m)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        mov EDI, [EBP + 8]
        newline
        xor EBX, EBX
@L11:   xor ESI, ESI
@L12:   mov EAX, EBX
        mul dword ptr [EBP + 16] 
        add EAX, ESI
        outint [EDI + 4*EAX],, " "
        inc ESI
        cmp ESI, [EBP + 16]
        jNE @L12
        inc EBX
        newline
        cmp EBX, [EBP + 12] 
        jNE @L11
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
WriteMatrix endp

AboveOrEq proc ;(X, n, m)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        push ECX
        mov EDI, [EBP + 8]
        newline
        outstr "1) "
        xor EBX, EBX
@L21:   xor ESI, ESI
        mov ECX, 80000000h
@L22:   mov EAX, EBX
        mul dword ptr [EBP + 16] 
        add EAX, ESI
        cmp [EDI + 4*EAX], ECX 
        jL @skip
        mov ECX, [EDI + 4*EAX]
        inc ESI
        cmp ESI, [EBP + 16]
        jNE @L22
        inc EBX
        outint EBX,, " "
        dec EBX
@skip:  inc EBX
        cmp EBX, [EBP + 12] 
        jNE @L21
        pop ECX
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
AboveOrEq endp

Symm proc ;(X, n, m)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        push ECX
        push EDX
        mov EDI, [EBP + 8]
        newline
        outstr "2) "
        xor EBX, EBX
@L51:   xor ESI, ESI
@L52:   mov EAX, EBX
        mul dword ptr [EBP + 16] 
        mov ECX, EAX
        add ECX, [EBP + 16]
        sub ECX, ESI
        sub ECX, 1
        add EAX, ESI 
        mov ECX, [EDI + 4*ECX]
        cmp [EDI + 4*EAX], ECX
        jNE @skip
        inc ESI
        mov EAX, [EBP + 16]
        mov ECX, 2
        idiv ECX
        cmp ESI, EAX
        jNE @L52
        inc EBX
        outint EBX,, " "
        dec EBX
@skip:  inc EBX
        cmp EBX, [EBP + 12] 
        jNE @L51
        pop EDX
        pop ECX
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
Symm endp

SameColumn proc ;(X, n, m)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        push ECX
        mov EDI, [EBP + 8]
        newline
        outstr "3) "
        xor EBX, EBX
@L61:   xor ESI, ESI
        mov EAX, ESI
        mul dword ptr [EBP + 16] 
        add EAX, EBX
        mov ECX, [EDI + 4*EAX]
        inc ESI
@L62:   mov EAX, ESI
        mul dword ptr [EBP + 16] 
        add EAX, EBX
        cmp [EDI + 4*EAX], ECX 
        jNE @skip
        mov ECX, [EDI + 4*EAX]
        inc ESI
        cmp ESI, [EBP + 16]
        jNE @L62
        inc EBX 
        outint EBX,, " "
        dec EBX
@skip:  inc EBX
        cmp EBX, [EBP + 12] 
        jNE @L61
        pop ECX
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
SameColumn endp

MainDiag proc ;(X, n)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        mov EDI, [EBP + 8]
        newline
        outstr "4) "
        xor EBX, EBX
@L31:   xor ESI, ESI
@L32:   mov EAX, EBX
        mul dword ptr [EBP + 12] 
        add EAX, ESI
        cmp ESI, EBX 
        jNE @skip
        outint [EDI + 4*EAX],, " "
@skip:  inc ESI
        cmp ESI, [EBP + 12]
        jNE @L32
        inc EBX
        cmp EBX, [EBP + 12] 
        jNE @L31
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
MainDiag endp

AddDiag proc ;(X, n)
        push EBP
        mov EBP, ESP
        push EDI
        push EBX
        push ESI
        push EAX
        push ECX
        mov EDI, [EBP + 8]
        newline
        outstr "5) "
        xor EBX, EBX
@L41:   xor ESI, ESI
@L42:   mov EAX, EBX
        mul dword ptr [EBP + 12] 
        add EAX, ESI
        mov ECX, ESI
        add ECX, EBX
        add ECX, 1
        cmp ECX, [EBP + 12]
        jNE @skip
        outint [EDI + 4*EAX],, " "
@skip:  inc ESI
        cmp ESI, [EBP + 12]
        jNE @L42
        inc EBX
        cmp EBX, [EBP + 12] 
        jNE @L41
        pop ECX
        pop EAX
        pop ESI
        pop EBX
        pop EDI
        pop EBP
        ret 3 * 4
AddDiag endp

end start