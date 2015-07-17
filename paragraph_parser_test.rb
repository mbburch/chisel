require 'minitest/autorun'
require 'minitest/pride'
require './paragraph_parser'

class ParagraphParserTest < Minitest::Test

  def test_it_splits_input_into_an_array
    parse_paragraph = ParagraphParser.new
    parse_paragraph.chunkify("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
    assert_equal ["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph!"], parse_paragraph.chunkify("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
  end

  def test_it_places_p_tags_around_paragraph_elements_in_an_array
    parse_paragraph = ParagraphParser.new
    parse_paragraph.paragraph_parser(["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph!"])
    assert_equal ["#This is a heading!", "<p>This is a paragraph.</p>", "#Another heading.", "<p>Paragraph!</p>"], parse_paragraph.paragraph_parser(["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph!"])
  end

  def test_it_joins_array_back_to_string
    parse_paragraph = ParagraphParser.new
    parse_paragraph.mushify(["#This is a heading!", "<p>This is a paragraph.</p>", "#Another heading.", "<p>Paragraph!</p>"])
    assert_equal ("#This is a heading!\n\n<p>This is a paragraph.</p>\n\n#Another heading.\n\n<p>Paragraph!</p>"), parse_paragraph.mushify(["#This is a heading!", "<p>This is a paragraph.</p>", "#Another heading.", "<p>Paragraph!</p>"])clear
  end


end
