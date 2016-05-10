defmodule WrapTest do
  use ExUnit.Case

  test "empty string remains the same" do
    assert Wrap.wrap("", 5)  == ""
  end

  test "wraps a single word" do
    assert Wrap.wrap("word", 4) == "word"
  end

  test "replace trailing space with new line" do
    assert Wrap.wrap("word ", 3) == "word\n"
  end

  test "column number is greater than text returns text with new line" do
    assert Wrap.wrap("word ", 6) == "word\n"
  end

  test "wraps two words" do
    assert Wrap.wrap("word word", 4) == "word\nword"
  end

  test "wraps three words" do
    assert Wrap.wrap("word word word", 9) == "word word\nword"
  end

  test "wraps four words" do
    assert Wrap.wrap("word word word word", 14) == "word word word\nword"
  end

  test "does not split words" do
    assert Wrap.wrap("word word word", 6) == "word\nword word"
  end
end
