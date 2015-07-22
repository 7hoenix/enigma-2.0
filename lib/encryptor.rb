require './lib/rotator'
require './lib/character_map'
require './lib/key_generator'
require './lib/offset_calculator'
require './lib/slicer'

class Encryptor
  attr_reader :offset, :key

  def initialize(message, key = KeyGenerator.generate(5))
    @message = message
    @key = key
    @offset = OffsetCalculator.calculate
  end

  def encrypt
    slices = Slicer.new.slice(message)
    encrypted_message = slices.map do |slice|
      spot_in_slice = 0
      slice.map do |character|
        rotated_character = Rotator.new.rotate(character, rotation_amount(spot_in_slice))
        spot_in_slice += 1
        rotated_character
      end
    end
   encrypted_message.join
  end

  def rotation_amount(spot_in_slice)
    key[spot_in_slice..spot_in_slice+1].to_i + offset.to_s[spot_in_slice].to_i
  end

  protected

  attr_reader :message, :encrypted_message
end
