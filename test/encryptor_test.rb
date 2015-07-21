require './test/test_helper.rb'
require './lib/encryptor.rb'
require './lib/character_map'

class EncryptorTest < Minitest::Test
  def test_it_exists
    assert Encryptor
  end

  def test_it_has_a_character_map
    character_map = CharacterMap.new
    assert_equal 39, character_map.map.size
    assert_equal "z", character_map.map[26]
    assert_equal " ", character_map.map[37]
  end

  def test_it_has_a_rotator_that_returns_a_rotated_value
    rotator = Rotator.new

    encrypted_value = rotator.rotate("a", 6)

    assert_equal "f", encrypted_value
  end
end
