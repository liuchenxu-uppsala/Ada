with Vector2D;

package Vector3D is
   type V3D is new Vector2D.Vector with record
      Z_Coord : Float := 0.0;
   end record;

   overriding function X(Self : V3D) return Float;
   overriding function Y(Self : V3D) return Float;
   function Z(Self : V3D) return Float;
   overriding function Create(X, Y : Float) return V3D;

   function Create_V3D(X, Y, Z : Float) return V3D;
end Vector3D;
