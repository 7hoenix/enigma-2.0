class Encrypt
  def initialize(input_file = ARGV[0], output_file = ARGV[1])
    @input_file = input_file
    @output_file = output_file
  end

  def encrypt_message
    message = get_message_from_input_file
    encryptor = Encryptor.new(message)
    encrypted_message = encryptor.encrypt
    write_encrypted_message_to_output_file(encrypted_message)
  end

  def get_message_from_input_file
    FileInput.new.load_file(input_file).chomp
  end

  def write_encrypted_message_to_output_file(encrypted_message)
    writer = FileOutput.new.output(encrypted_message, output_file)
  end

  protected

  attr_reader :input_file, :output_file
end

if __FILE__ == $0
  puts "Created #{ARGV[1]} with the key #{12345} and date #{Time.now.strftime("%s%p%y")}"
end
