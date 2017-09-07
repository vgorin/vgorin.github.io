Program dynamic2;
 uses crt;
 const n=5;
 type tpr=^tr;
      tr=record
          nm:string;
          pr:tpr;
         end;{record}
 procedure plist(p:tpr);
  begin
   while not (p^.pr=nil) do
    begin
     writeln('...->',p^.nm);
     p:=p^.pr;
    end;
  end;{plist}
 procedure in_h(var ph:tpr);
  var pv:tpr;
  begin
   new(pv);
   readln(pv^.nm);
   pv^.pr:=ph;
   ph:=pv;
  end;{in_h}
 var phead:tpr;
     i:byte;
BEGIN
 new(phead);
 phead^.pr:=nil;
 writeln('Enter ',n,' name(s) ->');
 for i:=1 to n do in_h(phead);
 clrscr;
 writeln('Result ->');
 plist(phead);
 writeln('Press any key...'); readln;
END.