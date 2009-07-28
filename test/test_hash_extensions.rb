require 'test/unit'
require File.dirname(__FILE__) + '/../lib/hash_extensions'

class TestHashExtensions < Test::Unit::TestCase
  def test_map_keys
    expected = {10 => :a, 20 => :b}
    actual = {1 => :a, 2 => :b}.map_keys{|k| k * 10}
    assert_equal expected, actual
  end
    
  def test_map_values
    expected = {:a => 10, :b => 20}
    actual = {:a => 1, :b => 2}.map_values{|k| k * 10}
    assert_equal expected, actual
  end
    
  def test_map_pairs
    expected = {'A' => 10, 'B' => 20}
    actual = {'a' => 1, 'b' => 2}.map_pairs{|k, v| [k.upcase, v * 10] }
    assert_equal expected, actual
  end
    
end
