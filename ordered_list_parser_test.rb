require 'minitest/autorun'
require 'minitest/pride'
require './ordered_list_parser'

class OrderedListParserTest < Minitest::Test

  def test_it_correctly_recognizes_an_ordered_list
    ordered = OrderedListParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    expected = true
    result = ordered.ordered_list?
    assert_equal expected, result
  end

  def test_it_recognizes_what_is_not_an_ordered_list
    ordered = OrderedListParser.new("* Sushi\n* Barbeque\n* Mexican")
    expected = false
    result = ordered.ordered_list?
    assert_equal expected, result
  end

  def test_it_splits_list_items_into_array_at_new_lines
    ordered = OrderedListParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    expected = ["1. Sushi", "2. Barbeque", "3. Mexican"]
    result = ordered.list_items
    assert_equal expected, result
  end

  def test_it_finds_the_first_space_in_a_chunk
    ordered = OrderedListParser.new("1. Sushi")
    expected = 2
    result = ordered.first_space
    assert_equal expected, result
  end

  def test_it_defines_the_text_start
    ordered = OrderedListParser.new("1. Sushi")
    expected = 3
    result = ordered.text_start
    assert_equal expected, result
  end

  # def test_it_removes_numbers_from_item
  #   ordered = OrderedListParser.new(["1. Sushi", "2. Barbeque", "3. Mexican"])
  #   expected = "Sushi"
  #   result = ordered.text_body("1. Sushi")
  #   assert_equal expected, result
  # end

  def test_it_replaces_asterisks_with_li_tags_in_ordered_lists
    ordered = OrderedListParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    expected = "\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n"
    result = ordered.list_item_marker
    assert_equal expected, result
  end

  def test_it_places_ol_tags_around_ordered_list
    ordered = OrderedListParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    expected = "<ol>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ol>"
    result = ordered.ordered_list_parser
    assert_equal expected, result
  end

end
