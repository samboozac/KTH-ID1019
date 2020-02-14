defmodule Lists do
    def link do 
        list_1 = [1, 2, 3]
        list_2 = [4, 5, 6]
        list_3 = list_1 ++ list_2

        list = [1,2,3,4]
        IO.puts(list_3)
        IO.puts(list)
        IO.puts([1,2,3,4] ++ [0])
    end

    def test do
        [1,2,3,4]
    end

    def tak(list) do
        Enum.at(list, 0)
    end

    def drp(list) do
        [head | tail] = list
        tail
    end

    def len([]) do 0 end
    def len(list) do
        [head | tail] = list
        1 + len(tail)
    end

    def sum([]) do 0 end
    def sum(list) do 
        [head | tail] = list
        head + sum(tail)
    end

    def duplicate(list, acc \\ [0]) # One parameter defaults to duplicate(parameter, [0]) 
    def duplicate([], [0]) do [] end # Empty list
    def duplicate([], acc) do acc end # When the list is recursivelsy traversed
    def duplicate([head | tail], [0]) do duplicate(tail, [head, head]) end # First Call (acc = [0])
    def duplicate([head | tail], acc) do # Standard case
        duplicate(tail, acc ++ [head, head]) 
    end


    # Solve add without 2 functions??
    def exists(elem, []) do false end
    def exists(elem, [head | tail]) do 
        if elem == head do
            true
        else
            exists(elem, tail)
        end
    end

    def add(elem, []) do [] end
    def add(elem, list) do 
        if exists(elem, list) do
            list
        else
            list++[elem]
        end
    end

    #  OK, but without Enum? 
    def add2(elem, []) do [] end
    def add2(elem, list) do
        if Enum.member?(list, elem) do
            list
        else    
            list++[elem]
        end
    end 

    # Reverse a list ( [1,2,3] --> [3,2,1] )
    def reverse(list) do reverse(list, []) end
    def reverse([], new_list) do new_list end
    def reverse([head | tail], new_list) do
        reverse(tail, [head | new_list])
    end

    # (Using the fast append function)
    def reverse2([]) do [] end
    def reverse2([head | tail]) do
        append3(reverse2(tail), [head])
    end

    # Same as first reverse ^^
    def reverse3(list) do reverse3(list, []) end
    def reverse3([], done) do done end
    def reverse3([head | tail], new_list) do 
        reverse3(tail, [head | new_list])
    end

    # reverse3 - rev3, much faster...
    # Performance Test ===========================================================================================================================
    def bench() do
        ls = [16, 32, 64, 128, 256, 512]
        n = 100
        # bench is a closure: a function with an environment.
        bench = fn(l) ->
            seq = Enum.to_list(1..l)
            tn = time(n, fn -> reverse2(seq) end)
            tr = time(n, fn -> reverse3(seq) end)
            :io.format("length: ~10w  rev2: ~8w us    rev3: ~8w us~n", [l, tn, tr])
        end

        # We use the library function Enum.each that will call
        # bench(l) for each element l in ls
        Enum.each(ls, bench)
    end

        # Time the execution time of the a function.
        def time(n, fun) do
            start = System.monotonic_time(:milliseconds)
            loop(n, fun)
            stop = System.monotonic_time(:milliseconds)
            stop - start
        end

        # Apply the function n times.
        def loop(n, fun) do
            if n == 0 do
                :ok
            else
                fun.()
                loop(n - 1, fun)
            end
        end
        # ========================================================================================================================================


    # Recursive remove (remove and element if there is one..)
    # First call (2 params..)
    def remove(elem, list) do remove(elem, list, []) end
    # if the item exists
    def remove(elem, [head | tail], new_list) when head == elem do
        remove(elem, tail, new_list)
    end
    # Put the head in the new_list
    def remove(elem, [head | tail], new_list) do
        remove(elem, tail, [head | new_list])
    end
    # Last call when the list is empty, reverse the list back to normal
    def remove(elem, [], new_list) do
        Enum.reverse(new_list)
    end

    # remove2 OK - using reverse..
    def remove2(el, list) do remove2(el, list, []) end
    def remove2(el, [h | t], new_list) when h == el do
        remove2(el, t, new_list)
    end
    def remove2(el, [h | t], new_list) do
        remove2(el, t, [h | new_list])
    end
    def remove2(el, [], new_list) do 
        reverse(new_list)
    end

    # Prints a list where all numbers are unique..
    def unique(list) do unique(list, []) end
    def unique([head | tail], new_list) do
        if Enum.member?(new_list, head) do
            unique(tail, new_list)
        else
            [head | unique(tail, [head | new_list])]
        end
    end
    def unique([], _) do
        []
    end

    # Alt
    def unique2(list) do 
        Enum.uniq(list)
    end

    # Append
    # standard
    def append(l1, l2) do
        l1 ++ l2
    end
    # Alt
    def append2(l1, l2) do
        Enum.concat(l1, l2)
    end
    # Quickest..
    def append3([h | t], tail) do
        [h | append(t, tail)]
    end
    def append3([], tail) do
        tail
    end

    # max(list) - Returns the max value in a list
    def max(list) do _max(list, nil) end
    # Private functions ========================================================================
    defp _max([], current_max) do current_max end
    defp _max([head | tail], current_max) when is_nil(current_max) do _max(tail, head) end
    defp _max([head | tail], current_max) when head >= current_max do _max(tail, head) end
    defp _max([head | tail], current_max) when head < current_max do _max(tail, current_max) end
    # ==========================================================================================

    # max2(list) - defp "definition private" often renamed to _functionName
    # Only max(list) can be accessed in public. 
    def max2(list) do _max2(list, 0) end
    defp _max2([], max) do max end
    defp _max2([h | t], curr_max) when curr_max == 0 do _max2(t, h) end
    defp _max2([h | t], curr_max) when h >= curr_max do _max2(t, h) end
    defp _max2([h | t], curr_max) when h < curr_max do _max2(t, curr_max) end

end
