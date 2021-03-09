include console.inc
DEF macro X, T:=<Q>, N:=<5+2>, M:=<8-3>, V:vararg
        X D&T V
        mov EAX, X + V*D&T
L:      
endm