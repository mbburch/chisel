require 'minitest/autorun'
require 'minitest/pride'
require './unordered_list_parser'

class UnorderedListParserTest < Minitest::Test

  def test_it_correctly_recognizes_an_unordered_list
    unordered = UnorderedListParser.new("* Sushi\n* Barbeque\n* Mexican")
    expected = true
    result = unordered.unordered_list?
    assert_equal expected, result
  end

  def test_it_recognizes_what_is_not_an_unordered_list
    unordered = UnorderedListParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    expected = false
    result = unordered.unordered_list?
    assert_equal expected, result
  end

  def test_it_splits_list_items_into_array_at_new_lines
    unordered = UnorderedListParser.new("* Sushi\n* Barbeque\n* Mexican")
    expected = ["* Sushi", "* Barbeque", "* Mexican"]
    result = unordered.list_items
    assert_equal expected, result
  end

  def test_it_removes_asterisks_from_item
    unordered = UnorderedListParser.new(["* Sushi", "* Barbeque", "* Mexican"])
    expected = "Sushi"
    result = unordered.text_body("* Sushi")
    assert_equal expected, result
  end

  def test_it_replaces_asterisks_with_li_tags_in_unordered_lists
    unordered = UnorderedListParser.new("* Sushi\n* Barbeque\n* Mexican")
    expected = "\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n"
    result = unordered.list_item_marker
    assert_equal expected, result
  end

  def test_it_places_ul_tags_around_unordered_list
    unordered = UnorderedListParser.new("* Sushi\n* Barbeque\n* Mexican")
    expected = "<ul>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ul>"
    result = unordered.unordered_list_parser
    assert_equal expected, result
  end

end
