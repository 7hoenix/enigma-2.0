require './lib/offset_calculator'

class Decrypt
  def initialize(encrypted_file, decrypted_file, key, formatted_date)
    @encrypted_file = encrypted_file
    @decrypted_file = decrypted_file
    @decryption_key = key
    @offset = OffsetCalculator.calculate(formatted_date.to_i)
  end

  def read_encrypted_file
    File.read(encrypted_file)
  end

  protected

  attr_reader :encrypted_file, :decrypted_file
end
