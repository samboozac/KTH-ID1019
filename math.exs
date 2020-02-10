defmodule Math do

    def sum(a, b) do
        a + b
    end

    def sub(a, b) do
        a - b
    end

    def mult(a, b) do
        a * b
    end

    def div(a, b) do
        if (b === 0) do 
            IO.puts "You can't divide by 0 (Zero)"
        else
            a / b
        end
    end

    def pi do
        3.14
    end

end
