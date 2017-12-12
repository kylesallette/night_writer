require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/night_reader'


class NightWriterTest < Minitest::Test

  def setup
    @night = NightReader.new
  end

  def test_it_exists
    assert_instance_of NightReader, @night
  end

end 
