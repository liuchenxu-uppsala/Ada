with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

procedure convert is
   float_value      : Float := 3.3;
   int_value        : Integer := 1;
   type Color is (RED, YELLOW, GREEN);
   string_int_value : String := "12";
   function Int_to_Float is new Ada.Unchecked_Conversion(Source => Integer,Target => Float);
begin
   declare
   string_value:Integer := 0;
   color_value:Color;
   begin
   string_value := Integer'Value (string_int_value);
   Put_Line ("string_int_value: "&Integer'Image(string_value));
   color_value := YELLOW;
   Put_Line ("Color value:"&Color'Image(color_value));
   Put_Line ("float_value" & Integer'Image(Integer(float_value)));
   end;
end;
