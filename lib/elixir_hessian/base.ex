
defmodule ElixirHessian.Base do

  defmacro __using__(_) do
    quote do

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

      defoverridable [request_host: 0, request_port: 0, package_name: 0]

    end

  end

  def start_link do
    ElixirHessian.Client.start_link
  end

end

