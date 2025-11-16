with Ada.Text_IO; use Ada.Text_IO;

procedure loops is
   procedure simple_loops is
      simple_loop_flag : Integer := 1;
   begin
      loop
         Put_Line ("Simple loop");
         simple_loop_flag := simple_loop_flag + 1;
         exit when simple_loop_flag > 6;
      end loop;
   end simple_loops;

   procedure while_loop is
      while_loop_flag : Integer := 0;
   begin
      while while_loop_flag < 6 loop
      while_loop_flag := while_loop_flag +1;
         Put_Line ("while loop");
      end loop;
   end while_loop;

   procedure for_loop is
      for_loop_flag : Integer := 0;
   begin
      for I in 1 .. 5 loop
         Put_Line ("for loop");
      end loop;
   end for_loop;
begin
   simple_loops;
   while_loop;
   for_loop;
end loops;
