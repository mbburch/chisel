require 'pry'

class StrongParser

  attr_reader :chunk

  def initialize(chunk)
    @chunk = chunk
  end

  def strong
    chunk.include?("**")
  end

  def strong_open
      chunk.sub!("**", "<strong>")
    end

  def strong_close
      chunk.sub!("**", "</strong>")
    end

  def strong_parser
    while strong == true
      strong_open
      strong_close
    end
    @chunk
  end
end

if __FILE__ == $0
  strong = StrongParser.new("**strong**")
  p strong.strong_parser
end
