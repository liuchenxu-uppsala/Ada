with Ada.Text_IO; use Ada.Text_IO;

package body subs is
   procedure calc is
      procedure helper is
      begin
         Put_Line ("helper");
      end;
      function calc_real (a : in Integer; b : in Integer) return Integer is
      begin
         return a + b;
      end;
      procedure two_params (first_param : in Integer; two_param : in Integer)
      is
      begin
         Put_Line
           ("two params,first_param:"
            & Integer'Image (first_param)
            & "two_param:"
            & Integer'Image (two_param));
      end;
   begin
      Put_Line ("-----------subs----------------");
      Put_Line ("procedure calc Start");
      helper;
      declare
         sum : Integer := 0;
      begin
         sum := calc_real (a => 3, b => 5);
         Put_Line ("function calc_real sum:"&Integer'Image(sum));
      end;
      Put_Line ("function two_params Start");
      two_params(first_param=>7,two_param=>8);
   end;
end;
