require 'pry'
require_relative 'braille_to_eng_library'


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
    split_every_six
  end

  def write_file
    File.open(output, 'w') { |file| file.write(text)}
    puts "Created #{output} containing #{text.length} characters"
  end

  def convert_braille_to_eng(text)
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
    @text = convert_braille_to_eng(text)
    new_text = text.chars.each_slice(6).map(&:join)
    added_text = new_text.each_with_index.map do |x,i|
      if x == ".....0"
        x + new_text[i + 1]
      else
        x
      end
    end
    added_text.map do |letter|
     converted << @library.alphabet.invert[letter]
     end
    @text = converted.join("")
    write_file
   end

end
