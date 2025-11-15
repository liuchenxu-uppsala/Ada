with Ada.Text_IO;
package body ffather.sson is
function sson_say return Integer is
ReturnValue:Integer;
begin
ReturnValue := 0;
Ada.Text_IO.Put_Line ("ffather.sson say!");
return ReturnValue;
end sson_say;
end ffather.sson;