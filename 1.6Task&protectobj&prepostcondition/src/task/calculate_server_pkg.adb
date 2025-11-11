with Ada.Text_IO; use Ada.Text_IO;

package body calculate_server_pkg is
   task body calculate_server is
      inner_sum : Integer := 0;
   begin
      loop
         select
            accept Add_Get_Value (value : in Integer; result : out Integer) do
               inner_sum := value + inner_sum;
               result := inner_sum;
            end Add_Get_Value;
         or
            accept exit_server do
            Put_Line("Server: 收到停止服务请求，退出循环。");
            end exit_server;
            exit;
         or
            terminate;
         end select;
      end loop;
   end calculate_server;
end calculate_server_pkg;
