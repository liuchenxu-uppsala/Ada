with Ada.Text_IO; use Ada.Text_IO;

separate (master)
function add return Integer is
begin
   Put_Line ("sub unit add");
   return 0;
end;
