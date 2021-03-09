include console.inc 
DATE struc
        Y dw 1997
        M db ?
        D db ?
        WD db "sunday   "
DATE ends
.data 
        D1 DATE <1945, 5, 13, "wednesday">
        D2 DATE <, 12,, "thursday">
        D3 DATE <>
        D4 DATE <>
.code 
start:
        outwordln type D1
        outwordln type DATE.Y
        outwordln type DATE.D 
        outwordln type DATE.WD
        pause
        exit
end start