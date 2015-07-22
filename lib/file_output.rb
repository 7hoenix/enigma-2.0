class FileOutput
  def self.write_output(message_to_write, output_file_name)
    writer = File.open(output_file_name, "w")
    writer.write(message_to_write)
    writer.close
  end
end
