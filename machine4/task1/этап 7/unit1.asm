include console.inc 
public In_Rec, Out_Rec, Less, Min_Date, Rec_to_Struc, Out_Struc, Ptr_to_Min_Date, Sort
Date_pack record D:5, M:4, Y:7
Date_unpack struc 
        D db ?
        M db ?
        Y db ?
Date_unpack ends
.code
In_Rec proc 
        push EBP
        mov EBP, ESP
        push EBX
        push EAX
        inint AX
        shl AX, width M 
        inint BX
        or AX, BX 
        shl AX, width Y
        inint BX
        or AX, BX
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

        mov EBX, [EBP + 8]
        and EBX, mask D 
        shr EBX, width M
        shr EBX, width Y
        cmp EBX, 10
        jNB @skip1
        outchar "0"
@skip1: outword EBX
        outchar "."

        mov EBX, [EBP + 8]
        and BX, mask M 
        shr BX, width Y
        cmp BX, 10
        jNB @skip2
        outchar "0"
@skip2: outword BX
        outchar "."

        mov EBX, [EBP + 8]
        and EBX, mask Y 
        cmp EBX, 10
        jNB @skip3
        outchar "0"
@skip3: outword EBX
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
        mov EBX, [EBP + 12]
        and EBX, mask Y
        mov ECX, [EBP + 8]
        and ECX, mask Y
        ;outwordln ECX
        ;outwordln EBX
        cmp EBX, ECX
        jA @fin

        mov ECX, [EBP + 8]
        and ECX, mask M
        shr ECX, width Y
        mov EBX, [EBP + 12]
        and EBX, mask M 
        shr EBX, width Y
        ;outwordln ECX
        ;outwordln EBX
        cmp EBX, ECX
        jA @fin

        mov ECX, [EBP + 8]
        and ECX, mask D
        shr ECX, width M
        shr ECX, width Y
        mov EBX, [EBP + 12]
        and EBX, mask D 
        shr EBX, width M
        shr EBX, width Y
        ;outwordln ECX
        ;outwordln EBX
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
        push ESI 
        push EAX 
        mov ESI, [EBP + 12]
        mov AX, [EBP + 8]
        and EAX, mask Y
        mov (Date_unpack ptr [ESI]).Y, AL 
        mov EAX, [EBP + 8]
        and EAX, mask M
        shr EAX, width Y
        mov (Date_unpack ptr [ESI]).M, AL 
        mov EAX, [EBP + 8]
        and EAX, mask D
        shr EAX, width M
        shr EAX, width Y
        mov (Date_unpack ptr [ESI]).D, AL
        pop EAX 
        pop ESI 
        pop EBP 
        ret 4*2
Rec_to_Struc endp

Out_Struc proc 
        push EBP 
        mov EBP, ESP 
        push ECX 
        push EBX
        mov ECX, [EBP + 8]
        mov BL, (Date_unpack ptr [ECX]).D
        cmp BL, 10
        jNB @skir1
        outchar "0"
@skir1: outword EBX
        outchar "."

        mov ECX, [EBP + 8]
        mov BL, (Date_unpack ptr [ECX]).M
        cmp BL, 10
        jNB @skir2
        outchar "0"
@skir2: outword BX
        outchar "."

        mov ECX, [EBP + 8]
        mov BL, (Date_unpack ptr [ECX]).Y
        cmp BL, 10
        jNB @skir3
        outchar "0"
@skir3: outword EBX
        pop EBX 
        pop ECX
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
        ;outwordln 11111
        mov EDI, ESI
@LL2:   add ESI, 2
        push EBX 
        movzx EDX, word ptr [ESI]
        push EDX
        call Less
        cmp AL, 0 
        jE @F 
        ;outintln 1111
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
        ;mov EAX, ESI
        add ESI, EDX 
        push ESI
        call Ptr_to_Min_Date
        ;outintln 1111
        mov BX, [EAX]
        Xchg BX, [ESI];[EDX]
        mov [EAX], BX
        sub ESI, EDX
        ;outintln 2222
        inc ECX
        add EDX, 2
        mov EDI, [EBP + 12]
        dec EDI
        cmp ECX, EDI;[EBP + 12]
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