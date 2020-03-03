# Written By: Sam Florin
# Date: 2019-03-02
# Description: Exam 2019-03-08 problems solved independently (Solutions not optimal)

defmodule Exam_solved3 do 
    # ______________________________________________ 2019-03-058 _____________________________________________ #
    # ----------------------------------------------   Part 1   --------------------------------------------- #
    # ---------------------------------------------- Assign 1.0 --------------------------------------------- #
    # Expand a coded sequence
    def decode([]) do [] end
    def decode(list) do decode(list, []) end
    def decode([], new_list) do new_list end
    def decode([{key, value} | rest], new_list) do 
        decode(rest, add(key, value, new_list))
    end
    
    # Helper
    def add(_, 0, new_list) do new_list end
    def add(k, v, new_list) do add(k, v - 1, append(k, new_list)) end

    # Append function
    def append(e, []) do [e] end
    def append(e, [h | t]) do
        [h | append(e, t)]
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.0 --------------------------------------------- #
    # Take two lists and return a list where the i:th element is a tuple {xi, yi} for zip(x, y) (Same length)
    def zip(l1, l2) do zip(l1, l2, []) end
    def zip([], [], new_list) do new_list end
    def zip([h | t], [h2 | t2], new_list) do 
        zip(t, t2, [{h, h2} | new_list])
    end

    # Reverse using append
    def zip2(l1, l2) do zip2(l1, l2, []) end
    def zip2([], [], new_list) do new_list end
    def zip2([h | t], [h2 | t2], new_list) do 
        zip2(t, t2, append({h, h2}, new_list))
    end

    def zip3(l1, l2) do zip3(l1, l2, []) end
    def zip3([], [], new_list) do reverse2(new_list) end
    def zip3([h | t], [h2 | t2], new_list) do 
        zip3(t, t2, [{h, h2} | new_list])
    end

    # Reverse Helper
    def reverse([]) do [] end
    def reverse(list) do reverse(list, []) end
    def reverse([], revd) do revd end
    def reverse([h | t], revd) do reverse(t, [h | revd]) end 
    
    # Reverse Helper using the append
    def reverse2([]) do [] end
    def reverse2([h | t]) do append(h, reverse2(t)) end

    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 3.0 --------------------------------------------- #
    # Balance a Tree, returns the balance and the depth of the tree
    def balance(:nil) do {0, 0} end
    def balance({:node, _, l, r}) do 
        {dl, il} = balance(l)
        {dr, ir} = balance(r) 
        {max(dl, dr) + 1, max(0, abs(dl-dr))}
    end

    def balance2(:nil) do {0, 0} end
    def balance2({:node, _, l, r}) do 
        {dl, il} = balance2(l)
        {dr, ir} = balance2(r)
        depth = max(dl, dr) + 1 
        imbalance =  max(0, abs(dl-dr))
        {depth, imbalance}
    end

    # Total sum of the ndoe values of a tree. Works with the nodes: {:node, value, left, right}
    def sum_tree(:nil) do 0 end
    def sum_tree({:node, v, left, right}) do 
        slt = sum_tree(left)
        srt = sum_tree(right)
        sum = slt + srt + v
    end

    # Tree with Nodes and Leafs!
    def sum_tree2(:nil) do 0 end
    def sum_tree2({:leaf, value}) do value end
    def sum_tree2({:node, v, left, right}) do 
        slt = sum_tree2(left)
        srt = sum_tree2(right)
        sum = slt + srt + v
    end

    # OK traversal
    def trav(:nil) do [0] end
    def trav({:leaf, value}) do [value] end
    def trav({:node, v, left, right}) do 
        slt = trav(left)
        srt = trav(right)
        [v | merge(slt, srt)]
    end

    # Alternative 
    def trav2(:nil) do [:nil] end
    def trav2({:leaf, value}) do [value] end
    def trav2({:node, v, left, right}) do 
        slt = trav2(left)
        srt = trav2(right)
        [v] ++ slt ++ srt
    end

    def mrge(l1, l2) do mrge(l1, l2, []) end
    def mrge([], [], new_list) do new_list end
    def mrge(l1, [h | t], new_list) do mrge(l1, t, apnd(h, new_list)) end
    def mrge([h | t], [], new_list) do mrge(t, [], apnd(h, new_list)) end

    # Quick merge (Not in order)
    def merge(l1, []) do l1 end
    def merge(l1, [h | t]) do merge(apnd(h, l1), t) end
    # Quick apnd
    def apnd(e, []) do [e] end
    def apnd(e, [h | t]) do [h  | apnd(e, t)] end
    
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 4.0 --------------------------------------------- #
    # Evaluate an expression, recursive
    def eval({:sum, v1, v2}) do eval(v1) + eval(v2) end
    def eval({:sub, v1, v2}) do eval(v1) - eval(v2) end
    def eval({:mul, v1, v2}) do eval(v1) * eval(v2) end
    def eval({:div, v1, v2}) do eval(v1) / eval(v2) end
    def eval({:neg, v}) do -v end
    def eval(v) do v end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 5.0 --------------------------------------------- #
    # n:th sequence of Gray code
    # Container function
    def gray(0) do [[]] end
    def gray(n) do next(gray(n-1)) end
    # Calculation 
    def next(l1) do
        l2 = rev(l1)
        l1 = aply_prpnd(0, l1)
        l2 = aply_prpnd(1, l2)
        mrg(l1, l2)
    end

    def aply_prpnd(e, list) do aply_prpnd(e, list, []) end
    def aply_prpnd(e, [], new_list) do new_list end
    def aply_prpnd(e, [h | t], new_list) do aply_prpnd(e, t, app(prepend(e, h), new_list)) end
    # Helper - to map the prepend function to all the lists
    #def map(f, []) do [] end
    #def map(f, list) do map(f, list, []) end
    #def map(f, [], new_list) do new_list end
    #def map(f, [h | t], new_list) do map(f, t, [f.(h) | new_list]) end
    # Helper - Merges two lists
    def mrg(l1, []) do l1 end
    def mrg(l1, [h | t]) do mrg(app(h, l1), t) end
    # Helper - Reverse a list
    def rev([]) do [] end
    def rev([h | t]) do app(h, rev(t)) end
    # Helper - Append an element to a list
    def app(e, []) do [e] end
    def app(e, [h | t]) do [h | app(e, t)] end 
    # Helper - Prepend an element to a list
    def prepend(e, list) do [e | list] end

    # Alternative
    def gray2(0) do [[]] end 
    def gray2(n) do
        l1 = gray2(n-1)
        l2 = rev(l1)
        mrg(update(l1, 0), update(l2, 1))
    end

    def update([], _) do [] end
    def update([h | t], e) do [ [e | h] | update(t, e)] end

    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 7.0 --------------------------------------------- #
    # A stream of fibonacci numbers - Pattern match an anonimous funciton (very simple..)
    def fib() do fn() -> fib(1, 0) end end
    def fib(f1, f2) do 
        {:ok, f1, fn() -> fib(f1+f2, f1) end}
    end

    def take(inf, 0) do
        {:ok, [], inf}
    end
    def take(inf, n) do
        {:ok, next, cont} = inf.()
        {:ok, rest, cont} = take(cont, n-1)
        {:ok, [next | rest], cont}
    end

# Module End
end