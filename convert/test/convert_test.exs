defmodule ConvertTest do
  use ExUnit.Case
  doctest Convert

  test "greets the world" do
    assert Convert.hello() == :world
  end
end
