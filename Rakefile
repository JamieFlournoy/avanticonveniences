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

# stats
begin
    gem 'rails'
    require 'code_statistics'
    namespace :spec do
        desc "Use Rails's rake:stats task for a gem"
        task :statsetup do
            class CodeStatistics
                def calculate_statistics
                    @pairs.inject({}) do |stats, pair|
                        if 3 == pair.size
                            stats[pair.first] = calculate_directory_statistics(pair[1], pair[2]); stats
                        else
                            stats[pair.first] = calculate_directory_statistics(pair.last); stats
                        end
                    end
                end
            end
            ::STATS_DIRECTORIES = [['Libraries',   'lib',  /\.(sql|rhtml|erb|rb|yml)$/],
                                   ['Tests',       'test', /\.(sql|rhtml|erb|rb|yml)$/]]
            ::CodeStatistics::TEST_TYPES << "Tests"
        end
    end
    desc "Report code statistics (KLOCs, etc) from the application"
    task :stats => "spec:statsetup" do
        CodeStatistics.new(*STATS_DIRECTORIES).to_s
    end
rescue Gem::LoadError => le
    task :stats do
        raise RuntimeError, "'rails' gem not found - you must install it in order to use this task.\n"
    end
end
