defmodule WrapTest do
  use ExUnit.Case

  test "wraps a single word" do
    assert Wrap.wrap("word", 4) == "word\n"
  end

  test "column number is greater than text returns text with new line" do
    assert Wrap.wrap("word ", 6) == "word\n"
  end

  test "wraps two words" do
    assert Wrap.wrap("word word", 4) == "word\nword\n"
  end

  test "wraps three words" do
    assert Wrap.wrap("word word word", 9) == "word word\nword\n"
  end

  test "wraps four words" do
    assert Wrap.wrap("word word word word", 14) == "word word word\nword\n"
  end

  test "does not split words" do
    assert Wrap.wrap("word word word", 6) == "word\nword\nword\n"
  end

   test "splits odd number of words" do
     assert Wrap.wrap("word word word", 11) == "word word\nword\n"
   end

  test "splits even number of words" do
    assert Wrap.wrap("word word word word", 11) == "word word\nword word\n"
  end
end
