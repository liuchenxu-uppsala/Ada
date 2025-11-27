with Ada.Text_IO; use Ada.Text_IO;
with utils;
with SingleProcedureTest;
with subs;
with master;      use master;
with calculator;
with convert;
with systemf;
with systemf.data_tools;
with Area;        use Area;
with PointX;
with ArrayFloat;
with discriminantrecord;
with workaccess;
with worktask;
with safe_counter_pkg;
with safe_counter_pkg;
with prepost;     use prepost;

procedure Main is
   jobs : array (1 .. 5) of worktask.work;
begin
   Ada.Text_IO.Put_Line ("FRST Main");
   utils.Greet (word => "Ada Review");
   SingleProcedureTest;
   subs.calc;
   Put_Line ("------------subunit-------------------");
   declare
      local_return_value : Integer := 0;
   begin
      local_return_value := add;
      local_return_value := minus;
   end;
   Put_Line ("------------calculator-------------------");
   calculator.show (left => 10, right => 5);
   declare
      original_value : Integer := 100;
   begin
      calculator.increase (original_value, 15);
      Put_Line
        ("calculator.increase original_value:"
         & Integer'Image (original_value));
   end;
   Put_Line ("------------convert-------------------");
   convert;
   Put_Line ("------------access-------------------");
   declare
      type Integer_Pointer is access Integer;
      P : Integer_Pointer;
      type Int_Arr is array (Integer range <>) of Integer;
      subtype Sub_String is String (1 .. 5);
   begin
      P := new Integer'(77);
      Put_Line ("Integer_Pointer:" & Integer'Image (P.all));
   end;
   Put_Line ("------------subpackage-------------------");
   systemf.system_say;
   systemf.data_tools.data_tools_say;
   Put_Line ("------------functions-------------------");
   declare
      areaa : Integer := 0;
   begin
      areaa := circle_area (x => 10, y => 12);
      Put_Line ("area:" & Integer'Image (areaa));
   end;
   Put_Line ("------------record-------------------");
   PointX;
   Put_Line ("------------array-------------------");
   ArrayFloat;
   Put_Line ("------------DiscriminantRecord------------");
   discriminantrecord;
   Put_Line ("------------access------------");
   workaccess;
   declare
      task print_task is
      end print_task;
      task body print_task is
      begin
         Put_Line ("------------task start------------");
         delay 5.0;
         Put_Line ("------------task end------------");
      end print_task;
   begin
      null;
   end;
   Put_Line ("------------task entry accept------------");
   for I in jobs'Range loop
      jobs (I).work (I);
   end loop;
   Put_Line ("------------protected------------");
   Put_Line ("------------prepost------------");
   declare
      return_result : Float := 0.0;
   begin
      return_result := squart (amount => 8);
   end;
end Main;
