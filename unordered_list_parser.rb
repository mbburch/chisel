class UnorderedListParser

  attr_reader :chunk, :unordered_list

  def initialize(chunk)
    @chunk = chunk
    @unordered_list = " "

  end

  def unordered_list?
    chunk.start_with?("* ")
  end

  def list_items
    chunk.split("\n")
  end

  def text_body(item)
    item.delete("* ").rstrip
  end

  def list_item_marker
    unordered_list = list_items.map do |item|
      "\t<li>#{text_body(item)}</li>\n"
    end
    unordered_list.join
  end

  def unordered_list_parser
    "<ul>\n#{list_item_marker}</ul>"
  end
end


if __FILE__ == $0
  unordered = UnorderedListParser.new
  p unordered.unordered_list_parser
end





=begin
define UL item as begins with "* "
receives input if chunk begins with "* "
needs to add ul and /ul tags before and after list, putting these on the empty lines.
find the first item in the list and put the ul tag above it
tag each item of the list, making sure to place new line tags at the end of each item
determine if the next chunk is an ul item. if so, add tags, if not add /ul tags
=end
