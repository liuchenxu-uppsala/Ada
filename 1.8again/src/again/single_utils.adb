with Ada.Text_IO; use Ada.Text_IO;

procedure single_utils is

   procedure sub_procedure is
   begin
      Put_Line ("sub_procedure");
   end sub_procedure;

   function sub_function return Integer is
   begin
      Put_Line ("sub_function");
      return 0;
   end sub_function;
value_return:Integer;
begin
   sub_procedure;
   value_return := sub_function;
end single_utils;
