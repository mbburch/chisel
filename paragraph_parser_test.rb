require 'minitest/autorun'
require 'minitest/pride'
require './paragraph_parser'

class ParagraphParserTest < Minitest::Test

  def test_it_places_p_tags_around_paragraphs
    paragraph = ParagraphParser.new
    paragraph.paragraph_parser
    assert_equal "<p>This is a paragraph chunk.</p>", paragraph.paragraph_parser
  end

  def test_it_does_not_place_p_tags_around_hashes
    paragraph = ParagraphParser.new("## This is not a paragraph chunk.")
    paragraph.paragraph_parser
    assert_equal "## This is not a paragraph chunk.", paragraph.paragraph_parser
  end

end
