with Ada.Text_IO;
procedure others_test(value:in Integer) is
begin
if (value < 10) then
Ada.Text_IO.Put_Line (Integer'Image(value) & "< 10");
elsif (value <20) then
Ada.Text_IO.Put_Line (Integer'Image(value) & "< 20");
else
Ada.Text_IO.Put_Line (Integer'Image(value) & "> 20");
end if;
end others_test;