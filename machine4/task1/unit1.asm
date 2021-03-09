include console.inc 
public In_Rec, Out_Rec, Less, Min_Date, Rec_to_Struc, Out_Struc, Ptr_to_Min_Date, Sort
Date_pack record D:5, M:4, Y:7
Date_unpack struc 
        D db ?
        M db ?
        Y db ?
Date_unpack ends
.code

Shift macro reg, A, M, SH ;; shift for record members
        mov reg, A
        and reg, mask M 
        for R, <SH>
                shr reg, width R
        endm
endm

Print0 macro A, M, SH ;; format output of record member
        local skip
        push EBX 
        mov EBX, A
        and EBX, mask M 
        for R, <SH>
                shr EBX, width R
        endm
        cmp EBX, 10 
        jNB skip
        outchar "0"
skip:   outword EBX 
        pop EBX
endm

Out_Mem macro struc, I ;; structure member output
        local skir
        push ECX
        mov ECX, struc 
        cmp (Date_unpack ptr [ECX]).&I, 10
        jNB skir
        outchar "0"
skir:   outword (Date_unpack ptr [ECX]).&I
        pop ECX 
endm

Mov_struc macro struc, rec, D, SH ;; move record member to structure
        push ESI 
        push EAX
        mov ESI, struc
        mov EAX, rec 
        and EAX, mask D
        for R, <SH>
                shr EAX, width R
        endm
        mov (Date_unpack ptr [ESI]).&D, AL 
        pop EAX 
        pop ESI 
endm

In_Rec proc 
        push EBP
        mov EBP, ESP
        push EBX
        push EAX
        inint AX
        for R, <M, Y>
                shl AX, width R 
                inint BX
                or AX, BX 
        endm
        mov EBX, [EBP + 8]
        mov Date_pack ptr [EBX], AX
        pop EAX
        pop EBX
        pop EBP
        ret 4
In_Rec endp

Out_Rec proc 
        push EBP
        mov EBP, ESP
        push EBX 
        Print0 [EBP + 8], D, <M, Y>
        outchar "."
        Print0 [EBP + 8], M, Y
        outchar "."
        Print0 [EBP + 8], Y
        pop EBX
        pop EBP 
        ret 4
Out_Rec endp

Less proc 
        push EBP
        mov EBP, ESP 
        push EBX 
        push ECX
        mov AL, 0
        Shift EBX, [EBP + 12], Y
        Shift ECX, [EBP + 8], Y
        cmp EBX, ECX
        jA @fin

        Shift EBX, [EBP + 12], M, Y
        Shift ECX, [EBP + 8], M, Y
        cmp EBX, ECX
        jA @fin

        Shift EBX, [EBP + 12], D, <M, Y>
        Shift ECX, [EBP + 8], D, <M, Y>
        cmp EBX, ECX
        jA @fin
        jmp @F 
@fin:   mov AL, 1
@@:     pop ECX
        pop EBX
        pop EBP
        ret 4*2
Less endp

Min_Date proc 
        push EBP
        mov EBP, ESP
        push ECX
        push ESI 
        push EBX

        mov ECX, 1
        xor EBX, EBX
        mov ESI, [EBP + 8]
        mov BX, [ESI]

@LL1:   add ESI, 2
        push EBX 
        movzx EDX, word ptr [ESI]
        push EDX
        call Less
        cmp AL, 0 
        jE @F 
        mov BX, [ESI]
@@:     add ECX, 1
        cmp ECX, [EBP + 12]
        jB @LL1 
        mov AX, BX

        pop EBX
        pop ESI 
        pop ECX 
        pop EBP 
        ret 4*2
Min_Date endp

Rec_to_Struc proc 
        push EBP 
        mov EBP, ESP

        Mov_struc [EBP + 12], [EBP + 8], Y
        Mov_struc [EBP + 12], [EBP + 8], M, Y
        Mov_struc [EBP + 12], [EBP + 8], D, <M, Y>

        pop EBP 
        ret 4*2
Rec_to_Struc endp

Out_Struc proc 
        push EBP 
        mov EBP, ESP  

        Out_Mem [EBP + 8], D
        outchar "."
        Out_Mem [EBP + 8], M
        outchar "."
        Out_Mem [EBP + 8], Y
 
        pop EBP 
        ret 4
Out_Struc endp

Ptr_to_Min_Date proc 
        push EBP
        mov EBP, ESP
        push ECX
        push ESI 
        push EBX
        push EDI

        mov ECX, 1
        xor EBX, EBX
        mov ESI, [EBP + 8]
        mov BX, [ESI]
        mov EDI, ESI

@LL2:   add ESI, 2
        push EBX 
        movzx EDX, word ptr [ESI]
        push EDX
        call Less
        cmp AL, 0 
        jE @F 
        mov BX, [ESI]
        mov EDI, ESI
@@:     add ECX, 1
        cmp ECX, [EBP + 12]
        jB @LL2 

        mov EAX, EDI

        pop EDI
        pop EBX
        pop ESI 
        pop ECX 
        pop EBP 
        ret 4*2
Ptr_to_Min_Date endp

Sort proc
        push EBP
        mov EBP, ESP 
        push ESI
        push ECX
        push EBX
        push EDX
        push EAX
        push EDI

        mov ESI, [EBP + 8]
        xor ECX, ECX
        xor EDX, EDX

@S1:    mov EDI, [EBP + 12]
        sub EDI, ECX 
        push EDI 
        add ESI, EDX 
        push ESI
        call Ptr_to_Min_Date
        mov BX, [EAX]
        Xchg BX, [ESI]
        mov [EAX], BX
        sub ESI, EDX
        inc ECX
        add EDX, 2
        mov EDI, [EBP + 12]
        dec EDI
        cmp ECX, EDI
        jB @S1 

        pop EDI
        pop EAX
        pop EDX 
        pop EBX 
        pop ECX 
        pop ESI
        pop EBP 
        ret 4*2 
Sort endp
        exit
end