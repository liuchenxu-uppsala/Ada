with Ada;
with Ada.Text_IO;
package body master_system.sub_system is
function sub_system_function(ValueFirst:in Integer;SecondValue:in Integer) return Integer is
Sum : constant Integer := ValueFirst + SecondValue;
begin
Ada.Text_IO.Put_Line ("master_system.sub_system,Sum:"&Integer'Image(Sum));
return 0;
end sub_system_function;
end master_system.sub_system;