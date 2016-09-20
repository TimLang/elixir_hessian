
require Logger

defmodule ElixirHessian do
  use Application
  use ElixirHessian.Base

  def start(_type, _args) do
    Logger.info("starting elixir hessian client ...")

    ElixirHessian.Base.start_link()
  end

end

