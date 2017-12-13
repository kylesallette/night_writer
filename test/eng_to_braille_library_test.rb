require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/eng_to_braille_library'


class EngToBrailleLibraryTest < Minitest::Test

  def setup
    @library = EngToBrailleLibrary.new
  end

  def test_it_exists
    assert_instance_of EngToBrailleLibrary, @library
  end

end
