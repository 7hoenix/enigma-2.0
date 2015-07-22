require './lib/cracker'
require './lib/offset_calculator'
require './lib/file_input'
require './lib/file_output'


class Crack
  attr_reader :cracked_key

  def initialize(encrypted_file = ARGV[0], cracked_file = ARGV[1], formatted_date = ARGV[2])
    @encrypted_file = encrypted_file
    @cracked_file = cracked_file
    @offset = OffsetCalculator.calculate_offset(formatted_date.to_i)
  end

  def crack
    encrypted_message = FileInput.read_file(encrypted_file)
    cracker = Cracker.new(encrypted_message, offset)
    cracked_message = cracker.crack
    @cracked_key = cracker.cracked_key
    FileOutput.write_output(cracked_message, cracked_file)
    cracked_message
  end

  protected

  attr_reader :encrypted_file, :cracked_file, :offset
end

if __FILE__ == $0
  crack = Crack.new
  crack.crack
  puts "Created 'cracked.txt' with the cracked key #{crack.cracked_key} and date #{ARGV[2]}"
end
