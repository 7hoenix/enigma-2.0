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
    offset = "11225"
    decryptor = Decryptor.new(input, fake_key, offset)
    assert_equal "ND6w", decryptor.decrypt
  end

  def test_it_can_translate_a_string
    input = "7mz."
    fake_key = "87797"
    offset = "11225"
    decryptor = Decryptor.new(input, fake_key, offset)

    assert_equal"lake", decryptor.decrypt
  end

  def test_it_can_decrypt_a_value_using_the_rotator
    input = "oh6dzDz9jwk&S3pugS3"
    fake_key = "06856"
    offset = "11225"
    decryptor = Decryptor.new(input, fake_key, offset)

    assert_equal "hello world ..end..", decryptor.decrypt
  end

end
