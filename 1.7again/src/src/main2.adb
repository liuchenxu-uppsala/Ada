with Ada.Text_IO; use Ada.Text_IO;
with function_dm;
with single_utils;
with math_utils;
with cal;
with conv;
with new_ada;
with nested;
with nested;
with father;
with functions;   use functions;
with loops;
with cases;
with records;
with arrays;
with pointer;
with System.Dim.Generic_Mks;
with taskss;
with pre_post;
with full_task;
with task_types;
with ppredicts;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting;
use Ada.Calendar.Formatting; 
with Ada.Real_Time;
with Text_IO;
procedure main2 is
   return_value_increase   : Integer := 10;
   subtype Action_Message is String (1 .. 20);
   --  action_msg: Action_Message := "Hello";
   return_value_function_1 : Integer;
   return_value_function_2 : Integer;

   --  ===============Subtype=====================
   subtype sub_type is Integer range 1 .. 100;
   --  ===============pre_post_conditions=====================
   value_squart_input_invalid      : Integer := -10;
   value_squart_input_return_value : Integer := -10;

   threads_num : Integer := 3;
   jobs_num    : Integer := 15;
   threads     : array (1 .. threads_num) of task_types.Work_Type;

   start_time:Ada.Real_Time.Time;
   end_time:Ada.Real_Time.Time;
   Elapsed    : Ada.Real_Time.Time_Span;

begin
   Put_Line ("===============Start=====================");
   function_dm.hi (content => "Chenxu");
   Put_Line
     ("3 + 2 ==" & Integer'Image (function_dm.function_add (A => 3, B => 2)));
   Put_Line ("===============Single_Utils=====================");
   single_utils;
   Put_Line ("===============SubUnit=====================");
   Put_Line ("3 + 2 = " & Integer'Image (math_utils.add (3, 2)));
   Put_Line ("3 - 2 = " & Integer'Image (math_utils.sub (3, 2)));
   Put_Line ("===============In Out=====================");
   cal.show_number (3, 2);
   cal.increase_number (return_value_increase, 2);
   Put_Line (Integer'Image (return_value_increase));
   Put_Line ("===============Conv=====================");
   conv;
   Put_Line ("===============New=====================");
   new_ada;
   Put_Line ("===============Nested=====================");
   nested.process;
   Put_Line ("===============FatherChildPackage=====================");
   father.father_say;
   Put_Line ("===============Functions=====================");
   return_value_function_1 := function_1 (first_value => 3, second_value => 4);
   return_value_function_2 := function_2 (third_value => 3, fourth => 8);
   Put_Line ("===============loops=====================");
   loops;
   Put_Line ("===============Cases=====================");
   cases (10);
   cases (20);
   cases (30);
   Put_Line ("===============records=====================");
   records;
   Put_Line ("===============arrays=====================");
   arrays;
   Put_Line ("===============pointer=====================");
   pointer;
   Put_Line ("===============temporary taskss=====================");
   taskss;
   Put_Line ("===============full_task=====================");
   full_task.full_task_task.task_say_something ("Entry&Accept");
   Put_Line ("===============pre_post_conditions=====================");
   begin
      value_squart_input_return_value :=
        pre_post.squart (value_squart_input_invalid);
   exception
      when others =>
         Put_Line ("pre_post function pre condition error!");
   end;
   Put_Line ("===============task types=====================");
   for index in 1..jobs_num loop
      declare
         work_index : constant Integer := (index - 1) mod threads_num + 1;
      begin
      threads(work_index).AssignWork (Job=>index);
      end;
   end loop;

   delay 3.0;

   for index in 1..threads_num loop
   threads(index).StopWork;
   end loop;

   Put_Line ("===============dynamic static predicts=====================");
   declare
   sub_in: ppredicts.subInteger;
   work_day:ppredicts.Work_Day := ppredicts.Mon;
   begin
   sub_in := 2;
   --  work_day := Sat;
   end;

   Put_Line ("===============Calendar=====================");
   declare
   current_time :Time := Clock;
   begin
   Put_Line (Ada.Calendar.Formatting.Image(current_time));
   --  Time_Zones.Local_Time_Offset
   end;

Put_Line ("===============Calendar=====================");
start_time := Ada.Real_Time.Clock;
   for I in 1..10000 loop
   null;
   end loop;
end_time := Ada.Real_Time.Clock;
Elapsed := Ada.Real_Time."-"(end_time, start_time);
Put_Line("Time span: "& Ada.Real_Time.Time_Span'Image(Elapsed));

end main2;
