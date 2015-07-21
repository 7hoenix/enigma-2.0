require './lib/rotator'
require './lib/character_map'

class Encryptor
  attr_reader :offset, :key

  def initialize(message)
    @message = message
    @encrypted_message = []
    @key = KeyGenerator.generate
    @offset = OffsetCalculator.calculate
  end

  def encrypt
    slices = Slicer.new.slice(message)
    slices.map do |slice|
      spot_in_slice = 1
      slice.map do |character|
        Rotator.new.rotate(character, rotation_amount(spot_in_slice))
        spot_in_slice += 1
      end
      spot_in_slice = 0
    end
  end

  def rotation_amount(spot_in_slice)
    key[spot_in_slice-1..spot_in_slice] + offset[spot_in_slice]
  end

  protected

  attr_reader :message
end
