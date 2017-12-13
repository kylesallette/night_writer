require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/braille_to_eng_library'


class LibraryTest < Minitest::Test


  def setup
    @library = Library2.new
  end

  def test_it_exists
    assert_instance_of Library2, @library
  end

end
