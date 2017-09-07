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
   while not (p=nil) do
    begin
     writeln('...->',p^.nm:10:10);
     p:=p^.pr;
    end;
  end;{plist}
 procedure in_m(var ph:tpr);
  var pv, pb, ps:tpr;
  begin
   new(pv);
   readln(pv^.nm);
   pv^.pr:=nil;
   if ph=nil then ph:=pv
             else
              if pv^.nm<=ph^.nm then
               begin
                pv^.pr:=ph;
                ph:=pv;
               end
                                else
                                 begin
                                  pb:=ph; {ps:=ph; ph:=ph^.pr; }
                                  while (ph^.pr<>nil) and (pv^.nm>ph^.nm) do
                                   begin
                                    ps:=ph;
                                    ph:=ph^.pr;
                                   end;
                                  if pv^.nm>ph^.nm then ph^.pr:=pv
                                                   else
                                                    begin
                                                     pv^.pr:=ph;
                                                     ps^.pr:=pv;
                                                    end;
                                  ph:=pb;
                                 end;

  end;{in_m}
 var phead:tpr;
     i:byte;
BEGIN
 clrscr;
 new(phead);
 phead:=nil;
 writeln('Enter ',n,' name(s) ->');
 for i:=1 to n do in_m(phead);
 writeln;
 writeln('Result ->');
 plist(phead); writeln;
 writeln('Written by Vasiliy Gorin, http://users.i.com.ua/~vgrn');
 readln;
END.