defmodule Exshell do
  @doc """
  Lazily crawl a tree

  ## Examples
      iex> Exshell.tree_stream([:a, [:b, :c, :d, [:e, :f]]], fn {_k,v} -> is_map(v); v -> is_list(v) end, fn m when is_map(m) -> Enum.map(m, &Enum.to_list/1); {_k,v} -> v; v -> v end) |> Enum.take(8)
      [:a, [:b, :c, :d, [:e, :f]], :b, :c, :d, [:e, :f], :e, :f]

      iex> Exshell.tree_stream(%{a: %{b: :c, d: %{e: :f}}}, fn {_k,v} -> is_map(v); v -> is_list(v) end, fn m when is_map(m) -> Enum.map(m, &Enum.to_list/1); {_k,v} -> v; v -> v end) |> Enum.take(4)
      [a: %{b: :c, d: %{e: :f}}, b: :c, d: %{e: :f}, e: :f]
  """
  def tree_stream(root, branch?, get_child_nodes) do
    Stream.transform(
      root,
      [],
      fn
        [], acc -> {:halt, acc}
        el, acc ->
            case branch?.(el) do
              true ->
                child_nodes = get_child_nodes.(el)
                child_stream = tree_stream(child_nodes, branch?, get_child_nodes)
                {
                  Stream.concat([el], child_stream),
                  acc
                }
              false ->
                {[el], acc}
            end
      end)
  end
end
