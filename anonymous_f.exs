defmodule Anonymous_f do
    def test do
        # Add can be passed around
        add = fn a, b -> a + b end
        IO.puts(add.(1, 2))
        IO.puts(is_function(add))
    end
end