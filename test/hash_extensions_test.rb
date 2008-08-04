require File.dirname(__FILE__) + '/../lib/hash_extensions'

class HashExtensionsTest < Test::Unit::TestCase
    def test_rekey
        test_data = {{'foo' => 1, 'aBc' => 2}  =>  ['ABC', 'FOO']}
        test_data.each{|i,o| assert_equal o, i.rekey{|k| k.upcase}.keys.sort }
    end
end
