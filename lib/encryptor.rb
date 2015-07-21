require './lib/rotator'
require './lib/character_map'

class Encryptor
  def initialize(message)
    @message = message
  end

  def encrypt
    rotator = Rotator.new
    value = message
    amount_to_rotate = 9
    rotator.rotate(value, amount_to_rotate)
  end

  protected

  attr_reader :message
end
