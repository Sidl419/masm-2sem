include console.inc
;a)
QMOV macro X, Y
        mov EAX, dword ptr Y
        mov dword ptr X, EAX
        mov EAX, dword ptr Y + 4
        mov dword ptr X + 4, EAX
endm
;b)
QADD macro X, Y, Z
        mov EAX, dword ptr Y
        add EAX, dword ptr X
        mov dword ptr Z, EAX
        mov EAX, dword ptr Y + 4
        adc EAX, dword ptr X + 4
        mov dword ptr Z + 4, EAX
endm
;c)
QSUB macro X, Y, Z
        mov EAX, dword ptr Y
        sub EAX, dword ptr X
        mov dword ptr Z, EAX
        mov EAX, dword ptr Y + 4
        sbb EAX, dword ptr X + 4
        mov dword ptr Z + 4, EAX
endm
;d)
QJNE macro X, Y, L
        mov EAX, dword ptr Y
        cmp EAX, dword ptr X
        jNE L
        mov EAX, dword ptr Y + 4
        cmp dword ptr X + 4, EAX
        jNE L
endm
.data 
        X dq ?
        Y dq ?
        Z dq ?
.code 
start:  
        mov EAX, 0
        mov dword ptr Z, EAX
        mov dword ptr Z + 4, EAX
        outwordln Z
        mov EAX, 10
        mov dword ptr X, EAX
        mov dword ptr X + 4, 0
        mov EAX, 10
        mov dword ptr Y, EAX
        add EAX, 10
        mov dword ptr Y + 4, EAX
        QADD X, Y, Z
        outword dword ptr Z
        mov EAX, (dword ptr Z + 4)
        mov EBX, 0FFFFFFFFh
        mul EBX
        outword EBX
        exit
end start