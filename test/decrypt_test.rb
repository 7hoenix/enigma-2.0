require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test
  def test_it_exists
    assert Decrypt
  end

  def test_it_reads_in_a_message_from_an_input_file
    encrypted_file = "./test/text_files/encrypted.txt"
    decrypted_file = "./test/text_files/decrypted.txt"
    key = "52377"
    date = "230715"
    decrypt = Decrypt.new(encrypted_file, decrypted_file, key, date)

    decrypted_message = decrypt.decrypt_message

    assert_equal "hi world ..end..", decrypted_message

    decrypt.write_decrypted_message_to_file(decrypted_message)
  end

end
