class ParagraphParser

  def chunkify(input)
    chunked_text = input.split("\n\n")
  end

  def paragraph_parser(chunked_text)
    paragraphed_chunks = chunked_text.map do |chunk|
      if chunk[0] != "#"
        "<p>#{chunk}</p>"
      else
        "#{chunk}"
      end
    end
  end

  def mushify(paragraphed_chunks)
    paragraphed_chunks.join("\n\n")
  end

end
