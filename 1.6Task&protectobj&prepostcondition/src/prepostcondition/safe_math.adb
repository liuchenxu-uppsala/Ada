-- 文件名: safe_math.adb
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Safe_Math is

   -- 1. Square_Root_Safe 函数的实现
   function Square_Root_Safe (X : Float) return Float is
   begin
      -- 内部实现（如果逻辑有错，Post 条件会捕获）
      return Sqrt(X);
   end Square_Root_Safe;

   -- 2. Increment_Limited 过程的实现
   procedure Increment_Limited (Value : in out Integer) is
   begin
      -- 这是一个正确的实现
      Value := Value + 1;
      
      -- 如果这里程序员写成了：Value := Value + 2;
      -- 那么 Post 条件 (Value = Value'Old + 1) 将会失败并引发异常！
      
   end Increment_Limited;

end Safe_Math;

-- 文件名: main.adb
--  with Ada.Text_IO; use Ada.Text_IO;
--  with Safe_Math; use Safe_Math;

--  procedure Main_DbC_Demo is
--     X_Bad_Input : Float := -5.0;
--     Y_Good_Input: Float := 16.0;
--     Z_Result    : Float;
   
--     V_Good_Val : Integer := 50;
   
--  begin
   
--     -- 演示 1: 违反对 Square_Root_Safe 的【前置条件】(X >= 0.0)
--     Put_Line("--- 演示 1: 违反前置条件 ---");
--     begin
--        Z_Result := Square_Root_Safe(X => X_Bad_Input); 
--        Put_Line("此行不会执行。");
--     exception
--        when others =>
--           Put_Line("❌ 异常捕获：前置条件不满足。程序被拒绝执行。");
--     end;
   
--     -- 演示 2: 遵守前置条件
--     Put_Line("--- 演示 2: 遵守前置条件 ---");
--     Z_Result := Square_Root_Safe(X => Y_Good_Input);
--     Put_Line("√ 平方根计算结果: " & Float'Image(Z_Result));
--     -- 此时，后置条件在 Sqrt 返回后被自动检查 (例如 4.0 * 4.0 必须接近 16.0)
   
--     -- 演示 3: 遵守 Increment_Limited 的【后置条件】
--     Put_Line("--- 演示 3: 检查后置条件 ---");
--     Put("值 V 初始: " & Integer'Image(V_Good_Val));
--     Increment_Limited(Value => V_Good_Val); -- Post 条件检查 V = 50 + 1
--     Put_Line(", 增量后: " & Integer'Image(V_Good_Val));
   
--  end Main_DbC_Demo;