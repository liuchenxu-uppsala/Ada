with Ada.Text_IO; use Ada.Text_IO;
procedure discriminantrecord is
   type Stu (name_length : Positive) is record
      Name : String (1 .. name_length);
      Age  : Integer;
   end record;
   student : Stu (4) := (name_length => 4, Name => "Alex", Age => 30);
   stu1 :Stu(5);
   stu2 :Stu(name_length => 9);
begin
   stu1.Name := "55555";
   stu2.Name := "999999999";
   Put_Line ("student:"&student.Name);
   Put_Line ("stu1:"&stu1.Name);
   Put_Line ("stu2:"&stu2.Name);
end;