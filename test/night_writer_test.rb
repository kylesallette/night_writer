require './minitest/autorun'
require './minitest/pride'
require './lib/nightwriter'

class NightWriterTest < Minitest::Test
  def test_it_exist
    writer = NightWriter.new
    
