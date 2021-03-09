include console.inc 
extern In_Rec@0: proc, Out_Rec@0: proc, Less@0: proc, Min_Date@0: proc, Rec_to_Struc@0: proc, Out_Struc@0: proc, Ptr_to_Min_Date@0: proc, Sort@0: proc
Date_pack record D:5, M:4, Y:7
Date_unpack struc 
        D db ?
        M db ?
        Y db ?
Date_unpack ends
.data 
        Step = 1
        D1 Date_pack <>
        D2 Date_pack <>
        N equ 6
        Arr_of_Rec Date_pack N dup (<>)
        Arr_of_Struc Date_unpack N dup(<>)
.code
start:  clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) machine 4 "Stage 5"'
        if Step EQ 1 
        outstr "Enter 2 dates for debugging: "
        push offset D1
        call In_Rec@0
        push offset D2
        call In_Rec@0
        movzx ECX, D2
        movzx EBX, D1 
        push ECX
        push EBX
        call Less@0
        outstr "equation "
        push D1
        call Out_Rec@0
        outchar " "
        outchar 60
        outchar " "
        push D2
        call Out_Rec@0
        outstr " is"
        cmp AL, 1 
        jE print 
        outstr " false"
        jmp skip
print:  outstr " true"
skip:
        else 
        outstr "Enter 6 dates: "
        mov ECX, 0 
        mov EAX, N
        mov ESI, 2;width Date_pack
        mul ESI
        mov ESI, EAX
L1:     lea EDI, Arr_of_Rec
        add EDI, ECX
        push EDI
        call In_Rec@0
        add ECX, 2; width Date_pack
        cmp ECX, ESI
        jB L1 

        newline
        outstrln "Format output: "
        mov ECX, 0
L2:     mov EAX, 2;width Date_pack
        mul ECX
        push Arr_of_Rec[EAX]
        call Out_Rec@0
        newline
        inc ECX 
        cmp ECX, N 
        jB L2

        newline
        mov ECX, 0
L3:     mov EAX, 2;width Date_pack
        mul ECX
        movzx EBX, Arr_of_Rec[EAX]
        inc ECX
        add EAX, 2;width Date_pack
        movzx EDX, Arr_of_Rec[EAX]
        push EDX 
        push EBX 
        call Less@0
        cmp AL, 0
        jE res
        cmp ECX, N-1
        jB L3
        xor AH, AH
        xor AX, AX
res:    outintln EAX,, "Dates ordered by increase: "

        newline
        xor EAX, EAX
        push N 
        push offset Arr_of_Rec
        call Min_Date@0
        outstrln "Minimal date: "
        push EAX 
        call Out_Rec@0
        newline

        mov ECX, 0 
        mov EAX, N
        mov ESI, 2;width Date_pack
        mul ESI
        mov ESI, EAX
B1:     
        shr ECX, 1
        mov EAX, ECX 
        mov EBX, type Date_unpack
        mul EBX 
        lea EDI, Arr_of_Struc
        add EDI, EAX
        push EDI
        shl ECX, 1
        movzx EDX, Arr_of_Rec[ECX]
        push EDX
        call Rec_to_Struc@0
        add ECX, 2; width Date_pack
        cmp ECX, ESI
        jB B1 
        newline

        outstrln "Structure output: "
        mov ECX, 0
B2:     mov EAX, type Date_unpack
        mul ECX
        lea ESI, Arr_of_Struc
        add ESI, EAX
        push ESI
        call Out_Struc@0
        newline
        inc ECX 
        cmp ECX, N 
        jB B2

        newline
        outstrln "Sorted array: "
        push N 
        push offset Arr_of_Rec
        call Sort@0 
        mov ECX, 0
G2:     mov EAX, 2;width Date_pack
        mul ECX
        push Arr_of_Rec[EAX]
        call Out_Rec@0
        newline
        inc ECX 
        cmp ECX, N 
        jB G2
        endif
        pause
        exit
end start