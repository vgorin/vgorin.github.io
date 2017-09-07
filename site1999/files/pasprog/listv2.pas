UNIT LISTV2;

     INTERFACE
          type tpr=^tr;
               {ts=string[20];}
               tr=record
                    nm:word;
                    pp:tpr;
                    pr:tpr;
                  end;{record}
          procedure ih(var p:tpr);
          procedure ie(var ph:tpr);
          procedure wlist(p:tpr);
          procedure del(var ph:tpr);

     IMPLEMENTATION
          procedure ih(var p:tpr);
               var pi:tpr;
               begin
                 new(pi);
                 writeln('Input number IH ->'); readln(pi^.nm); pi^.pp:=nil;
                 pi^.pr:=p;  p:=pi;
               end;
          procedure ie(var ph:tpr);
               var pi,p:tpr;
               begin
                 new(pi);
                 writeln('Input number IE ->'); readln(pi^.nm); pi^.pr:=nil;
                 if ph=nil
                    then
                        begin
                             pi^.pp:=nil;
                             ph:=pi;
                        end
                    else
                      begin
                        p:=ph;
                        while p^.pr<>nil do p:=p^.pr;
                        p^.pr:=pi;
                        pi^.pp:=p;
                      end;
               end;
          procedure wlist(p:tpr);
               begin
                 writeln('List:');
                 while p<>nil do
                   begin
                     writeln(p^.nm);
                     p:=p^.pr;
                   end;
               end;
          procedure del(var ph:tpr);
               var p,pp,pd:tpr; k,zn:byte;
               begin
                 writeln('WARNING! This will DELETE some elements from your list.');
                 writeln('Input numbr to DELETE ->'); readln(zn); k:=0;
                 {del elem. in head_list}
                 while (ph<>nil) and (zn=ph^.nm) do
                   begin
                     pd:=ph; ph:=ph^.pr; ph^.pp:=nil;
                     dispose(pd);
                     inc(k);
                   end;
                {del elem. in list}
                p:=ph; {pp:=ph;}
                while p<>nil do
                  begin
                   if p^.nm<>zn
                      then
                        begin
                             pp:=p;
                             p:=p^.pr;
                        end
                      else
                        begin
                             pd:=p;
                             p:=p^.pr;
                             p^.pp:=pp;
                             pp^.pr:=p;
                             dispose(pd);
                             inc(k)
                        end;
                  end;
                  writeln('del k=',k,' elem = ',zn);
               end;

BEGIN
 writeln('LISTV.TPU');
 writeln('Procedures avaible:');
 writeln('procedure ih(var p:tpr);');
 writeln('procedure ie(var ph:tpr);');
 writeln('procedure wlist(p:tpr);');
 writeln('procedure del(var ph:tpr);');
 writeln; writeln('Written by Vasiliy Gorin, http://users.i.com.ua~vgrn');

END.