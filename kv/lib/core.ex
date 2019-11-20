defmodule Core do

  def typeof(x) when is_function(x) do
    Function
  end

  def typeof(x) when is_binary(x) do
    Binary
  end

  def typeof(x) when is_bitstring(x) do
    BitString
  end

  def typeof(x) when is_list(x) do
    List
  end

  def typeof(x) when is_integer(x) do
    Integer
  end

  def typeof(x) when is_float(x) do
    Float
  end

end
