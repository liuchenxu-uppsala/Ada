with Ada.Text_IO; use Ada.Text_IO;

procedure pointer is
   type string_pointer is access String;
   type student_tt is record
      name : string_pointer;
      age  : Integer;
   end record;
   student_an : student_tt;
begin
   student_an.name := new String'("Alice");
   student_an.age := 30;
   Put_Line
     ("student_an.name:"
      & student_an.name.all
      & ",age:"
      & Integer'Image (student_an.age));
end pointer;
