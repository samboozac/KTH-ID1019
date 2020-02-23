defmodule Keyvalue_table do

    # Create a list out of a text sample ==================================================
    def create(sample) do create(sample, []) end
    def create([], kv_table) do kv_table end
    def create([head | tail], kv_table) do 
        create(tail, put(head, kv_table))
    end
    # Create a list out of a text sample ==================================================

    # Insert a key or increment the value if it exists ====================================
    def put(key, []) do [{key, 1}] end
    def put(key, [{key, value} | tail]) do [{key, value + 1} | tail] end  
    def put(key, [head | tail]) do
        [head | put(key, tail)]
    end
    # Insert a key or increment the value if it exists ====================================

    # Remove a key from the list ==========================================================
    def remove(key, []) do [] end
    def remove(key, table) do remove(key, table, []) end
    def remove(key, [], new_table) do new_table end
    def remove(key, [{key, n} | tail], new_table) do 
        remove(key, tail, new_table)
    end
    def remove(key, [head | tail], new_table) do remove(key, tail, [head | new_table]) end
    # Remove a key from the list ==========================================================

    # Returns the corresponding value =====================================================
    def get_value(key, []) do "No such key" end
    def get_value(key, [{key, n} | tail]) do n end
    def get_value(key, [head | tail]) do get_value(key, tail) end
    # Returns the corresponding value =====================================================

    # Returns the corresponding Keys ======================================================
    def get_keys(value, table) do get_keys(value, table, []) end
    def get_keys(value, [], []) do "Not existing" end
    def get_keys(value, [], keys) do keys end
    def get_keys(value, [{key, value} | tail], keys) do get_keys(value, tail, [key | keys]) end
    def get_keys(value, [head | tail], keys) do get_keys(value, tail, keys) end
    # Returns the corresponding Key =======================================================

    # Apply Insertion on the table (customize)
    def sort(table) do sort(table, []) end
    def sort([], sorted) do sorted end
    def sort([head | tail], sorted) do 
        sort(tail, insert(head, sorted))
    end

    def insert(value, []) do [value] end
    def insert(value, [min | rest] = sorted) when value <= min do [value | sorted] end
    def insert(value, [min | rest] = sorted) do [min | insert(value, rest)] end
end 