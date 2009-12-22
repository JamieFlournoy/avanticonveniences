require 'test/unit'
require File.dirname(__FILE__) + '/../lib/array_extensions'
require 'shoulda'

gem 'activesupport', '>= 1.2.6'
require 'active_support' # for .hour, .hours, .second

class TestArrayExtensions < Test::Unit::TestCase

  context 'Time#at_midnight' do
    [ ['2009-12-01 01:00:00', 1.hour                ],
      ['2009-12-01 00:00:00', 0                     ],
      ['2009-12-01 23:59:59', (24.hours - 1.second) ],
    ].each do |input, expected|
      should "be #{expected} seconds before #{input}" do
        t = Time.parse(input)
        assert_equal expected, t - t.at_midnight
      end
    end
  end


end