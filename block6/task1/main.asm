include console.inc 
public X, start
extern outmain: near, In4@0: proc, Out4@0: proc
.data 
        X dd ?
.code 
start:
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 1 (block 6) "Quaternary Input/Output"'
        outstr "Enter quaternary number: "
        push offset X
        call In4@0
        push X
        outstr "Same number: "
        call Out4@0
        jmp outmain
end