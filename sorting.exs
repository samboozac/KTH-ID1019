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
    
