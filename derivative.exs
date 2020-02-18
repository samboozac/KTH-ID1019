defmodule Derivative do
    # A function in Elixir: fn(x) -> x * 2 end
    # f = fn(x) -> x * 2 end

    # @type literal() :: {:const, number()} | {:const, atom()} | {:var, atom()}¨
    # @type expr() :: {:add, expr(), expr()} | {:mul, expr(), expr()} | literals()

    # Example Expression: 2 * x + 3 represented in elexir by: {:add, {:mul, {:const, 2}, {:var, x}}, {:const, 3}}
    # Not so practical but it has advantages in elixir clauses.. 

    # Derive function
    def deriv({:const, _}, _) do {:const, 0} end
    def deriv({:var, v}, v) do {:const, 1} end
    def deriv({:var, y}, _) do {:const, 0} end
    def deriv({:mul, e1, e2}, v) do
        {:add, {:mul, deriv(e1, v), e2}, {:mul, e1, deriv(e2, v)}}
    end
    def deriv({:exp, {:var, v}, {:const, c}}, v) do
        {:mul, {:const, c}, {:exp, {:var, v}, {:const, c - 1}}}
    end
    def deriv({:add, e1, e2}, v) do
        {:add, deriv(e1, v), deriv(e2, v)}
    end

    # Simplyfy.. 
end