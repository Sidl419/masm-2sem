include console.inc 
extern In_Rec@0: proc, Out_Rec@0: proc, Less@0: proc, Min_Date@0: proc, Rec_to_Struc@0: proc, Out_Struc@0: proc, Ptr_to_Min_Date@0: proc, Sort@0: proc
Date_pack record D:5, M:4, Y:7
Date_unpack struc 
        D db ?
        M db ?
        Y db ?
Date_unpack ends
.data 
        Step = 0
        D1 Date_pack <>
        D2 Date_pack <>
        N equ 6
        Arr_of_Rec Date_pack N dup (<>)
        Arr_of_Struc Date_unpack N dup(<>)
.code
        Procedure macro proced, params
                for P, <params>
                        push P
                endm
                call proced
        endm

start:  clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) machine 4 "Stage 9"'
        if Step EQ 1 

        outstr "Enter 2 dates for debugging: "
        Procedure In_Rec@0, offset D1
        Procedure In_Rec@0, offset D2

        movzx ECX, D2
        movzx EBX, D1 
        Procedure Less@0, <ECX, EBX>
        
        outstr "equation "
        Procedure Out_Rec@0, D1
        outchar " "
        outchar 60
        outchar " "
        Procedure Out_Rec@0, D2
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
        mov ESI, 2
        mul ESI
        mov ESI, EAX

L1:     lea EDI, Arr_of_Rec
        add EDI, ECX
        Procedure In_Rec@0, EDI
        add ECX, 2
        cmp ECX, ESI
        jB L1 

        newline
        outstrln "Format output: "
        mov ECX, 0
L2:     mov EAX, 2
        mul ECX
        Procedure Out_Rec@0, Arr_of_Rec[EAX]
        newline
        inc ECX 
        cmp ECX, N 
        jB L2

        newline
        mov ECX, 0
L3:     mov EAX, 2
        mul ECX
        movzx EBX, Arr_of_Rec[EAX]
        inc ECX
        add EAX, 2
        movzx EDX, Arr_of_Rec[EAX]
        Procedure Less@0, <EDX, EBX>
        cmp AL, 0
        jE res
        cmp ECX, N-1
        jB L3
        movzx ECX, AL
res:    outintln ECX,, "Dates ordered by increase: "

        newline
        xor EAX, EAX
        Procedure Min_Date@0, <N, offset Arr_of_Rec>
        outstrln "Minimal date: "
        Procedure Out_Rec@0, EAX
        newline

        mov ECX, 0 
        mov EAX, N
        mov ESI, 2
        mul ESI
        mov ESI, EAX
B1:     
        shr ECX, 1
        mov EAX, ECX 
        mov EBX, type Date_unpack
        mul EBX 
        lea EDI, Arr_of_Struc
        add EDI, EAX
        shl ECX, 1
        movzx EDX, Arr_of_Rec[ECX]
        Procedure Rec_to_Struc@0, <EDI, EDX>
        add ECX, 2
        cmp ECX, ESI
        jB B1 
        newline

        outstrln "Structure output: "
        mov ECX, 0
B2:     mov EAX, type Date_unpack
        mul ECX
        lea ESI, Arr_of_Struc
        add ESI, EAX
        Procedure Out_Struc@0, ESI
        newline
        inc ECX 
        cmp ECX, N 
        jB B2

        newline
        outstrln "Sorted array: "
        Procedure Sort@0, <N, offset Arr_of_Rec>
        mov ECX, 0
G2:     mov EAX, 2
        mul ECX
        Procedure Out_Rec@0, Arr_of_Rec[EAX]
        newline
        inc ECX 
        cmp ECX, N 
        jB G2
        endif
        pause
        exit
end start