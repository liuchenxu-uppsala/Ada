package ppredicts is
   subtype subInteger is Integer range 1 .. Integer'Last
   with Dynamic_Predicate => subInteger > 0 and subInteger mod 2 = 0;
   type DAY is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
   subtype Work_Day is DAY
   with Static_Predicate => Work_Day in Mon | Tue | Wed | Thu | Fri;
end ppredicts;