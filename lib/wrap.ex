defmodule Wrap do

  def wrap(text, col_number) do
    list_of_words = String.split(text, " ")
    do_wrap(col_number, "", list_of_words)
  end

  defp do_wrap(_col_number, result, []), do: result
  defp do_wrap(col_number, result, [word | rest]) do

    lines = String.split(result, "\n")
    current_line_size = List.last(lines) |> String.length
    attempted_line = current_line_size + String.length(word)
    # updated_text = result <> word

    cond do
      length(rest) == 0 ->
        updated_text = result <> word
        if String.ends_with?(updated_text, " ") do
          do_wrap(col_number, String.replace_trailing(updated_text, " ", "\n"), rest)
        else
          do_wrap(col_number, updated_text, rest)
        end
      attempted_line > col_number ->
        do_wrap(col_number, String.replace_trailing(result, " ", "\n") <> word <> " ", rest)
      attempted_line == col_number ->
        do_wrap(col_number, result <> word <> "\n", rest)
      attempted_line < col_number ->
        do_wrap(col_number, result <> word <> " ", rest)
    end
  end
end
