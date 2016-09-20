
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


 def convert(list) when is_list(list) and length(list) > 0 do
    case list |> List.first do
      {_, _} ->
        Enum.reduce(list, %{}, fn(tuple, acc) ->
          {key, value} = tuple
          Map.put(acc, key, convert(value))
        end)
      _ ->
        list
    end
  end

  def convert(tuple) when is_tuple(tuple) do
    {key, value} = tuple
    Enum.into([{key, convert(value)}], %{})
  end

  def convert(value), do: value

  defp custom_to_char_list(arg) when is_binary(arg) do
    to_char_list(arg)
  end

  defp custom_to_char_list(arg) do
    arg
  end
end

