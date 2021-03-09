include console.inc 
NM macro X, a, b, L
        cmp X, a
        jB L
        cmp X, b 
        jA L
endm
ADD1 macro X, b, L
        mov EAX, 1
        add X, EAX
        cmp X, b 
        jNA L
        mov EAX, 0
        mov X, EAX 
endm
.data 
.code 
start:
        inint EBX; H
        inint ECX; M
        inint EDX; S
        .LISTMACRO
        NM EBX, 0, 23, err
        NM ECX, 0, 59, err
        NM EDX, 0, 59, err
        ADD1 EDX, 59, res
        ADD1 ECX, 59, res
        ADD1 EBX, 23, res 
        .NOLISTMACRO
res:    outword EBX
        outword ECX,, ":"
        outword EDX,, ":"
        jmp @F
err:    outstr "Error"
@@:
        exit
end start