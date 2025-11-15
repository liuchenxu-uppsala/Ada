with Ada.Text_IO; use Ada.Text_IO;

package body protects is
   protected body protect is
      procedure increase (num : in Integer) is
      begin
         shared_value := shared_value + 1;
         Put_Line
           ("procedure increase then shared_value:" & Integer'Image (shared_value));
      end increase;

      entry decrease (num : in Integer) when shared_value > 0 is
      begin
      shared_value := shared_value - 1;
      Put_Line
           ("entry decrease then shared_value:" & Integer'Image (shared_value));
      end decrease;

      function read_value return Integer is
      begin
      Put_Line
           ("funciton read_value then shared_value:" & Integer'Image (shared_value));
           return shared_value;
      end read_value;
   end protect;
end protects;
