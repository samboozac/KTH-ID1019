defmodule Calc do

    # Working with tuples =======================================
    # elem/2: Access a tuple by index
    # put_elem/3: Insert a value into a tuple by index
    # tuple_size/1: Gets the  number of elements in a tuple
    # Working with tuples =======================================

    # Calculator ============================
    def eval({:int, n}) do n end
    def eval({:add, a, b}) do a + b end
    def eval({:sub, a, b}) do a - b end
    def eval({:div, a, b}) do a / b end
    def eval({:mul, a, b}) do a * b end
    def eval({:var, name}, bindings) do lookup({:var, name}, bindings) end
    # Calculator ============================


    # Find the value of a variable given a list of bindings ======================================
    def lookup({:var, name}, [{:bind, var, value} | _]) when name == var do value end
    def lookup(var, [_ | rest]) do lookup(var, rest) end


    # Find the value of a variable given a list of bindings ======================================

end