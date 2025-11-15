with Ada.Text_IO; use Ada.Text_IO;

procedure taskss is
   task test_task is
   end;
   task body test_task is
   begin
      Put_Line ("test_task");
   end test_task;
begin
null;
end;
