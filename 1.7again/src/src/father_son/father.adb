with father.son;
with Ada.Text_IO;
package body father is
function father_say return Integer is
returnValue1:Integer;
returnValue2:Integer;
begin
returnValue1 := father.son.son_say;
Ada.Text_IO.Put_Line("father_say");
return 0;
end father_say;
end father;