defmodule Basic_types do
    # Basic data types
    integerVar = 1
    integer2Var = 0x0f
    floatVar = 1.0
    booleanVar = true
    atomVar = :atom
    stringVar = "elixir"
    listVar = [1, 2, 3]
    tupleVar = {1, 2, 3}
    intVar = 22
    truuu = (1 == 1.0)
    faals = (1 === 1.0)
    # How atoms and Newline works 
    def atom_demo do
        IO.puts(
            ":apple == :apple -->" <> to_string(:apple == :apple) <> "\n" <>
            ":apple == :pear --> " <> to_string(:apple == :pear)
        )
    end


end