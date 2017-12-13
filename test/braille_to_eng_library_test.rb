require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/braille_to_eng_library'


class BrailleToEngLibraryTest < Minitest::Test


  def setup
    @library = BrailleToEngLibrary.new
  end

  def test_it_exists
    assert_instance_of BrailleToEngLibrary, @library
  end

end
