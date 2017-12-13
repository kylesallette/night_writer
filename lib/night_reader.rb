require 'pry'
require_relative 'braille_to_eng_library'


class NightReader

  attr_reader   :input,
                :output,
                :converted

  attr_accessor :text

  def initialize
    @input = ARGV[0]
    @output = ARGV[1]
    @library = Library2.new
    @text = text
    @converted = []
  end

  def read_file
    @text = File.read(input)
    split_every_six
  end

  def write_file
    File.open(output, 'w') { |file| file.write(text)}
    puts "Created #{output} containing #{text.length} characters"
  end

  def split_braille
    split_text = @text.split("\n")
    result = ""
      until split_text[0].empty?
        split_text.each do |line|
          result << line.slice!(0,2)
        end
      end
     result
  end

  def split_every_six
    text = split_braille
    new_text = text.chars.each_slice(6).map(&:join)
    @text = new_text.map.with_index do |x,i|
      if x == ".....0"
        x + new_text[i + 1]
      else
        x
      end
    end
    check_for_caps_translate
  end

  def check_for_caps_translate
    @text.map.with_index do |x, i|
      if x.length >= 12
        @text.delete_at(i + 1)
      end
    end
    translate(text)
  end

  def translate(text)
    text.map do |letter|
      converted << @library.alphabet[letter]
    end
    @text = converted.join("")
    write_file
   end

end
