require './test/test_helper.rb'
require './lib/decryptor.rb'
require './lib/character_map'
require './lib/rotator'
require './lib/slicer'

class DecryptorTest < Minitest::Test
  def test_it_exists
    assert Decryptor
  end

  def test_it_can_decrypt_a_simple_value
    input = "abcd"
    fake_key = "12345"
    decryptor = Decryptor.new(input, fake_key)
    assert_equal "NC6t", decryptor.decrypt
  end

  def test_it_can_translate_a_string
    input = "B84Q"
    fake_key = "29847"
    decryptor = Decryptor.new(input, fake_key)

    assert_equal"lake", decryptor.decrypt
  end

  def test_it_can_decrypt_a_value_using_the_rotator
    input = "U3HV1Vsun.g7n.Eb1BQKv"
    fake_key = "12345"

    decryptor = Decryptor.new(input, fake_key)

    assert_equal "Hello I am Jamiroquai", decryptor.decrypt
  end

  def test_it_has_a_character_map
    skip
    character_map = CharacterMap.new
    assert_equal 66, character_map.map.size
    assert_equal 14, character_map.map["O"]
  end

  def test_it_has_a_rotator_that_returns_a_rotated_value
    skip
    rotator = Rotator.new

    decrypted_value = rotator.rotate("a", 6)

    assert_equal "g", decrypted_value
  end

  def test_it_can_handle_the_new_character_map
    skip
    input = "N0cr"
    fake_key = "12345"
    decryptor = Decryptor.new(input, fake_key)

    assert_equal"ABCD", decryptor.decrypt
  end


  def test_it_can_decrypt_a_value_using_the_rotator
    skip
    input = "7Y1pKuYsNftUXvur3vd"

    fake_key = "12345"
    decryptor = Decryptor.new(input, fake_key)

    assert_equal "hello world ..end..", decryptor.decrypt
  end

end
