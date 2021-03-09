program main;
var X,Y,MAX,MIN: longint; {32-битовые целые с/зн}
procedure MAX_MIN(X,Y: longint; var MAX,MIN: longint);
stdcall; {используемое соглашение о связях}
external name '_MAX_MIN@0'; {такое имя назначаем процедуре во внешнем мире, 
                            т.е. принудительно декорируем имя MAX_MIN
                            процедуры так же, как оно будет задекорировано 
                            в паспорте вспомогательного объектного модуля}  
{$L unit.obj}   {сообщаем имя файла, в котором находится оттранслированный 
                 модуль c кодом процедуры MAX_MIN}

begin
	write('X = ');
	read(X);
	
	write('Y = ');
	read(Y);	
	
	MAX_MIN(X, Y, MAX, MIN);{вызываем процедуру по обычным правилам Паскаля}
	
	writeln('MAX = ', MAX);
	writeln('MIN = ', MIN)
end.
