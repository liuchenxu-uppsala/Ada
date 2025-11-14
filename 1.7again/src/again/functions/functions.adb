with Ada.Text_IO; use Ada.Text_IO;

package body functions is
   function function_1
     (first_value : in Integer; second_value : in Integer) return Integer is
   begin
      Put_Line ("function_1 invoked");
      return first_value + second_value;
   end function_1;

   function function_2
     (third_value : in Integer; fourth : in Integer) return Integer is
   begin
      Put_Line ("function_2 invoked");
      return third_value - fourth;
   end function_2;

end functions;
