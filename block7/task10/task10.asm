include console.inc 
.data
        N equ 30 
        X dd N dup(?) ;с\зн
.code 
start:  
        clrscr 
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 5 (block 4) "Reverse"'

        outstr "Enter chararacters sequence: "
        call REVERSE 
        pause 
        exit 

        REVERSE proc
                push EAX
                inchar AL
                cmp AL, "."
                jE res
                call REVERSE
                outchar AL
        res:    pop EAX
                ret
        REVERSE endp
end start 