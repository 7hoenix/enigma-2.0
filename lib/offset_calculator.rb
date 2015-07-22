class OffsetCalculator
  def self.calculate(date = Time.now)
    (date.strftime("%d%m%y").to_i ** 2).to_s[-4..-1].to_i
  end
end
