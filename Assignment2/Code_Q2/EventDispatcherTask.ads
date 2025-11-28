package EventDispatcherTask is
   --  this tsk is used for getting event from webots
   task type event_dispatcher is
      pragma Priority (5);
   end;
end;