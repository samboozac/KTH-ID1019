# First Gitbook task
defmodule Test do

    def double(n) do
        IO.puts 2 * n
    end

    def far_to_cel(f) do
        IO.puts (f-32) / 1.8
    end

    def rect_area(a,b) do
        IO.puts a * b
    end

    def square_area(a) do
        rect_area(a, a)
    end

    # Accessing the functions in the math-module through ':math'
    # pow(a, b) ('a raised to the power of b')
    def circle_area(r) do
        IO.puts :math.pow(r, 2) * :math.pi
    end

end