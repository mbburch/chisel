class StrongParser

  attr_reader :input, :chunks

  def initialize(input)
    @input = input
    @chunks = chunks
  end

  def chunkify
    chunks = input.split("\n\n")
  end

  def asterisk_searcher
    if chunk.include? ("**")
      chunk.split
    else
      "#{chunk}"
    end
  end

  def strong_elements
    chunks.map do |chunk|
      strong_searcher
  end

  def strong_array
    strong_elements.map { |element| strong_parser }
  end

  def strong?
    string[0..1] == ("**")
    # && string[-2..-1] == ("**")
  end

  def
    string[2..-1]
  end


  def strong_string
    element.map do |string|
      if strong?
        "<s>#{remove_asterisks}</s>"
      else
        "#{string}"
      end
  end

  def strong_parser
    if element == Array
      strong_string
    else
      "#{element}"
    end
  end

  def mushify_level_one
    strong_string.join(" ")
  end

  def mushify_final
    strong_elements.join("\n\n")
  end

end
