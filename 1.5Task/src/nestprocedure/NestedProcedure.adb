with Ada.Text_IO;
package body nestedprocedure is
procedure son_procedure is
begin
Ada.Text_IO.Put_Line ("Son procedure");
end son_procedure;
procedure father_procedure is
begin
son_procedure;
Ada.Text_IO.Put_Line ("Father procedure");
end father_procedure;
end nestedprocedure;