require 'test/unit'
require File.dirname(__FILE__) + '/../lib/die'
require 'shoulda'

class TestDie < Test::Unit::TestCase

  context 'Die.roll' do
    setup do
      seed = 1234567890 
      srand(seed)
      @expected_rand = rand
      srand(seed)
    end

    should 'return a value between 1 and the number of sides' do
      sides = 1000
      expected = (@expected_rand * sides + 1).to_i
      assert_equal expected, Die.roll(sides)
    end
  end

end
