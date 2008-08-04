require 'rubygems'
gem 'activesupport', '>= 1.2.6'
require 'active_support/core_ext/string' # for titleize

class String
    # Convert a string consisting of whitespace separated words into an underscore-delimited
    # set of lowercase words. This is the opposite of what ActiveSupport's String.humanize
    # method docs.
    # Example: 'Foo Bar' -> 'foo_bar'
    def dehumanize
        titleize.gsub(/\s/,'').underscore
    end

    # Return this string, surrounded by quote_char on either side.
    def quote(quote_char)
        "#{quote_char}#{self}#{quote_char}"
    end
    
    # Return this string, surrounded by a single quote (') on either side.
    def single_quote; self.quote("'"); end
    
    # Return this string, surrounded by a double quote (") on either side.
    def double_quote; self.quote('"'); end
end
