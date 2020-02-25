defmodule Exams do 
    # ------------------------------ 2014-01-16 ------------------------------ #
    def onePtOne do
        # --------->  TwoThree-Tree  <--------- 
        # Empty tree:   nil
        # Leaf:         {:leaf, key, value}
        # Two-Node:     {:twoNode, key, left, right}
        # Three-Node:   {:ThreeNode, key1, key2, left, mid, right}
        
        # --------->  Binary-Tree  <--------- 
        # Empty tree:   :nil
        # Leaf:         {:leaf, value}
        # Node:         {:node, value, left, right}
    end 
    
    def onePtTwo do
        [x | y] = [1,2,3] 
        # [x1, x1] = [1,2,3] (UNDEFINED, No right hand side match...)
        [x2, z2 | y2] = [1,2,3]
        x3 = {:w3, 42} 
        {z3, y3} = x3
        h4 = :head
        t4 = :tail
        y4 = [h4 | t4]

        IO.puts "[x | y] = [1,2,3] --> " <> "#{inspect(y)}" <> "\n" <>
        "[a, b] = [1,2,3] --> Undefined" <> "\n" <> 
        "[x2, z2 | y2] = [1,2,3] --> x2 = " <> to_string(x2) <> "   z2 = " <> to_string(z2) <> "   y2 = #{inspect(y2)}" <> "\n" <>
        "x3 = {:w3, 42} {z3, y3} = x3 --> " <> "z3 = #{z3}" <> "   y3 = #{y3}" <> "\n" <>
        "h = :head, t = :tail, y = [h | t] --> " <> " y4 = #{inspect(y4)}"
    end
        def onePtTwo do
        [x | y] = [1,2,3] 
        # [x1, x1] = [1,2,3] (UNDEFINED, No right hand side match...)
        [x2, z2 | y2] = [1,2,3]
        x3 = {:w3, 42} 
        {z3, y3} = x3
        h4 = :head
        t4 = :tail
        y4 = [h4 | t4]

        IO.puts "[x | y] = [1,2,3] --> " <> "#{inspect(y)}" <> "\n" <>
        "[a, b] = [1,2,3] --> Undefined" <> "\n" <> 
        "[x2, z2 | y2] = [1,2,3] --> x2 = " <> to_string(x2) <> "   z2 = " <> to_string(z2) <> "   y2 = #{inspect(y2)}" <> "\n" <>
        "x3 = {:w3, 42} {z3, y3} = x3 --> " <> "z3 = #{z3}" <> "   y3 = #{y3}" <> "\n" <>
        "h = :head, t = :tail, y = [h | t] --> " <> " y4 = #{inspect(y4)}"
    end
end