require './test/test_helper'
require './lib/encrypt'
require './lib/encryptor'
require './lib/file_input'
require './lib/file_output'

class EncryptTest < Minitest::Test
  def test_it_exists
    assert Encrypt
  end

  def test_it_can_get_a_file
   # $ ruby ./lib/encrypt.rb message.txt encrypted.txt
   # Created 'encrypted.txt' with the key 82648 and date 030415
   input_handle = FileInput.new
   message = input_handle.load_file("./message.txt")
   assert_equal "hi", message.chomp
  end

  def test_it_can_grab_input_from_a_file_encrypt_it_with_a_super_basic_encryption_and_print_it
    skip
    input_file = "./message.txt"
    output_file = "./text_files/encrypted_message.txt"
    encrypt = Encrypt.new(input_file, output_file)

    encrypt.encrypt_message

    output_message = File.read(output_file)

    assert_equal "hi", output_message

  end

  def test_it_works
    skip
    message = "hello world ..end.."
    encryptor = Encryptor.new
    assert_equal"u3iw1wtz4 ailxbyqx8", encryptor.encrypt(message)
  end

end
