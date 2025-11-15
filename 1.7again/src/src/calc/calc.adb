with Ada.Text_IO;
use Ada.Text_IO;
package body calc is
procedure Display_Sum(Left: in Integer; Right: in Integer) is
result:constant Integer := Left + Right;
begin
Put_Line ("Display_Sum of "&Integer'Image(Left)& "and " &Integer'Image(Right)&"=="&Integer'Image(result));
end Display_Sum;

procedure In_Create(value_sum: in out Integer;value: in Integer) is
begin
value_sum := value_sum + value;
Put_Line ("value_sum: " &Integer'Image(value_sum));
end In_Create;

end calc;