include console.inc 
TIME struc 
        H db ?
        M db ?
        S db ?
TIME ends
.data 
        T1 TIME <23, 59, 58>
        T2 TIME <>
.code 
start:
        inc T1.S 
        cmp T1.S, 60
        jNE next
        mov T1.S, 0
        inc T1.M
        cmp T1.M, 60
        jNE next 
        mov T1.M, 0
        inc T1.H
        cmp T1.H, 24
        jNE next 
        mov T1.H, 0

next:   mov AL, T1.S 
        mov T2.S, AL
        mov AL, T1.M 
        mov T2.M, AL
        mov AL, T1.H 
        mov T2.H, AL

        inc T2.S 
        cmp T2.S, 60
        jNE next1
        mov T2.S, 0
        inc T2.M
        cmp T2.M, 60
        jNE next1
        mov T2.M, 0
        inc T2.H
        cmp T2.H, 24
        jNE next1
        mov T2.H, 0

next1:  outword T1.H 
        outword T1.M,, ":"
        outwordln T1.S,, ":"

        outword T2.H 
        outword T2.M,, ":"
        outwordln T2.S,, ":"

        pause
        exit
end start