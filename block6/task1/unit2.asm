include console.inc 
public outmain
extern X: dword, start: near
.code 
outmain:
        newline
        outstr "This number in decimal system: "
        outword X
        pause
        exit
end start