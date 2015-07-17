require 'pry'
require './header_parser'

class Chisel

handle = File.open(ARGV[0], 'r')
markdown_input = handle.read
handle.close

  attr_reader :input, :chunks

  def initialize(input)
    @input = input
    @chunks = chunks
  end

  def load_input
    input
  end

  def chunkify
    chunks = input.split("\n\n")
  end

end

html_output = File.open(ARGV[1] , 'w')
html_output.write(markdown)  #eventually call a method that triggers parse.
html_output.close
