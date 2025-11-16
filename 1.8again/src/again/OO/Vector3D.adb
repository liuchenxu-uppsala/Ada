package Vector3D is
   overriding
   function X (Self : V3D) return Float is
   begin
      return Self.X_Coord;
   end X;
   overriding
   function Y (Self : V3D) return Float is
   begin
      return Self.Y_Coord;
   end;
   function Z (Self : V3D) return Float is
   begin
      return Self.Z_Coord;
   end;
   function Create_V3D(x:Float;y:Float;z:Float) return V3D is
   begin
   return (x,y,z);
   end;
   overriding function Create(X, Y : Float) return V3D is
   begin
   return null;
   end;
end Vector3D;