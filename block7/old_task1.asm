include console.inc 
Sum macro Res:=<EAX>, Terms:vararg
        local count
        count = 0
        for reg, <EAX, EBX, ECX, EDX, ESI, EDI, EBP>
                ifidni <Res>, <reg>
                        count = count + 1
                endif
        endm
        if count EQ 0 
                outstr "Error. Res isn't r32"
                .err "Error. Res isn't r32"
                exitm
        endif
        ifdifi <Res>, <ESI>
                push ESI                
        else 
                push ECX                  
        endif
        ifdifi <Res>, <EDX>
                push EDX   
                mov EDX, Res             
        else 
                push ECX   
                mov ECX, Res               
        endif
        count = 0
        for K, <Terms>
                local flag, sec
                ifdifi <K>, <>
                        if type K EQ 0
                                count = count + K
                        else 
                                flag = 0
                                ifidni <Res>, <K>
                                        ifdifi <Res>, <EDX>
                                                add Res, EDX             
                                        else 
                                                add Res, ECX             
                                        endif
                                else
                                        for F, <A, B, C, D>
                                                ifidni <Res>, <E&F&X>
                                                        for S, <L, X, H>
                                                                ifidni <K>, <&F&S&>
                                                                        ifdifi <Res>, <ESI>
                                                                                ifdifi <Res>, <EDX>
                                                                                        movzx ESI, D&S
                                                                                        add Res, ESI   
                                                                                        flag = 1   
                                                                                else 
                                                                                        movzx ESI, C&S
                                                                                        add Res, ESI   
                                                                                        flag = 1
                                                                                endif             
                                                                        else 
                                                                                movzx ECX, D&S
                                                                                add Res, ECX   
                                                                                flag = 1   
                                                                        endif   
                                                                endif 
                                                        endm 
                                                endif 
                                        endm
                                        sec = 0
                                        if not flag
                                                if type K EQ 4
                                                        ifdifi <K>, <ESI>
                                                                ifdifi <K>, <ECX>
                                                                        ifdifi <K>, <EDX>
                                                                                add Res, K
                                                                        endif 
                                                                endif
                                                        endif 
                                                else
                                                        for GH, <DL, DH, DX, CL, CH, CX>
                                                                ifidni <K>, <GH>
                                                                        sec = 1
                                                                endif
                                                        endm
                                                        if sec EQ 0
                                                                ifdifi <Res>, <ESI>
                                                                        movzx ESI, K
                                                                        add Res, ESI                
                                                                else 
                                                                        movzx ECX, K
                                                                        add Res, ECX              
                                                                endif
                                                        endif
                                                endif
                                        endif
                                endif
                        endif 
                endif
        endm
        if count NE 0
                add Res, count
        endif
        ifdifi <Res>, <EDX>
                pop EDX                
        else 
                pop ECX                  
        endif
        ifdifi <Res>, <ESI>
                pop ESI                
        else 
                pop ECX                  
        endif
        for K, <Terms>
                local sec1
                ifdifi <K>, <>
                        if type K EQ 4
                                ifdifi <K>, <Res>
                                        ifidni <K>, <ESI>
                                                add Res, K
                                        endif 
                                        ifidni <K>, <ECX>
                                                add Res, K
                                        endif
                                        ifidni <K>, <EDX>
                                                add Res, K
                                        endif 
                                endif
                        else
                                sec1 = 0
                                for GH, <DL, DH, DX, CL, CH, CX>
                                        ifidni <K>, <GH>
                                                sec1 = 1
                                        endif
                                endm
                                if sec1
                                        ifdifi <Res>, <ESI>
                                                push ESI
                                                movzx ESI, K
                                                add Res, ESI   
                                                pop ESI             
                                        else 
                                                push EDI
                                                movzx EDI, K
                                                add Res, EDI  
                                                pop EDI            
                                        endif
                                endif
                        endif
                endif
        endm
endm
.data
        K1 equ 1
        K2 equ 2
        K3 equ 3
        B1 db 10
        B2 db 20
        B3 db 30
        W1 dw 4000
        W2 dw 5000
        W3 dw 6000
        D1 dd 700000
        D2 dd 800000
        D3 dd 900000
.code
start:
        .LISTMACRO
        Sum EAX,<123456,K1,EBX,D1>
        Sum EAX,123456,K1,EBX,D1
        Sum ,123456,K1,EBX,D1
        Sum EAX,123456, ,K1,EBX,D1
        Sum EAX
        Sum
        Sum EAX,2,K2,B2,W2,D2
        Sum AL,1,2,3
        Sum CX,1,K2
        Sum K3,1,2,3
        Sum AL,1,2,3
        Sum B3,1,2,3
        Sum W3,1,2,3
        Sum ESP,1,2,3
        Sum EDX,1,B2,W2, ,K2,D3,123
        Sum ESI,AL,2,3,AH,K1,K2,BL,BH,DL,DH
        Sum EDI,AX,BX,CX,DX,W1,W2,123
        Sum 0,1,2,3
        Sum EDX,EDX ,B2,EDX, ,K2,D3,EDX
        Sum ,1,EAX,EAX, ,K2,EAX,123
        Sum ECX,CL,CH, ,CX,CL,CH,CX
        Sum ,AL,AL,AH, ,AH,AX,AX,EAX,EAX
        .NOLISTMACRO
        exit 
end start