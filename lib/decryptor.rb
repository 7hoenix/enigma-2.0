require './lib/rotator'
require './lib/character_map'
require './lib/key_generator'
require './lib/offset_calculator'
require './lib/slicer'

class Decryptor
  attr_reader :offset, :key

  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
  end

  def decrypt
    slices = Slicer.new.slice(message)
    decrypted_message = slices.map do |slice|
      spot_in_slice = 0
      slice.map do |character|
        rotated_character = Rotator.new.rotate(character, rotation_amount(spot_in_slice))
        spot_in_slice += 1
        rotated_character
      end
    end
    decrypted_message.join
  end

  def rotation_amount(spot_in_slice)
    (key[spot_in_slice..spot_in_slice+1].to_i + offset.to_s[spot_in_slice].to_i)*-1
  end

  protected

  attr_reader :message, :decrypted_message
end
