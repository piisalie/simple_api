defmodule SimpleApiTest do
  use ExUnit.Case
  doctest SimpleApi

  test "greets the world" do
    assert SimpleApi.hello() == :world
  end
end
