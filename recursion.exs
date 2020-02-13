defmodule Recursion do
    @doc """
        Compute the product between of n and m

        product of n and m :
            if n is 0 
                then ...
            otherwise
                the result ...
    """

    # Recursive product function using only addition

    # case
    def prod(n, m) do 
        IO.puts to_string(n) <> " + " <> to_string(m)
        case m do
            0 -> 0
            _ -> n + prod(m-1, n)
        end
    end

    # cond
    def prod2(n, m) do
        IO.puts to_string(n) <> " + " <> to_string(m)
        cond do
            m == 0 ->
                0
            true ->
                n + prod2(m-1, n)   
        end
    end

    # if / else
    def prod3(n, m) do
        IO.puts to_string(n) <> " + " <> to_string(m)
        if m == 0 do 
            0 
        else 
            n + prod2(m-1, n)              
        end
    end

    # ALT4
    def prod4(0, m) do 0 end
    def prod4(n, 0) do 0 end
    def prod4(n, m) do
        n + prod4(m-1, n)
    end

    # Fibonacci
    def fib(0) do 0 end
    def fib(1) do 1 end
    def fib(n) do 
        fib(n-1) + fib(n-2)
    end 

    # Benchmarking the Fibonacci caluclation of the n:th number in the series (number 34, takes 0,1 seconds..)
    def bench_fib() do
        ls = [8,10,12,14,16,18,20,22,24,26,28,30,32,34]
        n = 10

        bench = fn(l) ->
            t = time(n, fn() -> fib(l) end)
            :io.format("n: ~4w  fib(n) calculated in: ~8w us~n", [l, t])
        end

        Enum.each(ls, bench)
    end

    def time(n, call) do
        {t, _} = :timer.tc(fn -> loop(n, call) end)
        trunc(t/n)
    end
        
    def loop(0, _ ) do :ok end
    def loop(n, call) do 
        call.()
        loop(n-1, call)
    end

    # Don't try to high numbers..
    def ackerman(0, n) do n + 1 end
    def ackerman(m, 0) when m > 0 do 
        ackerman(m-1, 1)
    end
    def ackerman(m, n) do 
        ackerman(m-1, ackerman(m, n-1))
    end
end