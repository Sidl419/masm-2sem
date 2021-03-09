include console.inc 
.data 

.code 
start:
        mov EDX, 0
        mov EAX, 1
        mov EBX, 1
next:   inc EBX
        mov ECX, EAX
        mul EBX
        jNC next
        dec EBX
        outwordln EBX,,"n = "
        outwordln ECX,,"n != "
        pause
        exit
end start