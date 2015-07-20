require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_loads_input_into_an_array
    chisel = Chisel.new
    expected = ["# My Life in Desserts  ", "## Chapter 1: The Beginning  ", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\"", "My favorite cuisines are:", "* Sushi\n* Barbeque\n* Mexican", "My favorite desserts are:", "1. Ice cream\n2. Pie\n3. Cookies\n"]
    result = chisel.load_input
    assert_equal expected, result
  end

  def test_it_loads_parsed_chunks_into_a_new_array
    chisel = Chisel.new
    expected = ["<h1>My Life in Desserts</h1>", "<h2>Chapter 1: The Beginning</h2>", "<p>\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.\"</p>", "<p>My favorite cuisines are:</p>", "<ul>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ul>", "<p>My favorite desserts are:</p>", "<ol>\n\t<li>Ice cream</li>\n\t<li>Pie</li>\n\t<li>Cookies</li>\n</ol>"]
    result = chisel.assign_parser
    assert_equal expected, result
  end

  def test_it_joins_html_array_into_string
    chisel = Chisel.new
    expected = "<h1>My Life in Desserts</h1>\n\n<h2>Chapter 1: The Beginning</h2>\n\n<p>\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in <strong>Food & Wine</strong> this place has been packed every night.\"</p>\n\n<p>My favorite cuisines are:</p>\n\n<ul>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ul>\n\n<p>My favorite desserts are:</p>\n\n<ol>\n\t<li>Ice cream</li>\n\t<li>Pie</li>\n\t<li>Cookies</li>\n</ol>"
    result = chisel.join_html
    assert_equal expected, result
  end

end
