with Ada.Text_IO; use Ada.Text_IO;

package body function_dm is

   procedure hi (content : String) is
   begin
      Put_Line ("Hi" & content);
      New_Line (1);
   end hi;

   function function_add (A : Integer; B : Integer) return Integer is
   begin
      return A + B;
   end function_add;
end function_dm;
