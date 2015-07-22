class FileInput
  def self.read_file(input_file)
    File.read(input_file).chomp
  end
end
