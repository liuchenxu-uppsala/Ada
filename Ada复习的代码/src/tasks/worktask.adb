with Ada.Text_IO; use Ada.Text_IO;

package body worktask is
   task body work is
   Current_Job_ID : Integer := 0;
   begin
      loop
         select
            accept work (job : Integer) do
               --  Put_Line ("Start work:" & Integer'Image (job));
            --  delay 2.0;
            --  Put_Line ("End work:" & Integer'Image (job));
            Current_Job_ID := job;
            end work;
            Put_Line ("Start work:" & Integer'Image (Current_Job_ID));
            delay 2.0;
            Put_Line ("End work:" & Integer'Image (Current_Job_ID));
         or
            accept stop_work do
               Put_Line ("stop_work");
            end stop_work;
            exit;
         or
            terminate;
         end select;
      end loop;
   end;
end;
