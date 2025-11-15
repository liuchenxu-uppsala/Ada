with Ada.Text_IO;
use Ada.Text_IO;
with father.son;
use father.son;
package body father is
procedure father_say is
   
begin
   Put_Line ("father_say");
   son_say;
end father_say;
end father;