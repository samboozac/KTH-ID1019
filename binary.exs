defmodule Binary_tree do
    # ========================================= THEORY =========================================
    # Simplest form of representing a tree:
    ### :nil                            - Empty Tree
    ### {:leaf, value}                  - A Leaf
    ### {:node, value, left, right}     - A node

    # Smaller values to the left, Larger values to the right -->     left < right
    # ========================================= THEORY =========================================


    def binary() do end

    # Takes an element and a tree, returns a ':yes' if the element exists in the tree and ':no' if not. 
    # _: 'Don't care case'
    # The most basic Tree: {:node, 2, {:leaf, 1}, {:leaf, 3}}
    # Binary Tree member lookup ================================================
    def member(_, :nil) do :no end
    def member(e, {:leaf, e}) do :yes end
    def member(_, {:leaf, _}) do :no end
    def member(e, {:node, e, _, _}) do :yes end
    def member(e, {:node, v, left, _}) when e < v do 
        member(e, left)
    end 
    def member(e, {:node, _, _, right}) do
        member(e, right)
    end
    # Binary Tree member lookup ================================================

    # Takes an element and a tree and returns a new tree with the elemented inserted correctly
    # Binary Tree insert =======================================================
    # NOT WORKING?????
    def insert(e, nil) do {:leaf, e} end
    def insert(e, {:leaf, d}) when e >= d do {:node, d, nil, {:leaf, e}} end
    def insert(e, {:leaf, d}) when e < d do {:node, d, {:leaf, e}, nil} end
    def insert(e, {:node, d, left, right}) when e >= d do {:node, d, left, insert(e, right)} end
    def insert(e, {:node, d, left, right}) when e < d do {:node, d, insert(e, left), right} end
    # Binary Tree insert =======================================================


end