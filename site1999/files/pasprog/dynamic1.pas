program dynamic1;
 uses crt;
 const n=5;
 var p:pointer;
     pa,pb:^real;
     i,j:byte;
     a:real;
BEGIN
 clrscr;
 getmem(p,4*n); pa:=p;
 writeln('Enter massive (',n,' elements) ->');
 for i:=1 to n do
  begin
   readln(pa^);
   inc(pa);
  end;
 writeln('Working... Please wait...');
 for j:=1 to n-1 do
  begin
   pa:=p; pb:=p; inc(pb);
   for i:=1 to n-1 do
    begin
     if pa^>pb^ then
      begin
       a:=pa^;
       pa^:=pb^;
       pb^:=a;
      end;
     inc(pb);
     inc(pa);
    end;
  end;
 clrscr;
 writeln('Result ->');
 pa:=p;
 for i:=1 to n do
  begin
   writeln(pa^:3:0);
   inc(pa);
  end;
 writeln('Press any key...');readln;
END.