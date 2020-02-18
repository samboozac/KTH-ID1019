defmodule Binary_encoding do

    # Decimal to Binary representation =================
    def to_binary(int) do to_binary(int, []) end
    def to_binary(0, acc) do acc end
    def to_binary(n, acc) do 
        to_binary(div(n, 2), [rem(n, 2) | acc])
    end
    # Decimal to Binary representation =================

    # Binary representation to Decimal (Reversed) ============================================
    def to_integer(bin) do to_integer(bin, 0) end
    def to_integer([], acc) do acc end
    def to_integer(list, acc) do 
        [head | tail] = list
        if head == 1 do
            to_integer(tail, acc + pow(2, len(list)-1))
        else
            to_integer(tail, acc)
        end
    end

    # Helper function_1 called from Bin --> Integer (Decimal)
    def len(list) do len(list, 0) end
    def len([], len) do len end
    def len([head | tail], current_len) do
        len(tail, current_len + 1)
    end
    
    # Helper function_2 called from Bin --> Integer (Decimal)
    def  pow(n, k) do pow(n, k, 1) end      
    defp pow(_, 0, acc) do acc end
    defp pow(n, k, acc) do pow(n, k - 1, n * acc) end
    # Binary representation to Decimal (Reversed) ============================================

end