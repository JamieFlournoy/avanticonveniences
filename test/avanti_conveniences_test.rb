require 'test/unit'
require File.dirname(__FILE__) + '/../lib/avanti_conveniences'

class AvantiConveniencesTest < Test::Unit::TestCase
    def test_version
        assert defined? AvantiConveniences::VERSION
        assert_not_nil AvantiConveniences::VERSION
    end
end
