package worktask is
   task type work is
      entry work (job : Integer);
      entry stop_work;
   end work;
end worktask;