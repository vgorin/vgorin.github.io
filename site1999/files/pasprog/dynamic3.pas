program dynamic3;
 uses crt;
 const n=5;
 type tpr=^tr;
      tr=record
          nm:string;
	  pr:tpr;
	 end;{record}
 procedure plist(p:tpr);
  begin
   while not (p=nil) do
    begin
     writeln('...->',p^.nm);
     p:=p^.pr;
    end;
  end;{plist}
 procedure in_e(var ph:tpr);
  var pv, pb:tpr;
  begin
   new(pv);
   readln(pv^.nm);
   pv^.pr:=nil;
   if ph=nil then ph:=pv else
   begin
    pb:=ph;
    while ph^.pr<>nil do ph:=ph^.pr;
    ph^.pr:=pv;
    ph:=pb;
   end;
  end;{in_e}
 var phead:tpr;
     i:byte;
BEGIN
 clrscr;
 new(phead);
 phead^.pr:=nil;
 writeln('Enter ',n,' name(s) ->');
 readln(phead^.nm);
 for i:=1 to n-1 do in_e(phead);
 writeln;
 writeln('Result ->');
 plist(phead); writeln;
 writeln('Written by Vasiliy Gorin, http://users.i.com.ua/~vgrn');
 readln;
END.