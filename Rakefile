# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/avanti_conveniences.rb'

Hoe.new('AvantiConveniences', AvantiConveniences::VERSION) do |p|
    p.developer('Jamie Flournoy', 'jamie@pervasivecode.com')
end

task :rcov do
    sh 'rcov test/test_*.rb'
end

# vim: syntax=Ruby
