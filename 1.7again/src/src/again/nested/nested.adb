with Ada.Text_IO; use Ada.Text_IO;

package body nested is
   procedure sub_procedure is
   begin
      Put_Line ("sub_procedure");
   end sub_procedure;
   function sub_function return Integer is
   begin
      Put_Line ("sub_function");
      return 0;
   end sub_function;

   return_value: Integer := 0;
   procedure process is
   begin
   return_value := sub_function;
   sub_procedure;
   end process;
end nested;
