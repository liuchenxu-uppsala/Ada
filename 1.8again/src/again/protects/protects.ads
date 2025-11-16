package protects is
   protected type protect is
      procedure increase (num : in Integer);
      function read_value return Integer;
      entry decrease (num : in Integer);
      private
      shared_value:Integer := 0;
   end;
end;