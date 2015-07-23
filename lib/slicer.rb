class Slicer
  def initialize
    @sliced = []
  end

  def slice(text)
    text.chars.each_slice(5) { |group| sliced << group }
    sliced
  end

  protected

  attr_reader :sliced
end
