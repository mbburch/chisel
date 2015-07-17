require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_loads_input
    chisel = Chisel.new("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
    assert_equal "#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!", chisel.load_input
  end

  def test_it_splits_input_into_an_array
    chisel = Chisel.new("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
    assert_equal ["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph!"], chisel.chunkify
  end

  def test_it_saves_output
    skip
    chisel = Chisel.new("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
    assert_equal "#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!", chisel.save_output
  end

end
