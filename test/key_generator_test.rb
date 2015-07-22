require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    assert KeyGenerator
  end

  def test_it_generates_a_random_key_of_5_digits
    key1 = KeyGenerator.generate(5)
    key2 = KeyGenerator.generate(5)
    key3 = KeyGenerator.generate(5)
    assert_equal 5, key3.length
    refute_equal key1, key2
    refute_equal key2, key3
    refute_equal key3, key1
  end
end
