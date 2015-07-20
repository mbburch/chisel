require 'minitest/autorun'
require 'minitest/pride'
require './strong_parser'

class StrongParserTest < Minitest::Test

  def test_it_replaces_two_asterisks_with_strong_tags
    strong = StrongParser.new("This *chunk* has two **strong** **tags**.")
    expected = "This *chunk* has two <strong>strong</strong> <strong>tags</strong>."
    result = strong.strong_parser
    assert_equal expected, result
  end

  def test_correctly_recognizes_strong_text
    strong = StrongParser.new("This *chunk* has two **strong** **tags**.")
    expected = true
    result = strong.strong
    assert_equal expected, result
  end

  def test_recognizes_what_is_not_strong_text
    strong = StrongParser.new("This *chunk* has no *strong* *tags*.")
    expected = false
    result = strong.strong
    assert_equal expected, result
  end

  def test_it_correctly_labels_open_tags
    strong = StrongParser.new("This *chunk* has two **strong** **tags**.")
    expected = "This *chunk* has two <strong>strong** **tags**."
    result = strong.strong_open
    assert_equal expected, result
  end

  def test_it_correctly_labels_closed_tags
    strong = StrongParser.new("This *chunk* has two <strong>strong** **tags**.")
    expected = "This *chunk* has two <strong>strong</strong> **tags**."
    result = strong.strong_close
    assert_equal expected, result
  end

end
