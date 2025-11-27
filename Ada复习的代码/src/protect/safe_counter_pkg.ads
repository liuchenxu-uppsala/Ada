package safe_counter_pkg is
   protected Safe_Counter is
      procedure Increament (amount : in Integer);
      function Get_Value return Integer;
      entry Wait_For_Positive;
   private
      sum : Integer := 0;
   end Safe_Counter;
end;