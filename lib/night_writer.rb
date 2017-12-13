require 'pry'
require_relative 'eng_to_braille_library'


class NightWriter

  attr_reader :input,
              :output,
              :text,
              :data

  def initialize
    @input = ARGV[0]
    @output = ARGV[1]
    @library = EngToBrailleLibrary.new
    @text = text
    @data = []
  end


  def read_file
    @text = File.read(input)
    split_braille_lines(text)
  end

  def write_file
    File.open(output ,'w') { |file| file.write(text)}
    puts "Created #{output} containing #{text.length} characters"
  end

  def convert_eng_to_braille(text)
    split_text = text.strip.split("")
    split_text.map do |letter|
      @library.alphabet[letter]
    end
  end

  def split_braille_lines(text)
    line_1, line_2, line_3 = [], [], []
    converted = convert_eng_to_braille(text).flatten
    converted.map do |letter|
      line_1.push(letter[0..1])
      line_2.push(letter[2..3])
      line_3.push(letter[4..5])
    end
   @data << line_1.slice!(80..-1) << line_2.slice!(80..-1) << line_3.slice!(80..-1)
   @text = (line_1.join + "\n" + line_2.join + "\n" + line_3.join)
    wrap_lines_over_80
  end

  def wrap_lines_over_80
    if data[0] != nil
      new_text = @text.split("\n")
      @text =  (new_text[0] + "\n" + new_text[1] + "\n" + new_text[2] + "\n\n" +
      data[0].join + "\n" + data[1].join + "\n" + data[2].join)
    end
    write_file
  end

end
