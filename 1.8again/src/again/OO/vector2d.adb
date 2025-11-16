package body vector2d is
   
   function Create(x, y : Float) return Vector is
   begin
      return (X_Coord => x, Y_Coord => y);
   end Create;
   
   function X(Self : Vector) return Float is
   begin
      return Self.X_Coord;
   end X;
   
   function Y(Self : Vector) return Float is
   begin
      return Self.Y_Coord;
   end Y;
   
end vector2d;