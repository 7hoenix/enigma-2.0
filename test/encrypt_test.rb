require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require './lib/file_input'

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

  def test_sends_the_message_to_the_encryptor
    message = "hello world ..end.."
    encryptor = Encryptor.new
    assert_equal"u3iw1wtz4 ailxbyqx8", encryptor.encrypt(message)
  end

end
