with Ada.Text_IO;
use Ada.Text_IO;
procedure workaccess is
   subtype NameString is String (1 .. 5);
   type worker is record
      worker_name : NameString;
      age         : Integer;
   end record;
   type worker_access is access worker;
   worker_point:worker_access;
begin
   worker_point := new worker'(worker_name => "QWERT", age => 30);
   Put_Line ("worker name:"&worker_point.worker_name&",age:"&Integer'Image(worker_point.age));
end;