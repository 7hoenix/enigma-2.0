require './test/test_helper'
require './lib/character_map'

class CharacterMapTest < Minitest::Test
  def test_it_exists
    assert CharacterMap
  end

  def test_it_has_an_order
    char_map = CharacterMap.new
    assert_equal 39, char_map.map.size
    assert_equal " ", char_map.map[37]
    assert_equal "z", char_map.map[26]
  end
end
