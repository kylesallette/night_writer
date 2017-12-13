require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/night_reader'


class NightReaderTest < Minitest::Test

  def setup
    @night = NightReader.new
  end

  def test_it_exists
    assert_instance_of NightReader, @night
  end

  def test_splits_two_lines_of_braille_and_joins
    @night.text = "0.....""\n""0....."

    assert_equal "0.0.........", @night.split_braille
  end

  def test_splits_three_lines_of_braille_and_joins
   @night.text = "0.....""\n""0.....""\n""0....."

   assert_equal "0.0.0.............", @night.split_braille
  end


end
