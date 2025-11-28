with Ada.Real_Time; use Ada.Real_Time;
with Text_IO;
with Webots_API;    use Webots_API;
with Webots_API;    use Webots_API;
with Ada.Text_IO;   use Ada.Text_IO;
with EventPkg;      use EventPkg;

package body EventDispatcherTask is
   task body event_dispatcher is
      last_event           : EventID := InitValue;
      current_event        : EventID := InitValue;
      last_block_status    : EventID := Cleared;
      current_block_status : EventID := Cleared;
      Time_Zero            : Time := Clock;
      Next_Time            : Time := Time_Zero;
      Period_Display       : Time_Span := Milliseconds (1000);
      startup_flag         : Boolean := true;
      THROLD               : constant Integer := 20; -- gap between LS1 and LS3
      THROLD_DISTANCE      : constant Integer := 110;
      --  line_detect_value:Integer := 0;
   begin
      loop
         if startup_flag then
            EventPkg.Event.Signal (id => Start);
            startup_flag := false;
         end if;
         declare
            line_detect_value_1 : Integer := read_light_sensor (LS1);
            line_detect_value_2 : Integer := read_light_sensor (LS2);
            line_detect_value_3 : Integer := read_light_sensor (LS3);

            distance_value : Integer := read_distance_sensor;
         begin
            Put_Line
              ("EventDispatcherTask distance_value:"
               & Integer'Image (distance_value));
            if distance_value >= THROLD_DISTANCE then
               current_block_status := Blocked;
               if last_block_status /= current_block_status then
                  last_block_status := current_block_status;
                  EventPkg.Event.Signal (id => last_block_status);
               end if;
            elsif distance_value < THROLD_DISTANCE then
               current_block_status := Cleared;
               if last_block_status /= current_block_status then
                  last_block_status := current_block_status;
                  EventPkg.Event.Signal (id => last_block_status);
               end if;
            end if;

            if abs (line_detect_value_1 - line_detect_value_3) > THROLD then
               if line_detect_value_1 > line_detect_value_3 then
                  last_event := Direction_Left;
                  EventPkg.Event.Signal (id => Direction_Left);
               else
                  last_event := Direction_Right;
                  EventPkg.Event.Signal (id => Direction_Right);
               end if;
            else
               current_event := Direction_OK;
               if last_event /= current_event then
                  EventPkg.Event.Signal (id => current_event);
               end if;
            end if;
         end;
         Next_Time := Next_Time + Period_Display;
         delay until Next_Time;
         exit when simulation_stopped;
      end loop;
   end event_dispatcher;
end EventDispatcherTask;
