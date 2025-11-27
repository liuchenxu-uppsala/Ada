with Ada.Text_IO;

package body utils is
   procedure Greet (word : in String) is
   begin
      Ada.Text_IO.Put_Line (word & "你好");
   end Greet;
end utils;
