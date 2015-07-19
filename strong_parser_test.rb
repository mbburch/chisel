require 'minitest/autorun'
require 'minitest/pride'
require './strong_parser'

class StrongParserTest < Minitest::Test

  def test_it_replaces_two_asterisks_with_s_tags
    strong = StrongParser.new
    strong.strong_parser
    assert_equal "This *chunk* has two <strong>strong</strong> <strong>tags</strong>.", strong.strong_parser
  end
  #
  # def test_it_does_not_change_words_beginning_with_one_asterisk
  # end
  #
  #
  # def test_it_does_not_change_words_with_asterisks_in_the_middle
  # end
  #
  #
  # def test_it_places_asterisks_inside_of_punctuation
  # end


end
