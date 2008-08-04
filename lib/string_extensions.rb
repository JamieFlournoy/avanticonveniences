require 'rubygems'
gem 'activesupport', '>= 1.2.6'
require 'active_support/core_ext/string' # for titleize

class String
    def dehumanize # domo arigato!
        titleize.gsub(/\s/,'').underscore
    end

    def quote(quote_char)
        return "#{quote_char}#{self}#{quote_char}"
    end
    def single_quote; return self.quote("'"); end
    def double_quote; return self.quote('"'); end
end
