package worker is
   type worker is tagged private;
   function Get_X (self : in worker) return Float;
   function Get_Y (self : in worker) return Float;
   type worker is tagged record
      xx : Float;
      yy : Float;
   end record;
end worker;