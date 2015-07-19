
require 'pry'
require './parser_assigner'


class Chisel

  attr_accessor :chunks, :handle, :input

  def initialize(input=ARGV[0])
    @handle = File.open(input, "r")
    @markdown = handle.read
    @chunks = chunks
    @input = input


  end

  def load_input
    @chunks = @markdown.split("\n\n")
    # p @chunks
    parse_it = ParserAssigner.new
    assigned_chunks = []
    @chunks.each do |chunk|
      chunk.rstrip
      assigned_chunks << parse_it.assign_chunk(chunk)
    end
    final = assigned_chunks.join("\n\n")
    html = File.open(ARGV[1],'w+')
    html.write(final)
    html.rewind
    handle.rewind
    puts "Converted #{input} (#{handle.readlines.count.to_s} lines) to #{ARGV[1]} (#{html.readlines.count.to_s} lines)"
    handle.close
    html.close
  end

  # def assign_parser
  #
  #   # parse_it = ParserAssigner.new
  #   # @chunks.each do |chunk|
  #   #   chunk.rstrip
  #   #   assigned_chunks << parse_it.assign_chunk(chunk)
  #   # end
  #   # assigned_chunks.join("\n\n")
  # end

  # def html_output
  #   assign_parser
  #   assigned_chunks.join("\n\n")
  # end
  # binding.pry
  # def process_output
  #   # html = File.open(output,'w+')
  #   # html.write(assign_parser)
  #   # html.rewind
  #   # handle.rewind
  #   # puts "Converted #{input} (#{handle.readlines.count.to_s} lines) to #{output} (#{html.readlines.count.to_s} lines)"
  #   # handle.close
  #   # html.close
  # end
end

chisel = Chisel.new.load_input
