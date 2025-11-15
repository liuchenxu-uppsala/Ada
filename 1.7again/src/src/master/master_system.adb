with Ada.Text_IO;
with master_system.sub_system;
package body master_system is
procedure master_system_function is
Result : Integer;
begin
Result := master_system.sub_system.sub_system_function(ValueFirst=>17,SecondValue=>18);
end master_system_function;
end master_system;