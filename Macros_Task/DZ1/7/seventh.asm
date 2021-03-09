include console.inc 
MOVE macro X, N, V:=<0>
        mov AL, V
        mov X + (N - 1)*(type X), 0
        mov byte ptr X + (N - 1)*(type X), AL
endm
.data 
        Y db 100 dup (?)
.code 
start:
        MOVE Y, 98+2
        exit
end start