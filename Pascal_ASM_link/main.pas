program main;
var X,Y,MAX,MIN: longint; {32-������� ����� �/��}
procedure MAX_MIN(X,Y: longint; var MAX,MIN: longint);
stdcall; {������������ ���������� � ������}
external name '_MAX_MIN@0'; {����� ��� ��������� ��������� �� ������� ����, 
                            �.�. ������������� ���������� ��� MAX_MIN
                            ��������� ��� ��, ��� ��� ����� �������������� 
                            � �������� ���������������� ���������� ������}  
{$L unit.obj}   {�������� ��� �����, � ������� ��������� ����������������� 
                 ������ c ����� ��������� MAX_MIN}

begin
	write('X = ');
	read(X);
	
	write('Y = ');
	read(Y);	
	
	MAX_MIN(X, Y, MAX, MIN);{�������� ��������� �� ������� �������� �������}
	
	writeln('MAX = ', MAX);
	writeln('MIN = ', MIN)
end.
