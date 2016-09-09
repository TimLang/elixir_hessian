
defmodule ElixirHessian.Base do
  
  defmacro __using__(_) do
    quote do

      # TODO :hessian.start_link as application
      #def start, do: :application.ensure_all_started(:elixir_hessian)

      def start, do: ElixirHessian.Client.start_link

      defp request_host do
        "http://www.example.com"
      end

      defp request_port do
        8080
      end

      defp package_name do
        ""
      end

      def request method, params \\ [] do
        request_url = "#{request_host}:#{request_port}/#{package_name}"
        ElixirHessian.Client.request(request_url, method, params)
      end

      defoverridable Module.definitions_in(__MODULE__)

    end
  end

end
