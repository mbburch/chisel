require 'pry'
require './parser_assigner'
require './fileio'

file = FileIO.new
parser = ParserAssigner.new

input_string = file.read_input
parser.make_array(input_string)

# class Chisel
#
#   attr_reader :assigned_chunks, :html_string
#
#   def initialize
#     @assigned_chunks = []
#     @html_string = html_string
#   end
#
#   def assign_parser
#     parse_it = ParserAssigner.new
#     p file.chunks
#     file.chunks.each do |chunk|
#       assigned_chunks << parse_it.assign_chunk(chunk)
#     end
#     p @assigned_chunks
#   end
#
#   def join_html
#     assign_parser
#     html_string = @assigned_chunks.join("\n\n")
#   end
#
# end
#
# chisel = Chisel.new
# file = FileIO.new
# file.load_input
# chisel.assign_parser
# chisel.join_html
# file.process_output


# ParserAssigner Practice
  # def header_or_paragraph
  #   if chunk[0] == "#"
  #     head = HeaderParser.new(chunk)
  #     chunk = head.header_parser
  #   else
  #     paragraph = ParagraphParser.new(chunk)
  #     chunk = paragraph.paragraph_parser
  #   end
  # end
  #
  # def strong_or_emphasized
  #   if chunk.include?("**")
  #     strong = StrongParser.new(chunk)
  #     chunk = strong.strong_parser
  #   elsif chunk.include?("*")
  #     emphasis = EmphasisParser.new(chunk)
  #     chunk = emphasis.emphasis_parser
  #   else
  #     chunk
  #   end
  # end
  #
  #   def unordered_or_ordered
  #     if chunk.start_with?("* ")
  #       ulist= UnorderedListParser.new(chunk)
  #       chunk = ulist.unordered_list_parser
  #     elsif chunk.start_with?("1. ")
  #       olist = OrderedListParser.new(chunk)
  #       chunk = olist.ordered_list_parser
  #     else
  #       chunk
  #     end
  #   end
