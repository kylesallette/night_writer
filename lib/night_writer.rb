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

  def split_braille_lines
    line_1 = []
    line_2 = []
    line_3 = []
    converted = convert_eng_to_braille
    converted.map do |letter|
      line_1.push(letter[0..1])
      line_2.push(letter[2..3])
      line_3.push(letter[4..5])
    end
    @text = (line_1.join + "\n" + line_2.join + "\n" + line_3.join + "\n")
  end

end
