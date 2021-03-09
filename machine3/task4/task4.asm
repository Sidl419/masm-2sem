include console.inc 
.code 
start:
        mov EAX, 1
        xor EBX, EBX
L:      shl EAX, 1
        inc EBX
        cmp EAX, 100000000
        jB L
        outword EAX
        newline 
        outword EBX
        pause
        exit
end start