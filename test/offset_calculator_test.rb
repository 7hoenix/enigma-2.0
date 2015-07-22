require './test/test_helper'
require './lib/offset_calculator'

class OffsetCalculatorTest < Minitest::Test
  def test_it_exists
    assert OffsetCalculator
  end

  def test_it_returns_the_last_4_digits_of_the_square_of_todays_date
    offset = OffsetCalculator.calculate

    assert_equal "1225", offset
  end

end
