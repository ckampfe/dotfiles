defmodule Exshell do
  def traverse(enum) do
    Stream.transform(
      enum,
      [],
      fn(el, acc) ->
        case traverse_branch?(el) do
          true ->
            child_nodes = traverse_child_nodes(el)
            child_stream = traverse(child_nodes)
            {
              Stream.concat([el], child_stream),
              acc
            }
          false ->
            {[el], acc}
        end
      end)
  end

  defp traverse_branch?({_k, v}) when is_map(v) or is_list(v), do: true
  defp traverse_branch?(el) when is_map(el) or is_list(el), do: true
  defp traverse_branch?(_), do: false

  defp traverse_child_nodes(el) when is_map(el), do: Stream.into(el, [])
  defp traverse_child_nodes(el) when is_list(el), do: el
  defp traverse_child_nodes({_k, v}), do: v
end
