require 'test/unit'
require File.dirname(__FILE__) + '/../lib/arg_checks'

class TestArgChecks < Test::Unit::TestCase
  include ArgChecks

  def test_arg_type
    assert_nothing_raised(ArgumentError) { arg_dummy('s', 3.0) }
    assert_raise(ArgumentError) { arg_dummy('s', 3) }
    assert_raise(ArgumentError) { arg_dummy('blah blah', 'x') }
    assert_raise(ArgumentError) { arg_dummy(3.0, 3.0) }

    assert_nothing_raised(ArgumentError) { arg_dummy2('s', -1.0, 10.0, 'x') }
    assert_raise(ArgumentError) { arg_dummy2(-1.0, 10.0, 'x', 'blah') }
  end

  def test_arg_required
    assert_raise(ArgumentError) { arg_dummy5(nil, nil) }
    assert_raise(ArgumentError) { arg_dummy5(nil, 3.0) }
    assert_raise(ArgumentError) { arg_dummy5('blah', nil) }
    assert_nothing_raised(ArgumentError) { arg_dummy5('blah', 3.0) }
  end
  
  def arg_dummy5(arg1, arg2)
      arg_required arg1, arg2
  end

  def arg_dummy(arg1_string, arg2_float)
    arg_type String, arg1_string
    arg_type Float, arg2_float
  end

  def arg_dummy2(arg1_string, arg2_float, arg3_float, arg4_string)
    arg_type String, arg1_string, arg4_string
    arg_type Float, arg2_float, arg3_float
  end
  
  def test_arg_min
    assert_raise(ArgumentError) {arg_dummy3(5, 'z')}
    assert_raise(ArgumentError) {arg_dummy3(100, 'x')}
    assert_nothing_raised(ArgumentError) {arg_dummy3(100, 'z')}
  end

  def arg_dummy3(arg1, arg2)
    arg_min 6, arg1
    arg_min 'y', arg2
  end
    
  def test_arg_max
    assert_raise(ArgumentError) {arg_dummy4(100, 'z')}
    assert_raise(ArgumentError) {arg_dummy4(5, 'z')}
    assert_nothing_raised(ArgumentError) {arg_dummy4(5, 'x')}
  end

  def arg_dummy4(arg1, arg2)
    arg_max 6, arg1
    arg_max 'y', arg2
  end

    @@hash = {'k1' => 'v1', 'k2'=>'v2'}

    def test_arg_hash_keys_exact
        assert_nothing_raised(ArgumentError) { arg_hash_keys_exact %w{k1 k2}, @@hash }

        assert_raise(ArgumentError) { arg_hash_keys_exact %w{k1},       @@hash}
        assert_raise(ArgumentError) { arg_hash_keys_exact %w{k2},       @@hash }
        assert_raise(ArgumentError) { arg_hash_keys_exact %w{k1 k2 k3}, @@hash }
    end
  
    def test_arg_hash_keys_required
        assert_nothing_raised(ArgumentError) { arg_hash_keys_required %w{k1 k2}, @@hash }
        assert_nothing_raised(ArgumentError) { arg_hash_keys_required %w{k1},    @@hash }
        assert_nothing_raised(ArgumentError) { arg_hash_keys_required %w{k2},    @@hash }
    
        assert_raise(ArgumentError) { arg_hash_keys_required %w{k1 k2 k3}, @@hash }   
    end

    def test_arg_hash_keys_limit
        assert_nothing_raised(ArgumentError) { arg_hash_keys_limit %w{k1 k2},   %w{k3},       @@hash }
        assert_nothing_raised(ArgumentError) { arg_hash_keys_limit %w{k1},      %w{k2 k3},    @@hash }
        assert_nothing_raised(ArgumentError) { arg_hash_keys_limit %w{k2},      %w{k1 k3},    @@hash }
        assert_nothing_raised(ArgumentError) { arg_hash_keys_limit [],          %w{k1 k2 k3}, @@hash }
    
        assert_raise(ArgumentError) { arg_hash_keys_limit %w{k1 k2 k3}, [],         @@hash }
        assert_raise(ArgumentError) { arg_hash_keys_limit %w{k1 k3},    %w{k2},     @@hash }   
        assert_raise(ArgumentError) { arg_hash_keys_limit %w{k3},       %w{k1, k2}, @@hash }
        assert_raise(ArgumentError) { arg_hash_keys_limit [],           [],         @@hash }
    end
    
    def test_named_arg_required
        assert_nothing_raised(ArgumentError){ named_arg_required('foo', 1) }
        assert_raise(ArgumentError){ named_arg_required('bar', nil) }
    end

    def test_named_args_required
        assert_nothing_raised(ArgumentError){ named_args_required({}) }
        assert_nothing_raised(ArgumentError){ named_args_required(:foo => 1) }
        assert_raise(ArgumentError){ named_args_required(:bar => nil) }
        assert_raise(ArgumentError){ named_args_required(:foo => 1, :bar => nil) }
    end

  def test_arg_respond_to
    assert_nothing_raised(ArgumentError) { arg_dummy6(:round, 1.1) }
    assert_nothing_raised(ArgumentError) { arg_dummy6(:round, Float::EPSILON) }
    assert_raise(ArgumentError) { arg_dummy6(:round, 'a') }
    assert_raise(ArgumentError) { arg_dummy6(:round, [0]) }
    assert_raise(ArgumentError) { arg_dummy6(:round, Object) }
  end

  def arg_dummy6(arg1, arg2)
      arg_responds_to arg1, arg2
  end
end
