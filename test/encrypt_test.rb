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
    skip
    input_file = "./message.txt"
    output_file = "./text_files/encrypted.txt"
    encrypt = Encrypt.new(input_file, output_file)

    encrypt.encrypt_message

    output_message = File.read(output_file)

    assert_equal "hi", output_message

  end

  def test_it_works
    message = "hello world ..end.."
    encryptor = Encryptor.new(message, "12345")
    assert_equal"u\nR5.V28AGJkKWK7qW7", encryptor.encrypt
  end

end
