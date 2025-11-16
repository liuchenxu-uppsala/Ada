with Ada.Text_IO; use Ada.Text_IO;

package body full_task is
   task body full_task_task is
   begin
      loop
         select
            accept task_say_something (word : in String) do
               Put_Line ("task_say_something:" & word);
            end task_say_something;
         or
            terminate;
         end select;
      end loop;
   end full_task_task;
end full_task;
