-- 文件名: safe_counter_pkg.adb
with Ada.Text_IO; use Ada.Text_IO;

package body Safe_Counter_Pkg is

   -- 实现保护对象的内部逻辑
   protected body Protected_Counter is

      -- 1. 实现存/取钱过程
      procedure Increment (Amount : in Integer) is
      begin
         Counter := Counter + Amount; -- 安全修改共享数据 Counter
         Put_Line("Server Log: 存入/取出 " & Integer'Image(Amount) & 
                  ", 新余额: " & Integer'Image(Counter));
      end Increment;

      -- 2. 实现查余额函数
      function Get_Value return Integer is
      begin
         return Counter; -- 安全读取共享数据 Counter
      end Get_Value;

      -- 3. 实现条件等待入口
      -- "when Counter > 0" 就是屏障 (Barrier)
      entry Wait_For_Positive 
      when Counter > 0 
      is
      begin
         -- 假设这个操作是取走 1 个单位的资源
         Counter := Counter - 1; 
         Put_Line("Server Log: Wait_For_Positive 操作完成，剩余: " & Integer'Image(Counter));
      end Wait_For_Positive;

   end Protected_Counter;

end Safe_Counter_Pkg;



-- 文件名: main.adb
--  with Ada.Text_IO; use Ada.Text_IO;
--  with Ada.Real_Time; use Ada.Real_Time;
--  with Safe_Counter_Pkg; use Safe_Counter_Pkg; -- 导入保护对象及其操作

--  procedure Main_Protected_Demo is
   
--     -- 1. 存款任务：负责将钱存入金库
--     task Deposit_Task;
   
--     task body Deposit_Task is
--     begin
--        delay 0.5; -- 稍等片刻，让 Withdrawal_Task 先挂起
--        Put_Line("Deposit: 任务启动，开始存入 5 个单位。");
      
--        -- 调用保护过程：这是互斥访问，但这里没有竞争
--        Protected_Counter.Increment(Amount => 5); 
      
--        delay 1.0; 
--        Put_Line("Deposit: 再次存入 2 个单位。");
--        Protected_Counter.Increment(Amount => 2);
--     end Deposit_Task;

   
--     -- 2. 取款任务：试图在余额不足时等待
--     task Withdrawal_Task;
   
--     task body Withdrawal_Task is
--     begin
--        Put_Line("Withdrawal: 任务启动，尝试 Wait_For_Positive (当前余额 0)。");
      
--        -- 调用保护入口：如果 Counter=0，该任务将在这里挂起！
--        Protected_Counter.Wait_For_Positive; 
--        Put_Line("Withdrawal: 条件满足，任务被唤醒并执行操作！");
      
--        Put_Line("Withdrawal: 再次尝试等待 (余额不足时会挂起)。");
--        Protected_Counter.Wait_For_Positive; 
--        Put_Line("Withdrawal: 第二次操作完成！");
--     end Withdrawal_Task;

--     Current_Value : Integer;

--  begin -- Main
--     Put_Line("--- Main Program ---");
   
--     -- Main 只是启动任务，然后等待它们完成
   
--     delay 3.0; -- 给予任务足够的时间完成操作
   
--     -- Main 查询最终余额：这是一个安全的并行访问
--     Current_Value := Protected_Counter.Get_Value; 
   
--     Put_Line("Main: 所有任务完成。最终金库余额: " & Integer'Image(Current_Value));
--     Put_Line("--------------------");
   
--  end Main_Protected_Demo;