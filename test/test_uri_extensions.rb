require 'test/unit'
require File.dirname(__FILE__) + '/../lib/uri_extensions'

class TestUriExtensions < Test::Unit::TestCase
    def test_uri_generic_query_from_hash
        assert_equal '?a=1&b=2', URI::Generic.query_from_hash('a'=>1, 'b'=>2)
        assert_equal '?:a=1&a=11&b=2', URI::Generic.query_from_hash(:a=>1, 'b'=>2, 'a'=>11)
        assert_equal '?biz=b%20a%20z&foo=bar', URI::Generic.query_from_hash('foo' => 'bar', 'biz' => 'b a z')

        h = HashWithIndifferentAccess.new
        h.merge! :a=>1, :b=>2
        assert_equal '?a=1&b=2', URI::Generic.query_from_hash(h)
    end
end