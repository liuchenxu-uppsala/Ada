package EventPkg is
   type EventID is
     (UpPressed, DownPressed, LeftPressed, RightPressed, InitValue, Line_Detected, Line_Cleared);
   protected Event is
      entry Wait (id : out EventID);
      procedure Signal (id : in EventID);
   private
      current_id : EventID;
      signalled  : Boolean := false;
   end Event;
end EventPkg;