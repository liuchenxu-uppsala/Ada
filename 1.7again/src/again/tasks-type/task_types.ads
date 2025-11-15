package task_types is
   task type Work_Type is
      entry AssignWork (Job : in Integer);
      entry StopWork;
   end Work_Type;
end task_types;