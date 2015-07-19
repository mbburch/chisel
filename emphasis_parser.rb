class EmphasisParser

  attr_reader :chunk

  def initialize(chunk)
    @chunk = chunk
    @emphasis = emphasis?
  end

  def emphasis?
    chunk.include?("*")
  end

  def emphasis_open
    chunk.sub!("*", "<em>")
  end

  def emphasis_close
    chunk.sub!("*", "</em>")
  end

  def emphasis_parser
    while emphasis?
      emphasis_open
      emphasis_close
    end
    @chunk
  end
end

if __FILE__ == $0
  emphasis = EmphasisParser.new
  p emphasis.emphasis_parser
end
