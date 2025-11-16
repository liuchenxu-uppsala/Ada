with Ada.Text_IO;
package body father.son is
function son_say return Integer is
begin
Ada.Text_IO.Put_Line ("son_say");
return 0;
end son_say;
end father.son;