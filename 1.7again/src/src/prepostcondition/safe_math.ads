-- 文件名: safe_math.ads

package Safe_Math is

   -- 安全计算平方根的函数
   function Square_Root_Safe (X : Float) return Float
      with 
         -- 【前置条件 Pre】：X 必须是非负数
         -- 否则，调用者使用了无效输入，程序将拒绝执行。
         Pre  => X >= 0.0,
         
         -- 【后置条件 Post】：返回值 (Result) 必须满足以下条件
         -- 1. 结果必须是非负数。
         -- 2. 结果的平方与输入 X 的差距在一个小的误差范围内 (容忍浮点误差)。
         -- Result'Old(X) 语法在 Post 检查中不常用，这里使用 Result'Old 是一个误区，
         -- 我们应该直接使用 Result (返回值) 和 X (输入值)。
         -- 让我们修正后置条件：
         Post => (Result >= 0.0) and then 
                 (abs (Result * Result - X) < 0.0001); 
                 -- 检查 (结果的平方 约等于 输入X)
                 
   -- 引入一个 Procedure 来演示 In-Out 参数的后置条件
   procedure Increment_Limited (Value : in out Integer)
      with
         -- 【前置条件 Pre】：Value 必须小于最大限制 100
         Pre  => Value < 100,
         
         -- 【后置条件 Post】：确保 Value 确实增加了 1 (使用 Value'Old 引用输入旧值)
         Post => Value = Value'Old + 1;
         
end Safe_Math;