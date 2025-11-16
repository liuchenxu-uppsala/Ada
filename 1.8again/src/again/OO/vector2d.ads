package Vector2D is
   type Vector is tagged private;
   
   function Create(x, y : Float) return Vector;
   
   function X(Self : Vector) return Float;
   function Y(Self : Vector) return Float;

private
   type Vector is tagged record
      X_Coord : Float := 0.0;
      Y_Coord : Float := 0.0;
   end record;
end Vector2D;
