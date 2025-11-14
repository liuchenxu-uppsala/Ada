with Ada.Text_IO;
use Ada.Text_IO;
procedure conv is
int_value:Integer := 10;
float_value:Float := 3.0;
long_value:Long_Float := 10.0;
string_number:String := "12.0";
float_var :Float := 0.0;

type Color is (RED,Green,Yellow);
my_color :Color := Green;
begin
Put_Line (Float'Image(Float(int_value)));
Put_Line (Integer'Image(Integer(float_value)));
float_var := Float'Value(string_number);
Put_Line(Float'Image(float_var));
Put_Line ("color:" & Color'Image(my_color));
end conv;