var X: longint; Res: shortint;
procedure Power2(X: longint; var Res: shortint);
stdcall;
external name '_Power2@0';
{$L unit12.obj}
begin  
        write('X = ');
	read(X);

        Power2(X, Res);

	writeln(Res);
end.