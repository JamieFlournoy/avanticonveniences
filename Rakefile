# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/avanti_conveniences.rb'

Hoe.new('AvantiConveniences', AvantiConveniences::VERSION) do |p|
    p.developer('Jamie Flournoy', 'jamie@pervasivecode.com')
    p.extra_deps = [['activesupport', '>= 1.2.6'], ['text-hyphen', '>= 1.0.0']]
end

task :rcov do
    sh 'rcov test/test_*.rb'
end

task :clean_rcov do
    sh 'rm -rf ./coverage/*'
end
task :clean => [:clean_rcov]

# vim: syntax=Ruby
