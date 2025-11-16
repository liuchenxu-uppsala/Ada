-- 文件名: safe_counter_pkg.ads

package Safe_Counter_Pkg is

   -- 声明保护类型：Protected_Counter
   protected Protected_Counter is
      
      -- 1. 存/取钱操作 (Protected Procedure): 互斥访问 (一次只能一个任务执行)
      procedure Increment (Amount : in Integer);
      
      -- 2. 查余额操作 (Protected Function): 并行访问 (多个任务可同时读取)
      function Get_Value return Integer;
      
      -- 3. 条件等待操作 (Protected Entry): 互斥访问 + 屏障条件
      -- 任务只有在 Count > 0 时才允许进入执行。
      entry Wait_For_Positive;
      
   private
      -- 共享数据：账户余额 (只能被 Protected_Counter 内部访问)
      Counter : Integer := 0; 
      
   end Protected_Counter;

end Safe_Counter_Pkg;