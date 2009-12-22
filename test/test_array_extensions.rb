require 'test/unit'
require File.dirname(__FILE__) + '/../lib/array_extensions'
require 'shoulda'

module StringMath
  def +(other)
    result = super(other)
    result.extend StringMath
    result
  end
  
  def /(denominator)
    chunk_size = (self.size.to_f / denominator).to_i
    self[0..(chunk_size - 1)]
  end
end


class TestArrayExtensions < Test::Unit::TestCase

  context 'Array.average' do
    should 'return the average of 3 integers' do
      assert_equal 5, [1,3,11].average
    end

    should 'return the average of 3 floats' do
      assert_equal 5.21, [1.1, 3.3, 11.23].average
    end
    
    should 'work on anything that supports +  and / operators' do
      test_data = [1,3,11].map{|n| ('x' * n).extend StringMath}
      assert_equal 'xxxxx', test_data.average
    end
  end

end
