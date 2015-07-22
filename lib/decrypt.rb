require './lib/decryptor'
require './lib/offset_calculator'
require './lib/file_input'
require './lib/file_output'

class Decrypt
  def initialize(encrypted_file = ARGV[0], decrypted_file = ARGV[1], key = ARGV[2], formatted_date = ARGV[3])
    @encrypted_file = encrypted_file
    @decrypted_file = decrypted_file
    @key = key
    @offset = OffsetCalculator.calculate_offset(formatted_date.to_i)
  end

  def decrypt_message
    encrypted_message = read_encrypted_file
    decrypted_message = Decryptor.new(encrypted_message, key, offset).decrypt
    write_decrypted_message_to_file(decrypted_message)
    decrypted_message
  end

  def read_encrypted_file
    FileInput.read_file(encrypted_file)
  end

  def write_decrypted_message_to_file(decrypted_message)
    FileOutput.write_output(decrypted_message, decrypted_file)
  end

  protected

  attr_reader :encrypted_file, :decrypted_file, :key, :offset
end

if __FILE__ == $0
  decrypt = Decrypt.new
  decrypt.decrypt_message
  puts "Created 'decrypted.txt' with the key 82648 and date 030415 "
end
