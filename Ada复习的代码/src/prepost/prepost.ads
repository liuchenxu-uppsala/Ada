package prepost is
   function squart (amount : in Integer) return Float
   with Pre => amount > 10, Post => squart'Result > 5.0;
   --  Post => (Result >= 0.0) and then
   --    (abs (Result * Result - X) < 0.0001);
   --  Post => Value = Value'Old + 1;
end prepost;