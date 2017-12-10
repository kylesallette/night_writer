require 'pry'
require_relative 'library'


class NightReader

  attr_reader :input,
              :output,
              :text

  def initialize
    @library = Library.new
    @text = text
  end

  def read_file(file)
    @text = File.read(file)
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
    @text = convert_braille_to_eng
    new_text = text.strip.scan(/.{6}/)
    new_letters = new_text.map do |letter|
    @library.alphabet.invert[letter]
    end
    p new_letters.join("")
  end
  binding.pry
end

#night = NightReader.new
#night.read_file("../message.txt")
#night.convert_braille_to_eng
