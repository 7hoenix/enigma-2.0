require './lib/character_map'

class Rotator

  def initialize
    @map = CharacterMap.new.map
  end

  def rotate(input, rotation_amount)
    character_value = (map[input].to_i + rotation_amount) % 66
    map.key(character_value)
  end

  protected

  attr_reader :map
end
