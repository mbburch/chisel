require 'minitest/autorun'
require 'minitest/pride'
require './paragraph_parser'

class ParagraphParserTest < Minitest::Test

  def test_it_places_p_tags_around_paragraphs
    paragraph = ParagraphParser.new("This is a paragraph chunk.")
    expected = "<p>This is a paragraph chunk.</p>"
    result = paragraph.paragraph_parser
    assert_equal expected, result
  end

  def test_recognizes_what_is_a_paragraph
    paragraph = ParagraphParser.new("This is a paragraph chunk.")
    expected = true
    result = paragraph.paragraph?
    assert_equal expected, result
  end

  def test_recognizes_what_is_not_a_paragraph
    paragraph = ParagraphParser.new("## This is not a paragraph chunk.")
    expected = false
    result = paragraph.paragraph?
    assert_equal expected, result
  end

end
