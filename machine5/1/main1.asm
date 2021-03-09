include console.inc 
extern Power2@0: proc
.data 
        X dd ? ;б\зн
        Res db ?; с\зн
.code 
start:  
        inint X

        push offset Res 
        push X
        call Power2@0
        outint Res 
        exit
end start