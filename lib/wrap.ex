defmodule Wrap do
  @break "\n"
  @space " "

  def wrap(text, col_number) do
    list_of_words = String.split(text, @space)
    do_wrap(col_number, "", list_of_words)
  end

  defp do_wrap(_word_boundary, result, []), do: String.strip(result) <> @break
  defp do_wrap(word_boundary, result, [word | rest]) do
    attempted_line = attempt_line(result, word)

    cond do
      attempted_line > word_boundary ->
        do_wrap(word_boundary, replace_space_with_break(result) <> word <> @space, rest)
      attempted_line == word_boundary ->
        do_wrap(word_boundary, result <> word <> @break, rest)
      attempted_line < word_boundary ->
        do_wrap(word_boundary, result <> word <> @space, rest)
    end
  end

  defp attempt_line(result, word) do
    current_line_size = String.split(result, @break)
                        |> List.last
                        |> String.length

    current_line_size + String.length(word)
  end

  defp replace_space_with_break(result), do: String.replace_trailing(result, @space, @break)
end

