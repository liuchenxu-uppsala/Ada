with Ada.Text_IO;
use Ada.Text_IO;
procedure case_when(value: in Integer) is
begin
case value is
when 10 => Put_Line(Integer'Image(value) & " == 10");
when 15 => Put_Line(Integer'Image(value) & " == 15");
when others => Put_Line(Integer'Image(value) & " others");
end case;
end case_when;
