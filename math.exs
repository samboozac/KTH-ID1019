defmodule Math do

    def sum(a, b) do
        IO.puts a + b
    end

    def sub(a, b) do
        IO.puts a - b
    end

    def mult(a, b) do
        IO.puts a * b
    end

    def div(a, b) do
        if (b === 0) do 
            IO.puts "You can't divide by 0 (Zero)"
        else
            IO.puts a / b
        end
    end

    def pi do
        IO.puts 3.14
    end

    def len(a) do 
        IO.puts(String.length(a))
    end
    
    # rem(5, 2) gives the remainder of 5 /2 --> 1
end
