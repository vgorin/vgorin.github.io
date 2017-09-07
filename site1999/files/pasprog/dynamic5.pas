program dynamic5;
 uses crt;
 const n=5;
 type tpr=^tr;
      tr=record
          nm:real;
	  pr:tpr;
	 end;{record}
 procedure plist(p:tpr);
  begin
   while p<>nil do
    begin
     writeln('...->',p^.nm:3:2);
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
  procedure del_m(num:real; var ph:tpr);
   var pb, ps, pd:tpr;
   begin
    pb:=ph;
    while (ph^.nm=num) and (ph<>nil) do
     begin
      pd:=ph^.pr;
      dispose(ph);
      ph:=pd;
      pb:=ph;
     end;
    ps:=ph; ph:=ph^.pr;
    while ph^.pr<>nil do
     begin
      if ph^.nm=num then
       begin
        ps^.pr:=ph^.pr;
        pd:=ph^.pr;
        dispose(ph);
        ph:=pd;
       end          else
                     begin
                      ps:=ph;
                      ph:=ph^.pr;
                     end;
     end;
    if ph^.nm=num then
     begin
      ps^.pr:=nil;
      dispose(ph);
     end;
    ph:=pb;
   end;{del_m}
 var phead:tpr;
     i:byte;
     nu:real;
BEGIN
 clrscr;
 new(phead);
 phead:=nil;
 writeln('Enter ',n,' name(s) ->');
 for i:=1 to n do in_e(phead);
 writeln;
 writeln('Enter the number to delete ->'); readln(nu);
 del_m(nu, phead);
 writeln;
 writeln('Result ->');
 plist(phead); writeln;
 writeln('Written by Vasiliy Gorin, http://users.i.com.ua/~vgrn');
 readln;
END.