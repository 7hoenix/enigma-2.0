require './test/test_helper'
require './lib/file_input'

class FileInputTest < Minitest::Test
  def test_it_exists
    assert FileInput
  end

  def test_it_loads_a_file
    file_in = FileInput.new
    input_file = "./message.txt"
    file_in.load_file(input_file)
  end
end
