with Ada.Real_Time; use Ada.Real_Time;
with Webots_API;    use Webots_API;
with Webots_API;    use Webots_API;
with Ada.Text_IO;   use Ada.Text_IO;
with EventPkg;      use EventPkg;

package body EventDispatcherTask is
   task body event_dispatcher is
      last_event          : EventID := InitValue;
      current_event       : EventID := InitValue;
      last_line_status    : EventID := Line_Cleared;
      current_line_status : EventID := Line_Cleared;
      Time_Zero           : Time := Clock;
      Next_Time           : Time := Time_Zero;
      Period_Display      : Time_Span := Milliseconds (100);
      --  line_detect_value:Integer := 0;
   begin
      loop
         declare
            up_pressed        : Boolean := button_pressed (UpButton);
            down_pressed      : Boolean := button_pressed (DownButton);
            left_pressed      : Boolean := button_pressed (LeftButton);
            right_pressed     : Boolean := button_pressed (RightButton);
            --  when line_detect_value > 800 not find the line; if it's value is below 400,It means this is a line
            line_detect_value : Integer := read_light_sensor (LS2);
         begin
            if up_pressed then
               current_event := UpPressed;
            elsif down_pressed then
               current_event := DownPressed;
            elsif left_pressed then
               current_event := LeftPressed;
            elsif right_pressed then
               current_event := RightPressed;
            end if;
            --  Put_Line ("EventDispatcherTask line_detect_value: "&Integer'Image(line_detect_value));
            --  New_Line (1);
            --  Put_Line
            --    ("EventDispatcherTask last_event:"
            --     & EventID'Image (last_event)
            --     & ",up_pressed:"
            --     & Boolean'Image (up_pressed)
            --     & ",down_pressed:"
            --     & Boolean'Image (down_pressed)
            --     & ",left_pressed:"
            --     & Boolean'Image (left_pressed)
            --     & ",right_pressed:"
            --     & Boolean'Image (right_pressed));
            --  Put_Line
            --    ("EventDispatcherTask current_event:"
            --     & EventID'Image (current_event));

            if (line_detect_value < 400) then
               current_line_status := Line_Detected;
            else
               current_line_status := Line_Cleared;
            end if;
            Put_Line
              ("EventDispatcherTask,current_line_status:"
               & EventID'Image (current_line_status)
               & ",last_line_status:"
               & EventID'Image (last_line_status)
               & ",line_detect_value:"
               & Integer'Image (line_detect_value));
         end;
         Put_Line ("EventDispatcherTask,current_event:"&EventID'Image(current_event)&",last_event:"&EventID'Image(last_event));
         if current_line_status /= last_line_status then
            last_line_status := current_line_status;
            EventPkg.Event.Signal (id => last_line_status);
         elsif current_event /= last_event then
            last_event := current_event;
            EventPkg.Event.Signal (id => last_event);
         end if;
         Next_Time := Next_Time + Period_Display;
         delay until Next_Time;
         exit when simulation_stopped;
      end loop;
   end event_dispatcher;
end EventDispatcherTask;
