; unit

; для снятия проблем с заданием путей к подключаемым библиотекам
; рассматривается случай вспомогательного модуля, который в процессе
; своей работы не использует макросов, объявленных в файле console.inc
; поэтому не надо использовать в этом модуле директиву include console.inc
; достаточно обойтись следующей парой директив 
; (установливающих нужные режимы трансляции):
.586
.model Flat,stdcall

public MAX_MIN; точка входа в модуль 

.code

MAX_MIN proc

;MAX_MIN(X,Y,var MAX,var MIN)
;MAX := максимум(X,Y)
;MIN := минимум(X,Y)
;ст.соглашения о связях stdcall

    push EBP
    mov EBP,ESP
    
    push EAX
    push EBX
    push ECX
    push EDX
    
    mov EAX,[EBP+8]; X c/зн
    mov EBX,[EBP+12]; Y c/зн
    
    mov ECX,[EBP+16]; offset MAX
    mov EDX,[EBP+20]; offset MIN
    
    cmp EAX,EBX
    jGE @F
    xchg EAX,EBX
@@: ;EAX => MAX, EBX => MIN
    mov [ECX],EAX; MAX
    mov [EDX],EBX; MIN
 
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    
    pop EBP
    ret 4*4
    
MAX_MIN endp    

    end 