class OrderedListParser

  attr_reader :chunk, :ordered_list

  def initialize(chunk)
    @chunk = chunk
    @ordered_list = " "

  end

  def ordered_list?
    chunk.start_with?("1. ")
  end

  def list_items
    chunk.split("\n")
  end

  def first_space
    chunk.index(" ")
  end

  def text_start
    1 + first_space
  end

  def text_body(item)
    item[text_start..item.length].rstrip
  end

  def list_item_marker
    ordered_list = list_items.map do |item|
      "\t<li>#{text_body(item)}</li>\n"
    end
    ordered_list.join
  end

  def ordered_list_parser
    "<ol>\n#{list_item_marker}</ol>"
  end
end

if __FILE__ == $0
  ordered = OrderedListParser.new
  p ordered.ordered_list_parser
end
