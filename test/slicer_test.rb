require './test/test_helper'
require './lib/slicer'

class SlicerTest < Minitest::Test
  def test_it_exists
    assert Slicer
  end

  def test_it_takes_in_a_string_and_returns_an_array_with_each_element_being_4_characters
    slicer = Slicer.new
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "."]]
    assert_equal expected, slicer.slice("hello world.")
  end
end
