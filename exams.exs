defmodule Exams do 
    # ______________________________________________ 2014-01-16 _____________________________________________ #
    # ---------------------------------------------- Assign 1.1 --------------------------------------------- #
    # TwoThree-Tree
    # Empty tree:   nil
    # Leaf:         {:leaf, key, value}
    # Two-Node:     {:twoNode, key, left, right}
    # Three-Node:   {:ThreeNode, key1, key2, left, mid, right}
    
    # Binary-Tree
    # Empty tree:   :nil
    # Leaf:         {:leaf, value}
    # Node:         {:node, value, left, right}

    def insert(e, nil) do {:leaf, e} end
    def insert(e, {:leaf, d}) when e >= d do {:node, d, nil, {:leaf, e}} end
    def insert(e, {:leaf, d}) when e < d do {:node, d, {:leaf, e}, nil} end
    def insert(e, {:node, d, left, right}) when e >= d do {:node, d, left, insert(e, right)} end
    def insert(e, {:node, d, left, right}) when e < d do {:node, d, insert(e, left), right} end

    def member(e, nil) do :no end
    def member(e, {:leaf, e}) do :yes end
    def member(e, {:leaf, d}) do :no end
    def member(e, {:node, d, left, right}) when e >= d do member(e, right) end
    def member(e, {:node, d, left, right}) when e < d do member(e, left) end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 1.2 --------------------------------------------- #
    # Pattern Matching
    def evaluatePattern do
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
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.1 --------------------------------------------- #
    # Roman Numbers (Simple)
    def romanDecode(list) do romanDecode(list, 0) end
    def romanDecode([], []) do :nulla end
    def romanDecode([], acc) do acc end
    def romanDecode([first | rest], acc) when first == :C do romanDecode(rest, 100 + acc) end
    def romanDecode([first | rest], acc) when first == :L do romanDecode(rest, 50 + acc) end
    def romanDecode([first | rest], acc) when first == :X do romanDecode(rest, 10 + acc) end
    def romanDecode([first | rest], acc) when first == :V do romanDecode(rest, 5 + acc) end
    def romanDecode([first | rest], acc) when first == :I do romanDecode(rest, 1 + acc) end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.2  --------------------------------------------- #
    # Roman Numbers (Complete and Error Safe..)
    def romanDecode2(list) do [first | rest] = romanInterpret(list); romanDecode2(romanInterpret(list), first, 0) end
    def romanDecode2([], _, acc) do acc end
    def romanDecode2([first | rest], prev, acc) when first > prev do 
        case (first - prev) do
            4 -> romanDecode2(rest, first, acc + first - 2)
            9 -> romanDecode2(rest, first, acc + first - 2)
            40 -> romanDecode2(rest, first, acc + first - 20)
            90 -> romanDecode2(rest, first, acc + first - 20)
            _ -> "Not a valid roman series.."
        end
    end
    def romanDecode2([first | rest], prev, acc) do romanDecode2(rest, first, acc + first) end
    # Helper for Decode2
    def romanInterpret(list) do romanInterpret(list, []) end
    def romanInterpret([], new_list) do new_list end
    def romanInterpret([first | rest], new_list) do 
        romanValue = fn(first) -> 
            case first do
                :I -> 1
                :V -> 5
                :X -> 10
                :L -> 50
                :C -> 100
                :D -> 500
                :M -> 1000
            end
        end
        romanInterpret(rest, new_list ++ [romanValue.(first)])
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.3 --------------------------------------------- #
    # Returns the intersection of 2 sets (lists)
    def intersection(l1, l2) do intersection(l1, l2, []) end
    def intersection([], l2, the_intersection) do the_intersection end
    def intersection([first | rest], l2, the_intersection) do 
        case lookup(first, l2) do
            :yes -> intersection(rest, l2, [first | the_intersection])
            :no -> intersection(rest, l2, the_intersection)
        end
    end
    # Helper for intersection
    def lookup(e, []) do :no end
    def lookup(nil, list) do :no end
    def lookup(e, [e | rest]) do :yes end
    def lookup(e, [first | rest]) do lookup(e, rest) end

    # Random function - Merges 2 lists
    def mergeLists([], []) do [] end
    def mergeLists(l1, []) do l1 end
    def mergeLists([], l2) do l2 end
    def mergeLists(l1, [first | rest]) do 
        [first | mergeLists(l1, rest)]
    end
    # Random function - Returns the length of a list
    def len([]) do 0 end
    def len([first | rest]) do 
        1 + len(rest)
    end

    # checks if an element exists in the list
    def exists(e, []) do :no end
    def exists(nil, []) do :no end
    def exists(e, [e | rest]) do :yes end
    def exists(e, [first | rest]) do exists(e, rest) end
    # Returns the union of 2 sets (lists)
    def union(l1, l2) do _union(l1, l2) end
    defp _union([], the_union) do the_union end
    defp _union([first | rest], the_union) do 
        case lookup(first, the_union) do
            :yes -> _union(rest, the_union)
            :no -> _union(rest, [first | the_union])
        end
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.4 --------------------------------------------- #
    # Returns the set difference
    def diff(l1, l2) do diff(l1, l2, l1, []) end
    def diff([], [], _, the_diff) do the_diff end
    def diff([], [first | rest], l1, the_diff) do 
        case lookup(first, l1) do
            :yes -> diff([], rest, l1, the_diff)
            :no -> diff([], rest, l1, [first | the_diff])
        end
    end

    def diff([first | rest], l2, l1, the_diff) do 
        case lookup(first, l2) do
            :yes -> diff(rest, l2, l1, the_diff)
            :no -> diff(rest, l2, l1, [first | the_diff])
        end
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 3.1 --------------------------------------------- #
    # Classic Function to map an operation on a list (f) 
    def map(f, []) do [] end
    def map(f, list) do map(f, list, []) end
    def map(f, [], new_list) do reverse(new_list) end
    def map(f, [first | rest], new_list) do 
        map(f, rest, [f.(first) | new_list])
    end
    # Helper
    def reverse([]) do [] end
    def reverse(list) do reverse(list, []) end
    def reverse([], new_list) do new_list end
    def reverse([first | rest], new_list) do 
        reverse(rest, [first | new_list]) 
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 3.2 --------------------------------------------- #
    # Classic Function to filter a list after a boolean expression (f) 
    def filter(f, []) do [] end
    def filter(f, list) do filter(f, list, []) end
    def filter(f, [], new_list) do reverse(new_list) end
    def filter(f, [first | rest], new_list) do 
        cond do 
            f.(first) == true -> filter(f, rest, [first | new_list]) 
            true -> filter(f, rest, new_list) 
        end
    end
    def filter(f, [first | rest], new_list) do filter(f, rest, new_list) end
    # Classic Function to filter a list after a boolean expression (f) 
    
end