# Written By: Sam Florin
# Date: 2019-03-03
# Description: Exam 2018-06-07 problems solved independently (Solutions not optimal)

defmodule Exam_solved4 do 
    # ______________________________________________ 2018-06-07 _____________________________________________ #
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 3.0 --------------------------------------------- #
    def test_expr() do 
        [x, y | z] = [1,2,3] # --> x = 1 , y = 2 , z = [3]
        [x, y | z] = [1,[2,3]] # --> x = 1 , y = [2,3] , z = [] (Just two elements..)
        [x, y | z] = [1 | [2,3]] # --> x = 1 , y = 2 , z = [3] (SAME AS FIRST after eval..)
        [x, y | z] = [1 | [2,3 | [4]]] # --> x = 1 , y = 2 , z = [3,4] ([2,3 | [4]] == [2 | 3 | [4]])
        [x, y | z] = [1,2,3,4] # --> x = 1 , y = 2 , z = [3,4] (SAME AS THE ABOW)
    end

    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 4.0 --------------------------------------------- #
    # Recursion Fizz-Buzz
    def fizzbuzz(n) do fizzbuzz(1, n+1, 1, 1) end
    def fizzbuzz(current, 1, i, j) do [] end    
    def fizzbuzz(current, n, 3, 5) do [:fizzbuzz | fizzbuzz(current+1, n-1, 1, 1)] end
    def fizzbuzz(current, n, 3, j) do [:fizz | fizzbuzz(current+1, n-1, 1, j+1)] end
    def fizzbuzz(current, n, i, 5) do [:buzz | fizzbuzz(current+1, n-1, i+1, 1)] end
    def fizzbuzz(current, n, i, j) do [current | fizzbuzz(current+1, n-1, i+1, j+1)] end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 4.0 --------------------------------------------- #
    # Fairly balanced - ret {:ok, depth} of a treee is fairly balanced or :no if the difference in depth is more than 1
    def fairly(nil) do {:ok, 0} end
    def fairly({:node, value, left, right}) do 
        case fairly(left) do
            {:ok, l} -> 
                case fairly(right) do 
                    {:ok, r} -> 
                        if abs(r-l) < 2 do
                            {:ok, 1 + max(l, r)}
                        else
                            :no
                        end
                    :no -> :no
                end
            :no -> :no
        end
    end

    def depth(nil) do {:depth, 0} end
    def depth({:node, value, left, right}) do 
        {:depth, ld} = depth(left)
        {:depth, rd} = depth(right)
        {:depth, max(ld, rd) + 1}
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 5.0 --------------------------------------------- #
    # Instead of time complexity of insertion sort O(N^2), n is length of list. Construct the sort!
    def sort([]) do [] end
    def sort(list) do sort(list, []) end
    def sort([], sorted) do sorted end
    def sort([h | t], sorted) do sort(t, insert(h, sorted)) end

    def insert(e, []) do [e] end
    def insert(e, [h | t ]) when e < h do [e | insert(h, t)] end
    def insert(e, [h | t ]) do [h | insert(e, t)] end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 5.0 --------------------------------------------- #
    # Instead of time complexity of a direceted acyclic graph O(k^n), n is number of  vertices and k is the branching factor. Construct the graph!
    # Representation of a graph - @type graph :: {:node, any(), [graph() | nil]}
    def search(_, :nil) do :fail end
    def search(e, {:node, e, _}) do :found end
    def search(e, {:node, _, paths}) do
        List.foldl(paths,
            :fail, 
            fn(p, a) -> 
                case a do
                    :found -> 
                        :found
                    :fail -> 
                        search(e, p)
                end
            end)
    end
    # ------------------------------------------------------------------------------------------------------- #
    # ---------------------------------------------- Assign 6.0 --------------------------------------------- #
    # Implement the process and a function dillinger/0 that starts the process
    # Simple State diagram: 
    # start -> NYC -- {:knife} --> knife -- {:fork} --> fork -- {:bottle} --> bottle -- {:cork} --> NYC
    # Create a process (spawn/1)
    # Send a message to a process (send/2)
    # recieve a message on a process (receive/0)
    def dillinger() do 
        spawn(fn() -> nyc() end)
    end
    def nyc() do receive do IO.puts("Hey Joe!"); :knife -> knife() end end
    def knife() do receive do :fork -> fork() end end
    def fork() do receive do :bottle -> bottle() end end
    def bottle() do receive do :cork -> nyc() end end
# Module End
end