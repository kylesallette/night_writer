require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/night_writer'


class NightWriterTest < Minitest::Test

  def setup
    @night = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @night
  end

  def test_can_convert_one_letter
    assert_equal ["0....."], @night.convert_eng_to_braille("a")
  end

  def test_can_convert_two_letters
    assert_equal ["0.....", "0.0..."], @night.convert_eng_to_braille("ab")
  end

  def test_can_convert_five_letters
    expected = ["0.....", "0.0...", "00....", "00.0..", "0..0.."]
    assert_equal expected, @night.convert_eng_to_braille("abcde")
  end

  def test_can_convert_serperated_letters
    expected = ["0.....","......", "0.0..."]
    assert_equal expected, @night.convert_eng_to_braille("a b")
  end

  def test_can_convert_multiple_serperated_letters
    expected = ["0.....","......", "0.0...","......","00...."]
    assert_equal expected, @night.convert_eng_to_braille("a b c")
  end

  def test_can_convert_capital_letter
    assert_equal [[".....0","0....."]],@night.convert_eng_to_braille("A")
  end

  def test_can_convert_multiple_capital_letters
    expected = [[".....0","0....."], [".....0", "0.0..."]]
    assert_equal expected, @night.convert_eng_to_braille("AB")
  end
  def test_it_can_space_lower_case
    expected = ["0.....", "......","0.0..."]
    assert_equal expected, @night.convert_eng_to_braille("a b")
  end
   def test_it_can_space_upper_case
     expected = [[".....0", "0....."], "......", [".....0", "00...."]]
     assert_equal expected, @night.convert_eng_to_braille("A C")
   end
end
