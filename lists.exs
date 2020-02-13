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
end
