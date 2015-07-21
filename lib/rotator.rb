require './lib/character_map'

class Rotator
  attr_reader :map

  def initialize
    @map = CharacterMap.new.map
  end

  def rotate(input, rotation_amount)
    map[(map[input] + rotation_amount) % 39]
  end
end
