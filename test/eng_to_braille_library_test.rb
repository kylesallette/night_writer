require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/eng_to_braille_library'


class LibraryTest < Minitest::Test

  def setup
    @library = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @library
  end

end
