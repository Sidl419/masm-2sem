include console.inc 
.data 

.code 
start:
        mov EBX, 1000
        inint EAX
        cmp EAX, 10000000
        jB next
        cmp EAX, 100000000
        jAE next
        mov EDX, 0
        div EBX
        mul EBX
        add EAX, 123
next:   outword EAX
        pause
        exit
end start