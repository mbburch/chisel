require 'pry'
class HeaderParser

  attr_reader :input, :chunks

  def initialize(input)
    @input = input
    @chunks = chunks
  end

  def chunkify
    chunks = input.split("\n\n")
  end

  def header?
    chunk[0] = '#'
  end

  def first_space
    (chunk.index(" ").to_i)
  end

  def text_start
    1 + first_space
  end

  def text_body
    [text_start..-1]
  end

  def header_number
    text_start - 1
  end

  def header_to_html
    chunks.map do |chunk|
      if header?
        "<h#{header_number}>#{chunk(text_body)}</h#{header_number}>"
      else
        "#{chunk}"
      end
    end
  end


  def mushify
    header_to_html.join("\n\n")
  end
end


  # parse_that_header = HeaderParser.new
  # hey = parse_that_header.chunkify("#This is a heading!\n\nThis is a paragraph.\n\n#Another heading.\n\nParagraph!")
  # p parse_that_header.header_parser(hey)
