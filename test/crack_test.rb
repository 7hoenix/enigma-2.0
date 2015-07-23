require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  def test_it_exists
    assert Crack
  end

  def test_it_works
    encrypted_file = "./test/text_files/encrypted.txt"
    cracked_file = "./test/text_files/cracked.txt"
    formatted_date = "220715"
    cracker = Crack.new(encrypted_file, cracked_file, formatted_date)

    cracked_message = cracker.crack
    assert_equal "52377", cracker.cracked_key

  end
end
