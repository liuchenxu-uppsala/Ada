with Ada.Text_IO;
use Ada.Text_IO;
with calc;
procedure main is
InitialValue:Integer := 10;
begin
Put_Line ("=============================");
calc.Display_Sum (Left=>5, Right=>7);
calc.In_Create (value_sum=>InitialValue, value=>5);
end main;
