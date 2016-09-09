
defmodule ElixirHessian.Client do
  
  def start_link do
    :hessian.start_link()
  end

  def request url, method, params \\ [] do
    :hessian.call(to_char_list(method), Enum.map(params, &(to_char_list(&1))), to_char_list(url)) 
  end

end
