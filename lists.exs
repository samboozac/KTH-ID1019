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

    
end
