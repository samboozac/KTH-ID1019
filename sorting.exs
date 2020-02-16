defmodule Sort do
    # Recursive Hello 
    def hello(0) do "Hello" end
    def hello(n) when n > 0 do 
        "Hello " <> hello(n-1)
    end
end

# Fully Understand 
# Comment up and follow
defmodule Insertion do
    # The Algorithm =========================================
    def sort(list) when is_list(list) do _sort([], list) end
    def _sort(sorted_list, []) do sorted_list end
    def _sort([], [head | tail]) do _sort([head], tail) end
    def _sort(sorted_list, [head | tail]) do
        insert(head, sorted_list) |> _sort(tail)
    end
    # The Algorithm =========================================

    # Helper function  ======================================
    def insert(elem, []) do [elem] end
    def insert(elem, [min | rest]) do
        if min >= elem do 
            [elem | [min | rest]] 
        else 
            [min|insert(elem, rest)] 
        end
    end
    # Helper function  ======================================
end

# Understand Concepts
    # Merge Sort
    # Quick Sort

defmodule Merge do
    # Full Merge Sort ===================================================================
    def sort([]) do [] end 
    def sort([h]) do [h] end
    def sort(list) do
        {left, right} = split(list)
        merge(sort(left), sort(right))
    end
    defp merge(left,[]) do left end
    defp merge([], right) do right end
    defp merge([l_head | l_tail] = left, [r_head | r_tail] = right) do
        case r_head <= l_head do
            true -> [r_head | merge(left, r_tail)]
            false -> [l_head | merge(l_tail, right)]
        end
    end

    defp split(list) do split(list, [], []) end
    defp split([], left, right) do
        {left, right}
    end
    defp split([head], left, right) do # case when only 1 element is left (odd len)
        {[head | left], right}
    end
    defp split([head | tail], left, right) do
        split((tl tail), [head | left], [(hd tail) | right])
    end
    # Full Merge Sort ===================================================================

    # Alternative merge subpart ==================================
    def merge2([],[], acc), do: Enum.reverse acc
    def merge2([h | t], [], acc), do: merge2(t, [], [h | acc])
    def merge2([], [h | t], acc), do: merge2([], t, [h | acc])
    def merge2([lh | lt], [rh | rt], acc) when lh >= rh do
        merge2([lh | lt], rt, [rh | acc])
    end
    def merge2([lh | lt], [rh | rt], acc) when lh < rh do
        merge2(lt, [rh | rt], [lh | acc])
    end
    def merge2(left, right), do: merge2(left, right, [])
    # Alternative merge subpart ==================================
end

# [head | tail] = _listName(_unsort) (To increase readability...)
defmodule Quick do
    # Full Quick Sort =========================================================  
    def sort([head | []]) do [head] end
    def sort([pivot | tail]) do
        {less, grtr} = split(pivot, tail, [], [])
        sort(less) ++ sort(grtr)
    end
    defp split(pivot, [], [], grtr) do {[pivot], grtr} end 
    defp split(pivot, [], less, []) do {less, [pivot]} end 
    defp split(pivot, [], less, grtr) do {less, [pivot|grtr]} end 
    defp split(pivot, [head | tail]=_unsort, less, grtr) do
        case head <= pivot do
            true -> split(pivot, tail, [head|less], grtr)
            false -> split(pivot, tail, less, [head|grtr])
        end
    end
    # Full Quick Sort =========================================================  
end
    
