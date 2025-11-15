with Ada.Text_IO; use Ada.Text_IO;

package calculate_server_pkg is
   task calculate_server is
      entry Add_Get_Value (value : in Integer; result : out Integer);
      entry exit_server;
   end calculate_server;
end calculate_server_pkg;
