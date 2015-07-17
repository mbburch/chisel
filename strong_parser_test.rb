require 'minitest/autorun'
require 'minitest/pride'
require './strong_parser'

class StrongParserTest < Minitest::Test

  def test_it_splits_input_into_an_array
    strong = StrongParser.new
    #edge case * before punctuation
    expected = ["#This **is** a heading!", "This **is** a *paragraph*.", "#Another *heading*.", "Paragraph!"]
    result = strong.chunkify("#This **is** a heading!\n\nThis **is** a *paragraph*.\n\n#Another *heading*.\n\nParagraph!")
    assert_equal expected, result
  end

  def test_it_creates_a_separate_array_from_string_if_two_asterisks_are_included_in_string
    strong = StrongParser.new
    expected = [["#This", "**is**", "a", "heading!"], ["This", "**is**", "a", "*paragraph*."], "#Another *heading*.", "Paragraph!"]
    result = strong.strong_searcher(["#This **is** a heading!", "This **is** a *paragraph*.", "#Another *heading*.", "Paragraph!"])
    assert_equal expected, result
  end

  # def test_it_indexes_arrays_to_locate_elements_with_two_asterisks
  #   strong = StrongParser.new
  #   expected = "The following elements need strong tags: #{element.index("**")}"
  #   result = strong.strong_parser([["#This", "**is**", "a", "heading!"], ["This", "**is**", "a", "*paragraph*."], "#Another *heading*.", "Paragraph!"])
  #   assert_equal expected, result
  # end

  def test_it_replaces_two_asterisks_with_s_tags
    strong = StrongParser.new
    expected = [["#This", "<s>is</s>", "a", "heading!"], ["This", "<s>is</s>", "a", "*paragraph*."], "#Another *heading*.", "Paragraph!"]
    result = strong.strong_parser([["#This", "**is**", "a", "heading!"], ["This", "**is**", "a", "*paragraph*."], "#Another *heading*.", "Paragraph!"])
    assert_equal expected, result
  end

  def test_it_does_not_change_words_beginning_with_one_asterisk
  end

  def test_it_does_not_change_words_with_asterisks_in_the_middle
  end

  def test_it_places_asterisks_inside_of_punctuation
  end

  def test_it_rejoins_the_array_of_strings
    strong = StrongParser.new
    expected = ("#This <s>is</s> a heading! This <s>is</s> a *paragraph*. #Another *heading*. Paragraph!")
    result = strong.mushify_level_one([["#This", "<s>is</s>", "a", "heading!"], ["This", "<s>is</s>", "a", "*paragraph*."], "#Another *heading*.", "Paragraph!"])
    assert_equal expected, result
  end

  def test_it_returns_string_to_one_line
    strong = StrongParser.new
    expected = "#This <s>is</s> a heading!\n\nThis <s>is</s> a *paragraph*.\n\n#Another *heading*.\n\nParagraph!"
    result = strong.mushify_final(["#This <s>is</s> a heading!", "This <s>is</s> a *paragraph*.", "#Another *heading*.", "Paragraph!"])
    assert_equal expected, result
  end

end
