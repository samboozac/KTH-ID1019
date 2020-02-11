# Concatenation Module
defmodule Concat do
    # The \\ means deafault and will use the "-" if no other parameter is specified.
    def join(a, b, sep \\ "-")
    # "when" is a guard for accepted values on b
    def join(a, b, _sep) when is_nil(b) do
        a
    end
    # 3 parameters
    def join(a, b, sep) do
        a <> sep <> b
    end
end
