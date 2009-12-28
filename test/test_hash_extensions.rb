require 'test/unit'
require File.dirname(__FILE__) + '/../lib/hash_extensions'

class TestHashExtensions < Test::Unit::TestCase

  def test_map_keys
    expected = {10 => :a, 20 => :b}
    actual = {1 => :a, 2 => :b}.map_keys{|k| k * 10}
    assert_equal expected, actual
  end
    

  def test_map_array_keys
    expected = {[10, 20, 30] => :a, [40, 50] => :b}
    actual = {[1, 2, 3] => :a, [4,5] => :b}.map_keys{|k| k.map{|cell| cell * 10} }
    assert_equal expected, actual
  end
    

  def test_map_values
    expected = {:a => 10, :b => 20}
    actual = {:a => 1, :b => 2}.map_values{|v| v * 10}
    assert_equal expected, actual
  end

    
  def test_map_array_values
    expected = {:a => [10, 20, 30], :b => [40, 50]}
    actual = {:a => [1, 2, 3], :b => [4,5]}.map_values{|v| v.map{|cell| cell * 10} }
    assert_equal expected, actual
  end

    
  def test_map_pairs
    expected = {'A' => 10, 'B' => 20}
    actual = {'a' => 1, 'b' => 2}.map_pairs{|k, v| [k.upcase, v * 10] }
    assert_equal expected, actual
  end

    
  def test_map_array_pairs
    expected = {%w{A B} => [10, 20, 30], %w{C D} => [40, 50]}
    actual = {[:a, :b] => [1,2,3], [:c, :d] => [4,5]}.map_pairs{|k, v| [k.map{|sym| sym.to_s.upcase}, v.map{|cell| cell * 10}] }
    assert_equal expected, actual
  end


end
