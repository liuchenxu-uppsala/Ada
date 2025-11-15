with Ada.Text_IO;
use Ada.Text_IO;
with calculator;
with nestedprocedure;
with master_system;
with father;
with father.son;
with ffather;
with ffather.sson;
with others_test;
with case_when;
with calculate_server_pkg;
procedure main is
InitialValue:Integer := 0;
value:Integer := 0;
value1:Integer := 0;

type my_float is delta 0.001 range 0.00..1000.00;
tax_price:my_float := 100.105;
tax_rate: constant Float := 0.21;

type Point is record
X:Integer;
Y:Integer;
end record;

P1: Point;
P2: constant Point := (40,50);

--  type Integer_List is array(Integer range<>) of Integer;



--  type MY_Array is array(Integer range<>) of Integer;
--  my_arrays:MY_Array := (-1..1 => 99);
--  my_arrays2:MY_Array(1..5);





type MY_Array is array(Integer range<>) of Integer;
my_array_1:MY_Array := (-1..1=>99);
my_array_2:MY_Array(1..5);


subtype subString is String(1..5);
type student_t is record
name:subString;
age:Integer;
end record;

type StringPointer is access String;
type student_x is record
studentName:StringPointer;
age:Integer;
end record;
stu: student_x;

task my_task is
end my_task;

task body my_task is
begin
Put_Line ("my_task_start");
delay 5.0;
Put_Line ("my_task_end");
end my_task;

task_value:Integer;
task_return_value:Integer;

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
--  value := father.father_say;

--  Put_Line ("=============================");
--  value1 := father.son.son_say;
--  value1 := ffather.ffather_say;

--  Put_Line ("=============================");
--  case_when(5);
--  case_when(10);
--  Put_Line ("=============================");

Put_Line ("=============================");

loop
   Put_Line (Integer'Image(InitialValue));
   InitialValue := InitialValue + 1;
   exit when InitialValue = 11;
end loop;

Put_Line ("=============================");

while value < 11 loop
Put_Line (Integer'Image(value));
value := value + 1;
end loop;


Put_Line ("=============simple================");
loop
Put_Line (Integer'Image(InitialValue));
InitialValue := InitialValue + 1;
exit when InitialValue = 21;
end loop;
Put_Line ("==============while===============");
while value < 21 loop
Put_Line (Integer'Image(value));
value := value + 1;
end loop;



Put_Line ("===============for==============");
for index in 1..27 loop
Put_Line (Integer'Image(index));
end loop;


Put_Line ("===============fixed float==============");
Put_Line (my_float'Image(my_float(Float(tax_price) * tax_rate)));

Put_Line ("===============record==============");
P1.X := 20;
P1.Y := 30;

Put_Line("P1 coordinates (X, Y): " & Integer'Image(P1.X) & 
             ", " & Integer'Image(P1.Y));
             
    -- 6. 输出 P2 的值
Put_Line("P2 coordinates (X, Y): " & Integer'Image(P2.X) & 
             ", " & Integer'Image(P2.Y));

Put_Line ("===============array==============");
for I in my_array_1'Range loop
        Put_Line("Vector Element" & Integer'Image(I) & ": " & Integer'Image(my_array_1(I)));
    end loop;

Put_Line ("===============access==============");
stu.age := 30;--;
stu.studentName := new String'(1..3=>'c');
Put_Line ("stu.age: " & stu.studentName.all & Integer'Image(stu.age));

Put_Line ("===============task==============");
delay 2.0;
Put_Line ("my_task_main_end");
Put_Line ("===============task 2==============");
task_value := 5;
calculate_server_pkg.calculate_server.Add_Get_Value(task_value,task_return_value);
Put_Line ("task_return_value:"&Integer'Image(task_return_value));
calculate_server_pkg.calculate_server.Add_Get_Value(task_return_value,task_return_value);
Put_Line ("task_return_value:"&Integer'Image(task_return_value));
end main;
