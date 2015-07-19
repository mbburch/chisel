
require 'pry'
require './parser_assigner'


class FileIO

  def assign_parser
    parse_it = ParserAssigner.new
    assigned_chunks = chunks.map do |chunk|
      parse_it.assign_chunk
    end
  end

  def html_output
    assign_parser
    assigned_chunks.join("\n\n")
  end

  def process_output
    html = File.open(output,'w+')
    html.write(html_output)
    html.rewind
    handle.rewind
    puts "Converted #{input} (#{handle.readlines.count.to_s} lines) to #{output} (#{html.readlines.count.to_s} lines)"
    handle.close
    html.close
  end
end
