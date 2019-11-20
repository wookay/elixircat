# https://elixirschool.com/

defmodule BasicTest do
  use ExUnit.Case
  require Core

  test "collections" do
    list = [1, 2, 3]
    assert hd(list) == 1
    assert tl(list) == [2, 3]

    tuple = {1, 2, 3}
    assert elem(tuple, 0) == 1
    assert elem(tuple, 1) == 2
    assert elem(tuple, 2) == 3

    keyword_list1 = [foo: 1, bar: 2]
    keyword_list2 = [{:foo, 1}, {:bar, 2}]
    assert keyword_list1 == keyword_list2

    map = %{:foo => 1, :bar => 2}
    assert map[:foo] == 1
    assert map[:bar] == 2

    assert Core.typeof(fn -> nil end) == Function
    assert Core.typeof("abc") == Binary
    assert Core.typeof(<< 3 >>) == Binary
    assert Core.typeof([88, 89, 90]) == List
    assert Core.typeof('XYZ') == List
    assert Core.typeof(1) == Integer
    assert Core.typeof(3.14) == Float
  end

  test "match" do
    x = 1
    1 = x
    assert x == 1
  end

  def foo() do
  end

  test "pattern matching" do
    val = case foo() do
      {:ok, _} -> 1
      nil -> 2
    end
    assert val == 2
  end

  test "anonymous function" do
    sum = fn (a, b) -> a + b end
    assert sum.(1, 2) == 3
    assert &(&1 + &2).(1, 2) == 3
  end

  def g(f, s) do
    f.(s)
  end

  test "function" do
    f = Function.capture(String, :length, 1)
    assert f.("abc") == 3
    assert g(f, "abc") == 3
  end

  require Logger
  test "Logger, IO" do
    Logger.info(IO)
    IO.inspect(Logger)
  end
end
