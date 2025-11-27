with Ada.Text_IO; use Ada.Text_IO;

separate (master)
function minus return Integer is
begin
   Put_Line ("sub unit minus");
   return 0;
end;
