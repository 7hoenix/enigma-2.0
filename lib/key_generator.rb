class KeyGenerator
  def self.generate(key_size)
    key = ""
    until key.length == key_size
      key += rand(0..9).to_s
      key.to_i.to_s
    end
    key
  end
end
