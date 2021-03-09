include console.inc
.data
        z2 db "неуд", 0
        z3 db "удовл", 0
        z4 db "хорошо", 0
        z5 db "отлично", 0
        adr dd z2, z3, z4, z5
.code 
start:  
        clrscr
        ConsoleTitle 'Sidorov Leonid (gr. 112) task 2 (block 2) "Marks"'
        inint           EBX
        outstr          adr[4*EBX - 8]
        pause
        exit
end start