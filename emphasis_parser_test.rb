require 'minitest/autorun'
require 'minitest/pride'
require './emphasis_parser'

class EmphasisParserTest < Minitest::Test

  def test_it_splits_input_into_an_array
    emphasis = EmphasisParser.new
    #edge case * before punctuation
    expected = ["#This **is** a heading!", "This **is** a *paragraph*.", "#Another *heading*.", "Paragraph!"]
    result = emphasis.chunkify("#This **is** a heading!\n\nThis **is** a *paragraph*.\n\n#Another *heading*.\n\nParagraph!")
    assert_equal expected, result
  end

  def test_it_adds_em_tags_to_words_sandwiched_by_one_star
  end

  def test_it_does_not_add_em_tags_to_chunks_sandwiched_by_two_stars
  end

  def test_it_does_not_change_stars_in_the_middle_of_words
  end

  def test_it_places_asterisks_inside_of_punctuation
  end
