with main;
with Webots_API;  use Webots_API;
with EventPkg;    use EventPkg;
with Ada.Text_IO; use Ada.Text_IO;
--  with Ada.Numerics.Min_Max;

package body MotorControlTask is
   current_speed_left  : Integer := 0;
   current_speed_Right : Integer := 0;
   is_on_line          : Boolean := false;
   max_speed           : Integer := 0;
   min_speed           : Integer := 0;
   event_id            : EventID;
   task body motorControl is
   begin
      loop
         Put_Line ("motorControl Event.Wait");
         Event.Wait (event_id);
         if event_id = Line_Detected then
            current_speed_left := 0;
            current_speed_Right := 0;
            set_motor_speed (id => LeftMotor, value => 0);
            set_motor_speed (id => RightMotor, value => 0);
            is_on_line := true;
         elsif event_id = Line_Cleared then
            is_on_line := false;
         end if;
         if not is_on_line then
            if event_id = UpPressed then
               if current_speed_left >= current_speed_Right then
                  max_speed := current_speed_left;
               else
                  max_speed := current_speed_Right;
               end if;
               current_speed_left := max_speed + 100;
               current_speed_Right := max_speed + 100;
            --  if current_speed_left /= current_speed_Right then
            --     max_speed := Ada.Numerics.Min_Max.Max (Left => X, Right => Y);
            --  else
            --     current_speed_left := current_speed_left + 100;
            --     current_speed_Right := current_speed_Right + 100;
            --  end if;
            elsif event_id = DownPressed then
               --  current_speed_left := current_speed_left - 100;
               --  current_speed_Right := current_speed_Right - 100;
               if current_speed_left <= current_speed_Right then
                  min_speed := current_speed_left;
               else
                  min_speed := current_speed_Right;
               end if;
               current_speed_left := min_speed - 100;
               current_speed_Right := min_speed - 100;
            elsif event_id = LeftPressed then
               current_speed_left := 0;
            elsif event_id = RightPressed then
               current_speed_Right := 0;
            --  current_speed_Right := current_speed_Right - 150;
            end if;
            Put_Line
              ("motorControl event_id:"
               & EventID'Image (event_id)
               & ",left: "
               & Integer'Image (current_speed_left)
               & ",Right: "
               & Integer'Image (current_speed_left));
            set_motor_speed (id => LeftMotor, value => current_speed_left);
            set_motor_speed (id => RightMotor, value => current_speed_Right);
         end if;
         --  if event_id = UpPressed then
         --     if current_speed_left >= current_speed_Right then
         --        max_speed := current_speed_left;
         --     else
         --        max_speed := current_speed_Right;
         --     end if;
         --     current_speed_left := max_speed + 100;
         --     current_speed_Right := max_speed + 100;
         --  --  if current_speed_left /= current_speed_Right then
         --  --     max_speed := Ada.Numerics.Min_Max.Max (Left => X, Right => Y);
         --  --  else
         --  --     current_speed_left := current_speed_left + 100;
         --  --     current_speed_Right := current_speed_Right + 100;
         --  --  end if;
         --  elsif event_id = DownPressed then
         --     --  current_speed_left := current_speed_left - 100;
         --     --  current_speed_Right := current_speed_Right - 100;
         --     if current_speed_left <= current_speed_Right then
         --        min_speed := current_speed_left;
         --     else
         --        min_speed := current_speed_Right;
         --     end if;
         --     current_speed_left := min_speed - 100;
         --     current_speed_Right := min_speed - 100;
         --  elsif event_id = LeftPressed then
         --     current_speed_left := 0;
         --  elsif event_id = RightPressed then
         --     current_speed_Right := 0;
         --  --  current_speed_Right := current_speed_Right - 150;
         --  end if;
         --  Put_Line
         --    ("motorControl event_id:"
         --     & EventID'Image (event_id)
         --     & ",left: "
         --     & Integer'Image (current_speed_left)
         --     & ",Right: "
         --     & Integer'Image (current_speed_left));
         --  set_motor_speed (id => LeftMotor, value => current_speed_left);
         --  set_motor_speed (id => RightMotor, value => current_speed_Right);
         exit when simulation_stopped;
      end loop;
   end;
end;
