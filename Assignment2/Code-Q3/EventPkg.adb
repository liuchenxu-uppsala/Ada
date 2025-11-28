with Ada.Text_IO; use Ada.Text_IO;

package body EventPkg is
   --  type EventID is (UpPressed, DownPressed,LeftPressed,RightPressed,InitValue);
   protected body Event is
      entry Wait (id : out EventID) when signalled is
      begin
         id := current_id;
         signalled := false;
         Put_Line ("Wait id:" & EventID'Image (id));
      end;

      procedure Signal (id : in EventID) is
      begin
         current_id := id;
         signalled := true;
         Put_Line ("Signal current_id:" & EventID'Image (current_id));
      end;
   end;
end;
