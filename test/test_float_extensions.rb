require 'test/unit'
require File.dirname(__FILE__) + '/../lib/float_extensions'
require 'shoulda'

class TestFloatExtensions < Test::Unit::TestCase

  context 'Float::INFINITY' do
    should 'be greater than 10**100' do
      assert Float::INFINITY > 10**100
    end
    should 'be equal to the absolute value of negative infinity' do
      negative_infinity = -1.0 / 0
      assert_equal negative_infinity.abs, Float::INFINITY
    end
  end

end
