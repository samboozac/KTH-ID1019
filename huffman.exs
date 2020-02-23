defmodule Huffman do

  # Sample to work with ======================================
  def sample do
    'This is an example of a huffman tree'
  end

  # Text to encode ===========================================
  def text()  do
    'this is something that we should encode'
  end

  # Test =====================================================
  def test do
    sample = sample()
    tree = tree(sample)
  end
  # Test =====================================================

  # Table with frequencies of characters: "hej" --> [{h, 1}, {e, 1}, {j, 1}]
  def freq(sample) do freq(sample, []) end
  def freq([], freq) do freq  end
  def freq([char | rest], freq) do
    freq(rest, count(char, freq) )
  end
  # Frequency of characters  =================================================

  def count(char, []) do [{char, 1}] end
  def count(char, [{char, n} | rest]) do [{char, n + 1} | rest] end
  def count(char, [head | rest]) do
    [head | count(char, rest)]
  end

  # Create tree
  def tree(sample) do
    freq = freq(sample)
    sorted = Enum.sort(freq, fn({_, x}, {_, y}) -> x < y  end)
    build_tree(sorted)
  end


  def build_tree([{tree, _}]) do tree end
  def build_tree([{a, a_freq}, {b, b_freq} | rest]) do
    build_tree( insert({ {a, b}, a_freq + b_freq }, rest))
  end

  def insert({a, a_freq}, []) do [{a, a_freq}] end
  def insert({a, a_freq}, [{b, b_freq} | rest]) when a_freq < b_freq do
      [{a, a_freq}, {b, b_freq} | rest]
  end
  def insert({a, a_freq}, [{b, b_freq} | rest]) do
    [{b, b_freq} | insert({a, a_freq}, rest)]
  end
end