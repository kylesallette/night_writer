require 'pry'
require_relative 'library'


class NightWriter

  attr_reader :input,
              :output,
              :text

  def initialize
    @input = ARGV[0]
    @output = ARGV[1]
    @library = Library.new
    @text = text
  end


  def read_file
    @text = File.read(input)
  end

  def write_file
    File.open(output ,'w') { |file| file.write(text)}
  end

  def convert_eng_to_braille
    split_text = text.strip.split("")
    split_text.map do |letter|
      @library.alphabet[letter]
    end
  end


end
