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

# Module End
end