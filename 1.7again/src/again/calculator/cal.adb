with Ada.Text_IO; use Ada.Text_IO;

package body cal is
   procedure show_number (A : in Integer; B : in Integer) is
   begin
      Put_Line
        ("show_number A:" & Integer'Image (A) & ",B: " & Integer'Image (B));
   end show_number;

   procedure increase_number (A : in out Integer; Step : in Integer) is
   begin
      A := A + Step;
   end increase_number;
end cal;
