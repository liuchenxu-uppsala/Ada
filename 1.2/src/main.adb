with Ada.Text_IO;
use Ada.Text_IO;
with calculator;
with nestedprocedure;
procedure main is
InitialValue:Integer := 10;
begin
--  Put_Line ("=============================");
--  calculator.Show_result (Left => 5, Right=> 6);
--  New_Line (1);
--  calculator.Increase (Sum => InitialValue, Gap => 7);
--  New_Line (1);
--  Put_Line ("=============================");
--  Ada.Text_IO.Put_Line ("InitialValue" & Integer'Image(InitialValue));
nestedprocedure.father_procedure;
end main;
