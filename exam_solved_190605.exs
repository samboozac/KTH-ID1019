# Written By: Sam Florin
# Date: 2019-02-27
# Description: Exam 2019-06-05 problems solved independently (Solutions not optimal)

defmodule Exam_solved2 do 
    # ______________________________________________ 2019-06-05 _____________________________________________ #
    # ----------------------------------------------   Part 1   --------------------------------------------- #
    # ---------------------------------------------- Assign 1.0 --------------------------------------------- #
    # Remove every n:th element in a given list
    def drop(n, []) do [] end
    def drop(n, _) when n <= 0 do "Invalid 'n', try again!" end
    def drop(n, list) do drop(n, list, [], 1) end
    def drop(n, [], new_list, _) do new_list end    
    def drop(n, [first | rest], new_list, n) do drop(n, rest, new_list, 1) end
    def drop(n, [first | rest], new_list, i) do drop(n, rest, [first | new_list], i + 1) end

    # random lenght list function
    def len([]) do 0 end
    def len(list) do len(list, 0) end
    def len([], acc) do acc end
    def len([first | rest], acc) do
        len(rest, acc + 1)
    end 
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 2.0 --------------------------------------------- #
    # OK Rotating a list with 'n' hops
    def rotate2(_, []) do [] end
    def rotate2(0, list) do list end
    def rotate2(n, [first | rest]) do rotate(n - 1, put_last(first, rest)) end
    def put_last(e, []) do [e] end
    def put_last(e, [first | rest]) do [first | put_last(e, rest)] end
    # GOOD Rotating a list with 'n' hops
    def rotate(n, []) do [] end
    def rotate(0, list) do list end
    def rotate(n, [first | rest]) do 
        rotate(n - 1, append(first, rest))
    end
    # Helper for rotating a list
    def append(e, []) do [] end
    def append(e, list) do append(e, list, []) end
    def append(e, [], new_list) do reverse([e | new_list]) end
    def append(e, [first | rest], new_list) do append(e, rest, [first | new_list]) end
    # Helper for rotating a list
    def reverse([]) do [] end
    def reverse(list) do reverse(list, []) end
    def reverse([], new_list) do new_list end
    def reverse([first | rest], new_list) do reverse(rest, [first | new_list]) end
    # Put last training..
    def putl(e, []) do [e] end
    def putl(e, [h | t]) do 
        [h | putl(e, t)]    
    end
    # Very fast append ( tail recursive )
    # USE THIS ONE.. =)
    def appnd(e, []) do [e] end
    def appnd(e, [h | t]) do [h | appnd(e, t)] end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 3.0 --------------------------------------------- #
    # n:th leaf
    # Return the n:th leaf by traversing a binary tree
    # {:found, val} if the nth leaf was found
    # {:cont, k} if only n-k leaf was found and you would need k more to find the nth
    # @type tree() :: {:leaf, any()} | {:node, tree(), tree()}
    def nth(1, {:leaf, value}) do {:found, value} end
    def nth(n, {:leaf, _}) do {:cont, n-1} end
    def nth(n, {:node, left, right}) do 
        case nth(n, left) do
            {:found, val} ->
                {:found, val}
            {:cont, k} -> 
                nth(k, right)
        end
    end

    def nth2(1, {:leaf, value}) do {:found, value} end
    def nth2(n, {:leaf, _}) do {:cont, n - 1} end
    def nth2(n, {:node, left, right}) do
        case nth2(n, left) do
            {:found, value} -> 
                {:found, value}
            {:cont, k} -> 
                nth2(k, right)
        end
    end

    # Depth First Search
    # Easy..
    def dfs(nil) do [] end
    def dfs({:leaf, value}) do [value] end
    def dfs({:node, value, left, right}) do [value] ++ dfs(left) ++ dfs(right) end

    # GOOD and SIMPLE TRAVERSE (Fast?)
    def trav({:leaf, v}) do [v] end
    def trav({:node, v, l, r}) do [v | merge(trav(l), trav(r))] end
    def merge([], []) do [] end
    def merge([], l2) do l2 end
    def merge([h | t], l2) do merge(t, [h | l2]) end

    # Breadth First Search
    # Hard..    
    def bfs(nil) do [] end
    def bfs({:leaf, value}) do [value] end
    def bfs({:node, value, left, right}) do 

    end
    
# Module End
end