--  type Personal_Pointer is access Integer;
with Ada.Text_IO;
use Ada.Text_IO;
procedure new_ada is
type Personal_Pointer is access Integer;
pointer: Personal_Pointer;
begin
pointer := new Integer'(50);
Put_Line ("pointer: " & Integer'Image(pointer.all));
end new_ada;