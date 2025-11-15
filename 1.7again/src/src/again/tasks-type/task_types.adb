with Ada.Task_Identification;
with Ada.Text_IO; use Ada.Text_IO;

package body task_types is
function TASK_ID return String is
        begin
            return Ada.Task_Identification.Image(Ada.Task_Identification.Current_Task);
        end TASK_ID;
   task body Work_Type is
   begin
      loop
         select
            accept AssignWork (Job : in Integer) do
            Put_Line (TASK_ID & "doing" & Integer'Image(Job));
            delay 2.0;
            end AssignWork;
         or
            accept StopWork do
            Put_Line (TASK_ID & "finished");
            delay 1.0;
            end StopWork;
            exit;
         or
            terminate;
         end select;
      end loop;
   end Work_Type;
end task_types;
