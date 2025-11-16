with Ada.Text_IO; use Ada.Text_IO;

procedure arrays is
   type array_type is array (Integer range <>) of Integer;
   long_array  : array_type (1 .. 5) := (1, 2, 3, 4, 5);
   --  long_array: array_type := (1,2,3,4,5);
   short_array: array_type(1..3) := (others=>99);
   --  short_array : array_type := (1 .. 3 => 99);
begin
   for I in long_array'Range loop
      Put_Line ("long_array" & Integer'Image (I) & ":" & Integer'Image(long_array (I)));
   end loop;

   for I in short_array'Range loop
      Put_Line ("short_array" & Integer'Image (I) & ":" & Integer'Image(short_array (I)));
   end loop;
end arrays;
