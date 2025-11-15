with Ada.Text_IO;
with ffather.sson;
package body ffather is
function ffather_say return Integer is
ReturnValue:Integer;
ReturnValue1:Integer;
begin
ReturnValue := 0;
Ada.Text_IO.Put_Line ("ffather say!");
ReturnValue1 := ffather.sson.sson_say;
return ReturnValue;
end ffather_say;
end ffather;