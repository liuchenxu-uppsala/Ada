with Ada.Text_IO; use Ada.Text_IO;

procedure records is
   type student is record
      name : String(1..5);
      age  : Integer;
   end record;
   stu_li : student := ("Lihua", 20);
   stu_zh : student;
begin
   stu_zh.name := "Zhang";
   stu_zh.age := 30;
   Put_Line ("stu_li name:" & stu_li.name & ",age:" & Integer'Image(stu_li.age));
   Put_Line ("stu_zh name:" & stu_zh.name & ",age:" & Integer'Image(stu_zh.age));
end records;
