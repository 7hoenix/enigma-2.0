require './test/test_helper'
require './lib/file_output'

class FileOutputTest < Minitest::Test
  def test_it_exists
    assert FileOutput
  end

  def test_it_can_output_to_a_file
    message_to_write = "hi"
    output_file_name = "./text_files/encrypted.txt"

    FileOutput.write_output(message_to_write, output_file_name)

    assert_equal "hi", File.read(output_file_name)
  end
end
