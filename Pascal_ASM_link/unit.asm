; unit

; ��� ������ ������� � �������� ����� � ������������ �����������
; ��������������� ������ ���������������� ������, ������� � ��������
; ����� ������ �� ���������� ��������, ����������� � ����� console.inc
; ������� �� ���� ������������ � ���� ������ ��������� include console.inc
; ���������� �������� ��������� ����� �������� 
; (��������������� ������ ������ ����������):
.586
.model Flat,stdcall

public MAX_MIN; ����� ����� � ������ 

.code

MAX_MIN proc

;MAX_MIN(X,Y,var MAX,var MIN)
;MAX := ��������(X,Y)
;MIN := �������(X,Y)
;��.���������� � ������ stdcall

    push EBP
    mov EBP,ESP
    
    push EAX
    push EBX
    push ECX
    push EDX
    
    mov EAX,[EBP+8]; X c/��
    mov EBX,[EBP+12]; Y c/��
    
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