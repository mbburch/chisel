require 'minitest/autorun'
require 'minitest/pride'
require './header_parser'

class HeaderParserTest < Minitest::Test

  # add <p> to this class, too? It's an easy add to the method

  def test_it_splits_input_into_an_array
    header = HeaderParser.new("# This is a heading!\n\nThis is a paragraph.\n\n# Another heading.\n\nParagraph!")
    header.chunkify
    assert_equal ["# This is a heading!", "This is a paragraph.", "# Another heading.", "Paragraph!"], header.chunkify
  end

  def test_it_does_not_change_paragraph_elements_in_an_array
    header = HeaderParser.new(["# This is a heading!", "This is a paragraph.", "## Another heading.", "Paragraph!"])
    header.header_to_html
    assert_equal ["<h1>This is a heading!</h1>", "This is a paragraph.", "<h2>Another heading.</h2>", "Paragraph!"], header.header_to_html
  end

  def test_it_places_h1_tags_around_elements_with_one_hash_in_an_array
    skip
    header = HeaderParser.new(["# This is a heading!", "This is a paragraph.", "# Another heading.", "Paragraph!"])
    header.header_to_html
    assert_equal ["<h1>This is a heading!</h1>", "This is a paragraph.", "<h1>Another heading.</h1>", "Paragraph!"], header.header_to_html
  end

  def test_it_places_h2_tags_around_elements_with_two_hashes_in_an_array
    skip
    header = HeaderParser.new(["## This is a heading!", "This is a paragraph.", "# Another heading.", "Paragraph!"])
    header.header_to_html
    assert_equal ["<h2>This is a heading!</h2>", "This is a paragraph.", "<h1>Another heading.</h1>", "Paragraph!"], header.header_to_html
  end

  def test_it_joins_array_back_to_string
    skip
    header = HeaderParser.new(["<h1>This is a heading!</h1>", "This is a paragraph.", "<h1>Another heading.</h1>", "Paragraph!"])
    header.mushify
    assert_equal ("<h1>This is a heading!</h1>\n\nThis is a paragraph.\n\n<h1>Another heading.</h1>\n\nParagraph!"), header.mushify(["<h1>This is a heading!</h1>", "This is a paragraph.", "<h1>Another heading.</h1>", "Paragraph!"])
  end


end
