class CharacterMap
  attr_reader :map

  def initialize
    characters = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ",", "\n"]
    number_of_characters = characters.size
    @map = to_hash(characters.zip((0..number_of_characters).to_a))
  end

  def to_hash(input)
    map_hash = {}
    input.each { |k, v| map_hash[k] = v }
    map_hash
  end
end
