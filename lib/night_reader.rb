require 'pry'
require_relative 'library_2'


class NightReader

  attr_reader :input,
              :output,
              :text

  def initialize
    @input = ARGV[0]
    @output = ARGV[1]
    @library = Library2.new
    @text = text
  end

  def read_file
    @text = File.read(input)
  end

  def write_file(file)
    File.open(output, 'w') { |file| file.write(file)}
  end

  def convert_braille_to_eng
    split_text = text.split("\n")
    result = ""
      until split_text[0].empty?
        split_text.each do |line|
          result << line.slice!(0,2)
        end
      end
      result
  end

  def split_every_six
    converted = []
    @text = convert_braille_to_eng
    new_text = text.chars.each_slice(6).map(&:join)
      new_text.each_with_index.map do |x,i|
        if x == ".....0"
          x + x[i + 1]
        end
      end
    new_text.map do |letter|
      converted << @library.alphabet.invert[letter]
     end
     converted.join("")

  end
  binding.pry
end

#night = NightReader.new
#night.read_file("../message.txt")
#night.convert_braille_to_eng
