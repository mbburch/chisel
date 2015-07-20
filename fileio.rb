
require 'pry'
require './parser_assigner'

class FileIO

  attr_reader :handle, :input, :output

  def initialize(input=ARGV[0], output=ARGV[1])
    @handle = File.open(input, "r")
    @chunks = []
    @input = input
    @output = output
  end

  def read_input
    handle.read
  end

  # def make_array(string)
  #   @chunks = string.split("\n\n")
  # end

  def process_output
    html = File.open(output,'w+')
    html.write(html_string)
    html.rewind
    handle.rewind
    puts "Converted #{input} (#{handle.readlines.count.to_s} lines) to #{output} (#{html.readlines.count.to_s} lines)"
    handle.close
    html.close
  end

end

if __FILE__ == $0
  file = FileIO.new
  p file.read_input
end
