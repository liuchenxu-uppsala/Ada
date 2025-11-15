package pre_post is
   function squart (x : in Integer) return Integer
   with
     Pre  => x > 0,
     Post => squart'Result > 0 and then (abs (Float(squart'Result * squart'Result - x)) < 0.0001);
   procedure Increase (x : in out Integer)
   with Pre => x > 0, Post => (x'Old =(x + 1));
   --  and then;
end pre_post;
