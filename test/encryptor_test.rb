require './test/test_helper.rb'
require './lib/encryptor.rb'
require './lib/character_map'
require './lib/rotator'
require './lib/slicer'

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

  def test_it_can_encrypt_a_value_using_the_rotator
    input = "a"
    encryptor = Encryptor.new(input)

    assert_equal "b", encryptor.encrypt
  end

  def test_it_can_encrypt_a_different_value_using_the_rotator
    input = "z"
    encryptor = Encryptor.new(input)

    assert_equal "9", encryptor.encrypt
  end
end
