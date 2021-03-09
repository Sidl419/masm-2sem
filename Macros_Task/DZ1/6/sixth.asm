include console.inc
MOV32 macro R:req, OP:req, CASE:req
        mov&CASE&x R, OP
endm
;MOV32 EAX, word ptr [EBX], S 
;movsx EAX, word ptr [EBX]

;MOV32 EBX, CH, Z
;movzx EBX, CH
.data 
.code 
start:
        MOV32 EAX, word ptr [EBX], S 
        exit
end start