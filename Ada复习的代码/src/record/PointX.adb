with Ada.Text_IO; use Ada.Text_IO;

procedure PointX is
   type Point is record
      x : Float;
      y : Float;
   end record;
   P1 : Point;
   P2 : Point;
begin
   P1.x := 10.0;
   P1.y := 20.2;
   P2 := (4.5, 5.5);
   Put_Line ("P1,x:" & Float'Image (P1.x) & ",y:" & Float'Image (P1.y));
   Put_Line ("P2,x:" & Float'Image (P2.x) & ",y:" & Float'Image (P2.y));
end;
