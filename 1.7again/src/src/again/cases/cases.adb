with Ada.Text_IO; use Ada.Text_IO;

procedure cases (value : in Integer) is
begin
   case value is
      when 10     =>
         Put_Line ("value is 10");

      when 20     =>
         Put_Line ("value is 20");

      when others =>
         Put_Line ("value is others");
   end case;
end cases;
