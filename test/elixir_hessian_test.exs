defmodule ElixirHessianTest do
  use ExUnit.Case
  doctest ElixirHessian

  defmodule Example do
    use ElixirHessian.Base

    defp request_host, do: "http://192.168.1.18"

    defp package_name, do: "nbService/com..nb.service.IContentService"
  end

  test "the truth" do
    assert 1 + 1 == 2
    Example.start
    IO.inspect(Example.request "newInfo", ["b1e960c1"])
  end
end
