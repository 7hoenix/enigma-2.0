require './test/test_helper'
require './lib/encrypt'
require './lib/encryptor'
require './lib/file_input'
require './lib/file_output'

class EncryptTest < Minitest::Test
  def test_it_exists
    assert Encrypt
  end

  def test_it_can_grab_input_from_a_file_encrypt_it_with_a_super_basic_encryption_and_print_it
    input_file = "./message.txt"
    output_file = "./text_files/encrypted.txt"
    encrypt = Encrypt.new(input_file, output_file)

    message = encrypt.get_message_from_input_file
    encrypted_message = Encryptor.new(message).encrypt
    encrypt.write_encrypted_message_to_output_file(encrypted_message)

    assert_equal encrypted_message, File.read(output_file)
  end

  def test_it_works
    input_file = "./message.txt"
    output_file = "./text_files/encrypted.txt"
    encrypt = Encrypt.new(input_file, output_file)

    encrypted_message = encrypt.encrypt_message

    assert_equal encrypted_message, File.read(output_file)
  end

end
