require './test/test_helper'
require './lib/cracker'

class CrackerTest < Minitest::Test
  def test_it_exists
    assert Cracker
  end

  def test_it_cracks_a_code
    encrypted_message = "zANk99DuySP 4RSP"
    offset = 11225
    cracker = Cracker.new(encrypted_message, offset)

    assert_equal "hi world ..end..", cracker.crack
    assert_equal "83152", cracker.cracked_key
  end

  def test_it_cracks_faster
    encrypted_message = "18GC8DvxQXHy73HR"
    offset = 11225
  end
end
