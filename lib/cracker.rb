require './lib/decryptor'

class Cracker

  attr_accessor :cracked_key, :cracked, :cracked_message
  attr_reader :offset, :encrypted_message

  def initialize(encrypted_message, offset)
    @encrypted_message = encrypted_message
    @offset = offset
    @cracked_key = "00000"
    @cracked = false
  end

  def crack
    until cracked
      decryptor = Decryptor.new(encrypted_message, cracked_key, offset)
      cracked_message = decryptor.decrypt
      self.cracked = true if cracked_message.end_with?("..end..")
      increment_key unless cracked
    end
    cracked_message
  end

  def increment_key
    next_key = cracked_key.to_i
    next_key += 1
    next_key = sprintf("%05d", next_key)
    self.cracked_key = next_key
  end

end
