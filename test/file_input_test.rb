require './test/test_helper'
require './lib/file_input'

class FileInputTest < Minitest::Test
  def test_it_exists
    assert FileInput
  end

  def test_it_loads_a_file
    input_file = "./message.txt"
    FileInput.read_file(input_file)
  end
end
