with Ada.Text_IO;
package body calculator is
procedure Show_result(Left:in Integer;Right:in Integer) is
   Result:constant Integer := Left + Right;
begin
   Ada.Text_IO.Put_Line ("Left:"&Integer'Image(Left) & ",+ Right:"&Integer'Image(Right)&" = "&Integer'Image(Result));
end Show_result;

procedure Increase(Sum:in out Integer;Gap:in Integer) is
begin
Sum := Sum + Gap;
Ada.Text_IO.Put_Line ("Increase" & Integer'Image(Sum));
end Increase;
end calculator;