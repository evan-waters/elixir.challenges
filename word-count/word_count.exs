defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    count(
      String.replace(sentence, ~r/[!@,:%&\$\^]/, "")
      |> String.downcase
      |> String.split(~r/[\s_]/, trim: true), %{})
  end

  defp count([head | tail], acc) when is_binary(head) do
    count(tail, Map.put(acc, head, Map.get(acc, head, 0) + 1))
  end

  defp count([head | tail], acc) do
    count(tail, acc)
  end

  defp count([], acc) do
    acc
  end
end
