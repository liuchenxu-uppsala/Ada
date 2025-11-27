with Ada.Text_IO; use Ada.Text_IO;

package body calculator is
   procedure show (left : in Integer; right : in Integer) is
   begin
      Put_Line
        ("left:" & Integer'Image (left) & ",right:" & Integer'Image (right));
   end;
   procedure increase (original : in out Integer; step : in Integer) is
   begin
      Put_Line ("increase start");
      original := original + step;
   end;
end;
