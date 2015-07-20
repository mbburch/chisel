
require 'pry'
require './parser_assigner'

class Chisel

  attr_reader :chunks, :handle, :input, :output, :assigned_chunks

  def initialize(input=ARGV[0], output=ARGV[1])
    @handle = File.open(input, "r")
    @chunks = []
    @input = input
    @output = output
    @assigned_chunks = []
  end

  def load_input
    markdown = handle.read
    @chunks = markdown.split("\n\n")
  end

  def assign_parser
    parse_it = ParserAssigner.new
    @chunks.each do |chunk|
      assigned_chunks << parse_it.assign_chunk(chunk)
    end
  end

  def join_html
    assign_parser
    @assigned_chunks.join("\n\n")
  end

  def process_output
    html = File.open(output,'w+')
    html.write(join_html)
    html.rewind
    handle.rewind
    puts "Converted #{input} (#{handle.readlines.count.to_s} lines) to #{output} (#{html.readlines.count.to_s} lines)"
    handle.close
    html.close
  end
end

chisel = Chisel.new
chisel.load_input
chisel.process_output
