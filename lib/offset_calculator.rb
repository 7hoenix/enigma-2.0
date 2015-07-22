class OffsetCalculator

  def self.calculate_offset(formatted_date)
    (formatted_date ** 2).to_s[-4..-1].to_i
  end

  def self.calculate
    date = Time.now
    self.calculate_offset(date.strftime("%d%m%y").to_i)
  end
end
