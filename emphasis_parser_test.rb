require 'minitest/autorun'
require 'minitest/pride'
require './emphasis_parser'

class EmphasisParserTest < Minitest::Test

  def test_it_replaces_one_asterisk_with_em_tags
    emphasis = EmphasisParser.new("This *chunk* has two *emphasis* <strong>tags</strong>.")
    expected = "This <em>chunk</em> has two <em>emphasis</em> <strong>tags</strong>."
    result = emphasis.emphasis_parser
    assert_equal expected, result
  end

  def test_correctly_recognizes_emphasized_text
    emphasis = EmphasisParser.new("This *chunk* has two *emphasis* <strong>tags</strong>.")
    expected = true
    result = emphasis.emphasis?
    assert_equal expected, result
  end

  def test_recognizes_non_emphasized_text
    emphasis = EmphasisParser.new("This chunk has no emphasis <strong>tags</strong>.")
    expected = false
    result = emphasis.emphasis?
    assert_equal expected, result
  end

  def test_it_correctly_labels_open_tags
    emphasis = EmphasisParser.new("This *chunk* has two *emphasis* <strong>tags</strong>.")
    expected = "This <em>chunk* has two *emphasis* <strong>tags</strong>."
    result = emphasis.emphasis_open
    assert_equal expected, result
  end

  def test_it_correctly_labels_closed_tags
    emphasis = EmphasisParser.new("This <em>chunk* has two *emphasis* <strong>tags</strong>.")
    expected = "This <em>chunk</em> has two *emphasis* <strong>tags</strong>."
    result = emphasis.emphasis_close
    assert_equal expected, result
  end

end
