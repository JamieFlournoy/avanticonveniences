# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/avanti_conveniences.rb'

Hoe.new('AvantiConveniences', AvantiConveniences::VERSION) do |p|
  p.developer('Jamie Flournoy', 'jamie@pervasivecode.com')
  p.test_globs.push 'test/**/*_test.rb'
end

task :rcov do
   sh 'rcov test/*_test.rb'
end

# vim: syntax=Ruby
