defmodule Wrap do

  def wrap(text, col_number) do
    list_of_words = String.split(text, " ")
    do_wrap(col_number, "", list_of_words)
  end

  defp do_wrap(_word_boundary, result, []), do: String.strip(result) <> "\n"
  defp do_wrap(word_boundary, result, [word | rest]) do

    lines = String.split(result, "\n")
    current_line_size = List.last(lines) |> String.length
    attempted_line = current_line_size + String.length(word)

    cond do
      attempted_line > word_boundary ->
        do_wrap(word_boundary, String.replace_trailing(result, " ", "\n") <> word <> " ", rest)
      attempted_line == word_boundary ->
        do_wrap(word_boundary, result <> word <> "\n", rest)
      attempted_line < word_boundary ->
        do_wrap(word_boundary, result <> word <> " ", rest)
    end
  end
end

