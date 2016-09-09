
require Logger

defmodule ElixirHessian do
  use Application

  def start(_type, _args) do
    Logger.info("starting elixir hessian client ...")

    ElixirHessian.Client.start_link()
  end

end
