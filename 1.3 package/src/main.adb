with Ada.Text_IO;
use Ada.Text_IO;
with calculator;
with nestedprocedure;
with master_system;
with father;
with father.son;
procedure main is
InitialValue:Integer := 10;
value:Integer;
value1:Integer;
begin
--  Put_Line ("=============================");
--  calculator.Show_result (Left => 5, Right=> 6);
--  New_Line (1);
--  calculator.Increase (Sum => InitialValue, Gap => 7);
--  New_Line (1);
--  Put_Line ("=============================");
--  Ada.Text_IO.Put_Line ("InitialValue" & Integer'Image(InitialValue));
--  nestedprocedure.father_procedure;
--  master_system.master_system_function;
value := father.father_say;
Put_Line ("=============================");
value1 := father.son.son_say;
end main;
