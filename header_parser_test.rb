require 'minitest/autorun'
require 'minitest/pride'
require './header_parser'

class HeaderParserTest < Minitest::Test

  def test_it_places_h1_tags_around_chunks_with_one_hash
    header = HeaderParser.new("# This is an h1 chunk.")
    expected = "<h1>This is an h1 chunk.</h1>"
    result = header.header_parser
    assert_equal expected, result
  end

  def test_it_places_h2_tags_around_chunks_with_two_hashes
    header = HeaderParser.new("## This is an h2 chunk.")
    expected = "<h2>This is an h2 chunk.</h2>"
    result = header.header_parser
    assert_equal expected, result
  end

  def test_it_places_h3_tags_around_chunks_with_three_hashes
    header = HeaderParser.new("### This is an h3 chunk.")
    expected = "<h3>This is an h3 chunk.</h3>"
    result = header.header_parser
    assert_equal expected, result
  end

  def test_it_places_h4_tags_around_chunks_with_four_hashes
    header = HeaderParser.new("#### This is an h4 chunk.")
    expected = "<h4>This is an h4 chunk.</h4>"
    result = header.header_parser
    assert_equal expected, result
  end

  def test_correctly_recognizes_headers
    header = HeaderParser.new("## This is a header chunk.")
    expected = true
    result = header.header?
    assert_equal expected, result
  end

  def test_recognizes_what_is_not_a_header
    header = HeaderParser.new("This is not a header chunk.")
    expected = false
    result = header.header?
    assert_equal expected, result
  end

  def test_it_finds_the_first_space_after_hashes
    header = HeaderParser.new("## This is an h2 chunk.")
    expected = 2
    result = header.first_space
    assert_equal expected, result
  end

  def test_it_defines_the_text_start
    header = HeaderParser.new("## This is an h2 chunk.")
    expected = 3
    result = header.text_start
    assert_equal expected, result
  end

  def test_it_defines_the_text_body
    header = HeaderParser.new("## This is an h2 chunk.")
    expected = "This is an h2 chunk."
    result = header.text_body
    assert_equal expected, result
  end

  def test_it_gives_the_correct_header_number
    header = HeaderParser.new("## This is an h2 chunk.")
    expected = 2
    result = header.header_number
    assert_equal expected, result
  end

end
