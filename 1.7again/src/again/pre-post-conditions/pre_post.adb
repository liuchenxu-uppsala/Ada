package body pre_post is
   function squart (x : in Integer) return Integer is
   begin
      return x * x;
   end squart;

   procedure Increase (x : in out Integer) is
   begin
      x := x + 1;
   end Increase;
end pre_post;