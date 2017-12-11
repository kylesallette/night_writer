require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require '../lib/night_writer'


class NightWriterTest < Minitest::test

  def test_can_read_in_a_file
    night = NightWriter.new

    night.read_file("Hello")

    assert_equal "hello", night.input
  end
  de

end
