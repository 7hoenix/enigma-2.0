 require './test/test_helper'
 require './lib/rotator'

 class RotatorTest < Minitest::Test
    def test_it_exists
      assert Rotator
    end

    def test_it_returns_a_rotated_value
      rotator = Rotator.new
      input = "a"
      rotation_amount = 7
      assert_equal "h", rotator.rotate(input, rotation_amount)
    end

 end
