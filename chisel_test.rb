require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel_practice'

class ChiselTest < Minitest::Test

  def test_it_loads_input_into_an_array
    chisel = Chisel.new("# This is a heading!\n\nThis is a paragraph\n\n# Another heading.\n\nParagraph!", "./test_output.txt")
    markdown = "# This is a heading!\n\nThis is a paragraph\n\n# Another heading.\n\nParagraph!"
    expected = ["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph!"]
    result = chisel.load_input
    assert_equal expected, result
  end

  def test_it_loads_parsed_chunks_into_a_new_array
    skip
    chisel = Chisel.new(["#This is a heading!", "This is a paragraph.", "#Another heading.", "Paragraph! "], "./test_output.txt")
    expected = ["<h1>This is a heading!</h1>", "<p>This is a paragraph.</p>", "<h1>Another heading.</h1>", "<p>Paragraph!</p>"]
    result = chisel.assign_parser
    assert_equal expected, result
  end

  def test_it_joins_html_array_into_string
    skip
    chisel = Chisel.new(["<h1>This is a heading!</h1>", "<p>This is a paragraph.</p>", "<h1>Another heading.</h1>", "<p>Paragraph!</p>"], "./test_output.txt")
    expected = "<h1>This is a heading!</h1>\n\n<p>This is a paragraph.</p>\n\n<h1>Another heading.</h1>\n\n<p>Paragraph!</p>"
    result = chisel.join_html
    assert_equal expected, result
  end

  def test_it_saves_output
    skip
    chisel = Chisel.new("./test_input.md", "./test_output.txt")
    assert_equal expected, result
  end

end
