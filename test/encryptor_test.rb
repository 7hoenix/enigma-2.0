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
    assert_equal 66, character_map.map.size
    assert_equal 14, character_map.map["O"]
  end

  def test_it_has_a_rotator_that_returns_a_rotated_value
    rotator = Rotator.new

    encrypted_value = rotator.rotate("a", 6)

    assert_equal "g", encrypted_value
  end

  def test_it_can_handle_the_new_character_map
    input = "Hello I am Jamiroquai"
    fake_key = "12345"
    encryptor = Encryptor.new(input, fake_key)

    assert_equal"U3HV1Vsun.g7n.Eb1BQKv", encryptor.encrypt
  end


  def test_it_can_translate_a_string
    skip
    input = "lake"
    fake_key = "29847"
    encryptor = Encryptor.new(input, fake_key)

    assert_equal"B84Q", encryptor.encrypt
  end

  def test_it_can_encrypt_a_value_using_the_rotator
    skip
    input = "hello world ..end.."
    fake_key = "12345"
    encryptor = Encryptor.new(input, fake_key)

    assert_equal "u3HV1VSY4" + "\n" + "uKWAXqWh", encryptor.encrypt
  end

end
