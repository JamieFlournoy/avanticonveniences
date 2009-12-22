require 'test/unit'
require File.dirname(__FILE__) + '/../lib/string_extensions'
require 'shoulda'

gem 'activesupport', '>= 1.2.6'
require 'active_support' # for .humanize

class TestStringExtensions < Test::Unit::TestCase
  context 'String#dehumanize' do
    [ ['Hello, World', 'hello_world'],
      ['$$$123#456',   '123_456'],
      ['a_b_c_',       'a_b_c'],
      ['/etc/passwd',  'etc_passwd'],
      ['Foo',          'foo'],
      ['Foo Bar',      'foo_bar'],
      ['Foo_Bar',      'foo_bar'],
      ["foo\tbar\nbiz \t\n\t \n\t\n baz_ ", 'foo_bar_biz_baz'],
    ].each do |input, expected|
      should("convert #{input} into #{expected}") do
        assert_equal expected, input.dehumanize
      end
    end

    %w{1 x hello_world 123_456 foo_bar}.each do |round_trippable|
      should "undo humanize(#{round_trippable})" do
        assert_equal round_trippable, round_trippable.humanize.dehumanize
      end
    end
    
    ['1', 'X', 'A herring', 'Hello world'].each do |rehumanizable|
      should "return a value for #{rehumanizable} that humanize can undo correctly" do
        assert_equal rehumanizable, rehumanizable.dehumanize.humanize
      end
      
    end


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
