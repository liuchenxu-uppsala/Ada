with main;
with Webots_API;  use Webots_API;
with EventPkg;    use EventPkg;
with Ada.Text_IO; use Ada.Text_IO;
--  with Ada.Numerics.Min_Max;

package body MotorControlTask is
   current_speed_left  : Integer := 100;
   current_speed_Right : Integer := 100;
   is_on_line          : Boolean := false;
   max_speed           : Integer := 0;
   min_speed           : Integer := 0;
   event_id            : EventID;
   gap_speed           : constant Integer := 30;
   blocked_flag             : Boolean := false;
   task body motorControl is
   begin
      loop
         Put_Line ("motorControl Event.Wait");
         Event.Wait (event_id);
         Put_Line ("motorControl event_id:" & EventID'Image (event_id));
         if event_id = Blocked then
            blocked_flag := true;
            set_motor_speed (id => LeftMotor, value => 0);
            set_motor_speed (id => RightMotor, value => 0);
         end if;
         if event_id = Cleared then
            blocked_flag := false;
         end if;
         if not blocked_flag then
            if event_id = Start then
               set_motor_speed (id => LeftMotor, value => current_speed_left);
               set_motor_speed
                 (id => RightMotor, value => current_speed_Right);
            end if;
            if event_id = Direction_Right then
               set_motor_speed (id => LeftMotor, value => 0);
               --  current_speed_Right := current_speed_left + gap_speed;
               set_motor_speed
                 (id => RightMotor, value => current_speed_Right);
            elsif event_id = Direction_Left then
               set_motor_speed (id => RightMotor, value => 0);
               --  current_speed_left := current_speed_Right + gap_speed;
               set_motor_speed (id => LeftMotor, value => current_speed_left);
            elsif event_id = Direction_OK then
               declare
                  min_speed : Integer :=
                    Integer'Min (current_speed_Right, current_speed_left);
               begin
                  set_motor_speed (id => LeftMotor, value => min_speed);
                  set_motor_speed (id => RightMotor, value => min_speed);
               end;
            end if;
         end if;
         --  if event_id = Start then
         --     set_motor_speed (id => LeftMotor, value => current_speed_left);
         --     set_motor_speed (id => RightMotor, value => current_speed_Right);
         --  end if;
         --  if event_id = Direction_Right then
         --     set_motor_speed (id => LeftMotor, value => 0);
         --     --  current_speed_Right := current_speed_left + gap_speed;
         --     set_motor_speed (id => RightMotor, value => current_speed_Right);
         --  elsif event_id = Direction_Left then
         --     set_motor_speed (id => RightMotor, value => 0);
         --     --  current_speed_left := current_speed_Right + gap_speed;
         --     set_motor_speed (id => LeftMotor, value => current_speed_left);
         --  elsif event_id = Direction_OK then
         --     declare
         --        min_speed : Integer :=
         --          Integer'Min (current_speed_Right, current_speed_left);
         --     begin
         --        set_motor_speed (id => LeftMotor, value => min_speed);
         --        set_motor_speed (id => RightMotor, value => min_speed);
         --     end;
         --  end if;
         exit when simulation_stopped;
      end loop;
   end;
end;
