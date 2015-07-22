require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test
  def test_it_exists
    assert Decrypt
  end

  def test_it_reads_in_a_message_from_an_input_file
    encrypted_file = "./test/text_files/encrypted.txt"
    decrypted_file = "./test/text_files/decrypted.txt"
    key = "12345"
    date = "220715"
    decrypt = Decrypt.new(encrypted_file, decrypted_file, key, date)

    encrypted_message = decrypt.read_encrypted_file
    decrypted_message = decrypt_message(encrypted_message)
    write_decrypted_message_to_file(decrypted_message)

    message_check = File.read(decrypted_file)
    assert_equal "hello world ..end..", message_check
  end
end
