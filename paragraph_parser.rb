class ParagraphParser

  attr_reader :paragraph_parser, :chunk

  def initialize(chunk)
    @paragraph_parser
    @chunk = chunk
  end

  def paragraph?
    chunk[0] != "#"
  end

  def paragraph_parser
    "<p>#{chunk.strip}</p>"
  end

end

if __FILE__ == $0
  paragraph = ParagraphParser.new
  p paragraph.paragraph_parser
end
