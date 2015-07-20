require 'minitest/autorun'
require 'minitest/pride'
require_relative 'parser_assigner'

class ParserAssignerTest < Minitest::Test

  def test_it_correctly_assigns_header_chunks
    assigner = ParserAssigner.new
    expected = "<h3>This is a header.</h3>"
    result = assigner.assign_chunk("### This is a header.")
    assert_equal expected, result
  end

  def test_it_correctly_assigns_unordered_list_chunks
    assigner = ParserAssigner.new
    expected = "<ul>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ul>"
    result = assigner.assign_chunk("* Sushi\n* Barbeque\n* Mexican")
    assert_equal expected, result
  end

  def test_it_correctly_assigns_ordered_list_chunks
    assigner = ParserAssigner.new
    expected = "<ol>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ol>"
    result = assigner.assign_chunk("1. Sushi\n2. Barbeque\n3. Mexican")
    assert_equal expected, result
  end

  def test_it_correctly_assigns_paragraph_chunks
    assigner = ParserAssigner.new
    expected = "<p>This is a paragraph.</p>"
    result = assigner.assign_chunk("This is a paragraph.")
    assert_equal expected, result
  end

  def test_it_correctly_assigns_strong_chunks
    assigner = ParserAssigner.new
    expected = "<p>This is a <strong>paragraph</strong>.</p>"
    result = assigner.assign_chunk("This is a **paragraph**.")
    assert_equal expected, result
  end

  def test_it_correctly_assigns_emphasis_chunks
    assigner = ParserAssigner.new
    expected = "<p>This is a <em>paragraph</em>.</p>"
    result = assigner.assign_chunk("This is a *paragraph*.")
    assert_equal expected, result
  end

end
