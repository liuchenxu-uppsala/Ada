with Ada.Text_IO; use Ada.Text_IO;
procedure ArrayFloat is
   type My_Float is array (Positive range <>) of Integer;
begin
   declare
      float_array_5 : My_Float (1 .. 5) := (others => 66);
      float_array_6 : My_Float := (1 .. 10 => 77);
      while_index   : Integer := 1;
   begin
      for index in float_array_5'Range loop
         Put_Line ("float_array_5" & Integer'Image (index) & ": " & Integer'Image(float_array_5(index)));
      end loop;

      while while_index < 11 loop
         Put_Line ("float_array_6 " & Integer'Image (while_index) & ": " & Integer'Image(float_array_6(while_index)));
         while_index:=while_index+1;
      end loop;
   end;
end;