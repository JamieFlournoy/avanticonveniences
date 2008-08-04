require 'test/unit'
require File.dirname(__FILE__) + '/../lib/string_extensions'

class TestStringExtensions < Test::Unit::TestCase
    def test_dehumanize
        d = {'Foo' => 'foo',
             'Foo ' => 'foo',
             'Foo Bar' => 'foo_bar',
             'Foo_Bar' => 'foo_bar',
             "foo\tbar\nbiz \t\n\t \n\t\n baz_ " => 'foo_bar_biz_baz'}
        d.each{|i,o| assert_equal o, i.dehumanize}
    end

    def test_quote
        d = {'Foo' => '~Foo~',
             'Foo~' => '~Foo~~',
             'Foo Bar' => '~Foo Bar~'}
        d.each{|i,o| assert_equal o, i.quote('~')}
    end
    
    def test_single_quote
        d = {'Foo Bar' => "'Foo Bar'"}
        d.each{|i,o| assert_equal o, i.single_quote}
    end
    
    def test_double_quote
        d = {'Foo Bar' => '"Foo Bar"'}
        d.each{|i,o| assert_equal o, i.double_quote}
    end
end