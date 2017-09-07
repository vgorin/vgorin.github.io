program listv_test;
  uses listv2;
  var p:tpr;
BEGIN
  p:=nil;
  writeln('Running ih(p)...'); ih(p);
  writeln('Running ih(p)...'); ih(p);
  writeln('Running wlist(p)...'); wlist(p);
  writeln('Running ie(p)...'); ie(p);
  writeln('Running ie(p)...'); ie(p);
  writeln('Running wlist(p)...'); wlist(p);
  writeln('Running del(p)...'); del(p);
  writeln('Running del(p)...'); del(p);
  writeln('Running wlist(p)...'); wlist(p);
  readln;
END.