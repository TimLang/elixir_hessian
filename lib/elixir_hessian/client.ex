
defmodule ElixirHessian.Client do

  def start_link do
    :hessian.start_link()
  end

  def register_record class_name, class_fields, record do
    :hessian.register_record(class_name, class_fields, record) 
  end

  def request url, method, params \\ [] do
    convert (:hessian.call(to_char_list(method), Enum.map(params, &(custom_to_char_list(&1))), to_char_list(url)))
  end

  def convert(array) when is_list(array) do
    Enum.map(array, fn(item) -> convert(item) end)
  end


  def convert(array) when is_tuple(array) do
    {h, t} = array
    Map.put(%{}, h, convert(t))
  end

  def convert(array) when (array == :null) do
    nil
  end

  def convert(array) do
    array
  end

  defp custom_to_char_list(arg) when is_binary(arg) do
    to_char_list(arg)
  end

  defp custom_to_char_list(arg) do
    arg
  end
end

