with Ada.Text_IO; use Ada.Text_IO;

package body safe_counter_pkg is
   protected body Safe_Counter is
      procedure Increament (amount : in Integer) is
      begin
         sum := sum + amount;
         Put_Line ("Increament current sum is " & Integer'Image (sum));
      end Increament;

      function Get_Value return Integer is
      begin
         Put_Line ("Get_Value current sum is " & Integer'Image (sum));
         return sum;
      end;

      entry Wait_For_Positive when sum>0 is
      begin
         sum := sum - 1;
         Put_Line ("Wait_For_Positive current sum is " & Integer'Image (sum));
      end Wait_For_Positive;
   end Safe_Counter;
end;
