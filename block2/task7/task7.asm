include console.inc 
.data 
        N equ 4
        M equ 6
        A dd N dup(M dup(?))
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 7 (block 2) "Matrix min element"'
        mov             ESI,            M
        mov             ECX,            N * M - 1
        mov             EBX,            1
        mov             EDX,            1
        inint           A[0]
        mov             EDI,            A[0]
@@:     inint           A[4*EBX]
        cmp             A[4*EBX],         EDI
        jGE             next
        mov             EDI,            A[4*EBX]
        mov             EDX,            1
next:   jNE             count
        inc             EDX
count:  inc             EBX
        loop            @B

        outint          EDI,,           "min "
        newline
        outint          EDX,,           "times "
        newline

        mov             ECX,                    0
L:       
        mov             EBX,                    0
@@:     
        mov             EAX,                    ECX
        mul             ESI
        add             EAX,                    EBX
        cmp             A[4*EAX],               EDI
        jNE             print 
        inc             ECX
        inc             EBX
        outint          ECX,,                   "["
        outint          EBX,,                   ", "
        dec             ECX
        dec             EBX
        outstr          "]    "
print:  inc             EBX
        cmp             EBX,                    M
        jNE             @B
        inc             ECX
        cmp             ECX,                    N 
        jNE             L
        pause
        exit
end start