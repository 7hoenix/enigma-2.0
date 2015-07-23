require './test/test_helper'
require './lib/character_map'

class CharacterMapTest < Minitest::Test
  def test_it_exists
    assert CharacterMap
  end

  def test_it_has_an_order
    char_map = CharacterMap.new
    assert_equal 66, char_map.map.size
    assert_equal 37, char_map.map["l"]
    assert_equal 65, char_map.map["&"]
  end
end
