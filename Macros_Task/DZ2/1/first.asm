include console.inc 
NULL1 macro r32, N:=<10>, T:=<BYTE>, i:=<0>
        if i LE N - 1
                ifidni <T>, <BYTE>
                        mov [r32][i], 0
                else 
                ifidni <T>, <WORD>
                        mov T ptr [r32 + 2 * i], 0
                else 
                ifidni <T>, <DWORD> 
                        mov T ptr [r32][4 * i], 0
                else 
                ifidni <T>, <QWORD> 
                        mov dword ptr[r32][i * 8], 0
                        mov dword ptr [r32][i * 8] + 4, 0
                endif
                endif 
                endif 
                endif
        endif
endm
.data 
        Y DD 8 dup (?)
.code 
start:
        lea EAX, Y
        .LISTMACRO
        NULL1 EAX, 10-2, DWORD, %10-7
        .NOLISTMACRO
        exit
end start