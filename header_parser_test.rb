require 'minitest/autorun'
require 'minitest/pride'
require './header_parser'

class HeaderParserTest < Minitest::Test

  def test_it_places_h1_tags_around_chunks_with_one_hash
    header = HeaderParser.new("# This is an h1 chunk.")
    header.header_parser
    assert_equal "<h1>This is an h1 chunk.</h1>", header.header_parser
  end

  def test_it_places_h2_tags_around_chunks_with_two_hashes
    header = HeaderParser.new("## This is an h2 chunk.")
    header.header_parser
    assert_equal "<h2>This is an h2 chunk.</h2>", header.header_parser
  end

  def test_it_places_h3_tags_around_chunks_with_three_hashes
    header = HeaderParser.new("### This is an h3 chunk.")
    header.header_parser
    assert_equal "<h3>This is an h3 chunk.</h3>", header.header_parser
  end

  def test_it_places_h4_tags_around_chunks_with_four_hashes
    header = HeaderParser.new("#### This is an h4 chunk.")
    header.header_parser
    assert_equal "<h4>This is an h4 chunk.</h4>", header.header_parser
  end

  def test_it_does_not_place_h_tags_around_paragraphs
    header = HeaderParser.new("This is not a header chunk.")
    header.header_parser
    assert_equal "This is not a header chunk.", header.header_parser
  end

end
